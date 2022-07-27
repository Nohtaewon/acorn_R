# 단순선형회귀 : cars dataset 사용
head(cars)
str(cars)
summary(cars)

cor(cars$speed, cars$dist)   # 0.8068949

# 인과관계?   독립(x):speed, 종속(y):dist
model <- lm(formula = dist ~ speed, data = cars) # 최소제곱법해서 cost를 미니마이즈해서 절편과 기울기를 얻는다
model  # 수식 y = wx +b    y=3.932*x+ -17.579

cat('학습에 사용된 실제 dist 값 :', cars$dist[1:10])
cat('speed로 모델이 예측한 dist 값 : ', round(fitted(model)[1:10]))
cat('잔차 확인 : ', residuals(model)[1:10])  # 실제값 - 예측값
confint(model)
summary(model)
cat('모델 성능(설명력) : ', summary(model)$r.squared)

# 예측값 ---
new_x = 10
3.932*new_x+ -17.579
new_x = 100
3.932*new_x+ -17.579

predict(model, newdata = data.frame(speed=100))
predict(model, newdata = data.frame(speed=c(5,10,15)))

s <- subset(iris, select = -c(Sepal.Length, Species))
head(s, 5)

install.packages("moments")
library(moments)
data=iris$Sepal.Length
skewness(data)
kurtosis(data)

hf <- read.csv("testdata/galton.csv")
str(hf)
model <- lm(formula = height ~ mother, data = hf)
model   # y=0.3132*x+46.6908
summary(model)
new_m = 61
0.3132*new_m+ 46.6908

predict(model, data.frame(mother=61))

