# 분류모델 중 Random Forest : 앙상블 학습기법 - decisionTree를 복수개 사용
# 정확도가 우수

install.packages("randomForest")
library(randomForest)

set.seed(123)
idx <- sample(1:nrow(iris), nrow(iris) * 0.7)
length(idx)
train <- iris[idx, ]   # 학습 데이터
test <- iris[-idx, ]   # 검정(평가) 데이터
dim(train); dim(test)

head(iris, 2)
model <- randomForest(Species ~ ., data = train)
model

# 학습시 파라미터를 조정해서 모델 작성
model2 <- randomForest(Species ~ ., data = train, ntree=100, mtry=3, na.action = na.omit)
model2

# 중요변수 알아내기
model3 <- randomForest(Species ~ ., data = train, na.action = na.omit, importance=T )
importance(model3)

varImpPlot(model3)

# 모델평가
pred <- predict(model3, test)
t <- table(observed=test[, 'Species'], predict=pred)
t

sum(diag(t)/nrow(test))
prop.table(t, margin = 1)

# 새값으로 분류
newf <- iris[1, ]
newf
newf$Sepal.Length <- 7
newf$Sepal.Width <- 8
newf$Petal.Length <-7
newf$Petal.Width <-8
newf
predict(iris_ctree, newf)

