# 분류분석 모델 중 의사결정나무(DecisionTree)
# 입력 변수중에서 영향력이 큰 변수를 기준으로 이진분류하여 나무구조 형태의 분류결과를 얻을 수 있음
# 독립변수, 종속변수는 범주형과 연속형 모두 가능

install.packages("party")
library(party)
head(airquality, 3) # 뉴욕 지역의 대기질 정보
str(airquality)

air_tree <- ctree(Temp ~ Solar.R+Wind+Ozone, data = airquality)
air_tree

plot(air_tree)


# iris dataset
head(iris, n=3)
summary(iris)

# train/test split
set.seed(123)
idx <- sample(1:nrow(iris), nrow(iris) * 0.7) # 랜덤 추출 비복원 추출
idx
length(idx)
train <- iris[idx, ]   # 학습 데이터
test <- iris[-idx, ]   # 검정(평가) 데이터
dim(train); dim(test)

iris_ctree <- ctree(formula = Species ~ ., data = train)
iris_ctree

plot(iris_ctree, type='simple')
plot(iris_ctree)

# 성능
pred <- predict(iris_ctree, test)
pred

t <-table(pred, test$Species)
sum(diag(t) / nrow(test))   # 0.9777778

install.packages("caret")
library(caret)
confusionMatrix(pred, test$Species) # 예측값, 실제값값

# 새값으로 분류
newf <- iris[1, ]
newf
newf$Sepal.Length <- 7
newf$Sepal.Width <- 8
newf$Petal.Length <-7
newf$Petal.Width <-8
newf

predict(iris_ctree, newf)
