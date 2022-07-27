# Logistic Regression : 분류 모델
# 독립변수 : 연속형, 종속변수 : 범주형 
# 로짓 변환을 한 후 시그모이드 함수를 사용해서 결과를 0 or 1 로 출력

mydata <- read.csv("testdata/logit_data.csv")
head(mydata, n=3)
# exam grade rank로 pass를 판정
str(mydata)
dim(mydata)
summary(mydata)

# pass에 rank 빈도수
table(mydata$pass, mydata$rank)
xtabs(formula = ~pass + rank, data = mydata)

# 데이터 분리 : train / test  8:2 7:3 가장일반적  모델의 과적합(overfitting) 방지
set.seed(1)
idx <- sample(1:nrow(mydata), nrow(mydata) * 0.7) # 랜덤 추출 비복원 추출
idx
length(idx)
train <- mydata[idx, ]
test <- mydata[-idx, ]
head(train, 10)
head(test, 10)
dim(train); dim(test)

# 로지스틱 회귀 모델
lomodel <- glm(formula = pass ~ ., data = train, family = binomial(link = 'logit')) # 0아니면 1
lomodel
summary(lomodel)

# 모델 성능 파악
pred <- predict(lomodel, newdata = test, type = 'response')
head(pred, n=10)
cat('예측값: ', head(ifelse(pred > 0.5, 1, 0), 10))
cat('실제값: ', head(test$pass, n=10))

# 분류 정확도 계산
result_pred <- ifelse(pred > 0.5, 1, 0)
t <- table(result_pred, test$pass)
t
(77+11) / nrow(test)
(t[1,1]+t[2,2])/nrow(test)
sum(diag(t)) / nrow(test)
# 현재 모델의 분류 정확도 73.3%

# 새로운 값으로 분류
new_data <- train[c(1:3), ]
new_data <- edit(new_data)
new_data
new_pred <- predict(lomodel, newdata = new_data, type = 'response')
new_pred
ifelse(new_pred > 0.5, '합격', '불합격')

name <- c("aa", "bb", "cc", "dd")
gender <- c("F", "M", "M", "F")
price <- c(50, 65, 45, 75)
client <- data.frame(name, gender, price)
result <- ifelse(price >= 65, "Best", "Normal")
client[, "result"] <- result
gender2 <- ifelse(gender=="M", "Male", "Female")
client[, "gender2"] <- gender2
client
