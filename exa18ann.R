# ANN(Artificial Neural Network) : 인공신경망

install.packages("nnet")
library(nnet)

# 논리연산
input <- matrix(c(0,0,1,1,0,1,0,1), ncol=2)
input
# output <- matrix(c(0,0,0,1))  # and
#output <- matrix(c(0,1,1,1))   # or
output <- matrix(c(0,1,1,0))    # xor
output

ann <- nnet::nnet(input, output, maxit=5000, size=2, decay=0.001)
ann
result <- predict(ann, input)
result
ifelse(result > 0.5, 1, 0)



# iris dataset

set.seed(12)
idx <- sample(1:nrow(iris), nrow(iris) * 0.7) # 랜덤 추출 비복원 추출
length(idx)
train <- iris[idx, ]   # 학습 데이터
test <- iris[-idx, ]   # 검정(평가) 데이터
dim(train); dim(test)

install.packages("devtools")
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')
model_ir <- nnet::nnet(Species ~ .,maxit=100, train, size = 1)   # 뉴런(node) 1
model_ir
summary(model_ir)
plot.nnet(summary(model_ir))

model_ir2 <- nnet::nnet(Species ~ .,maxit=100, train, size = 10)   # 뉴런(node) 1
model_ir2
summary(model_ir2)
plot.nnet(summary(model_ir2))


pred <- predict(model_ir2, test, type = "class")
t <- table(pred, test$Species)
t
sum(diag(t))/nrow(test)
