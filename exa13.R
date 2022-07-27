# mtcars dataset으로 단순/다중회귀 경험하기
head(mtcars)
dim(mtcars)
str(mtcars)

# 연습1 - 단순 선형회귀
# 임의의 마력수를 입력하여 연비를 예측하고 싶은 경우
# hp:독립변수, mpg:종속변수
cor(mtcars$hp, mtcars$mpg)  # -0.7761684 반비례 관계
plot(mpg ~ hp, data=mtcars, xlab='hp', ylab='mpg')

# 인과관계가 있다고 판단함, 회귀분석 시행
model1 <- lm(formula = mpg ~ hp, data = mtcars)
model1
# y= -0.06823 * new_hp+30.09886:수식완성

summary(model1)
# p-value: 1.788e-07 <0.05 유효한 모델
# R-squared:  0.6024

abline(model1, col='blue')

# 회귀모델 충족조건은 생략
fitted(model1)
# 예측 : 수식 사용
new_hp =110
cat("예측값: ", -0.06823 * new_hp+30.09886)

new_hp =160
cat("예측값: ", -0.06823 * new_hp+30.09886)

new_hp =70
cat("예측값: ", -0.06823 * new_hp+30.09886)

# 예측 함수 predict 사용
mynew <- mtcars[c(1,2), ] # 기존자료를 불러 데이터 수정
mynew <- edit(mynew)
mynew

pred <- predict(model1, newdata = mynew)
cat('예측값 :', pred)

# 연습2- 다중 선형회귀
# 임의의 마력수와 차체무게를 입력하여 연비를 예측하고 싶은 경우
# hp, wt:독립변수, mpg:종속변수
cor(mtcars$hp, mtcars$mpg) # -0.7761684
cor(mtcars$wt, mtcars$mpg) # -0.8676593

plot(mpg ~ hp, data=mtcars, xlab='wt', ylab='mpg')

model2 <- lm(formula = mpg ~ hp + wt, data =mtcars)
model2 # 수식 : y=-0.03177*new_hp+ -3.87783 * new_wt + 37.22727
 
summary(model2)
# p-value: 9.109e-12 < 0.05 유효한 모델, Adjusted R-squared:  0.8148
# 회귀모델 충족조건
# 다중 공선성
library(car)
vif(model2)  # 10을 넘으면 의심

# 정규성
shapiro.test(model2$residuals)    # p-value = 0.03427 < 0.05 정규성 x

# 독립성
durbinWatsonTest(model2)   # D-W Statistic(0~4) : 1.362399  2에 가까울수로 독립성 만족

# 선형성
boxTidwell(mpg~hp+wt, data = mtcars)  # hp의 p-value : 0.017592, wt의 p-value:0.006473 만족x

# 등분산성
ncvTest(model2)   # p=0.40238 > 0.05 만족

# 예측:수식 사용
new_hp =110; new_wt = 2.5
cat("예측값: ", -0.03177 * new_hp+ -3.87783*new_wt + 37.22727)

# 예측:수식 사용
new_hp =150; new_wt = 5.5
cat("예측값: ", -0.03177 * new_hp+ -3.87783*new_wt + 37.22727)

# 예측:수식 사용
new_hp =70; new_wt = 1.5
cat("예측값: ", -0.03177 * new_hp+ -3.87783*new_wt + 37.22727)

# 예측값/실제값 비교
pred2 <- predict(model2)
cat("예측값: ", round(pred2[1:10],1))
cat("실제값: ", mtcars$mpg[1:10])

# 예측 : predict 함수
new_data <- data.frame(hp=110, wt=2.5)
predict(model2, newdata = new_data)

new_data <- data.frame(hp=70, wt=1.5)
predict(model2, newdata = new_data)

install.packages("MASS")
library(MASS)
str(birthwt)
model <- lm(bwt ~ age + lwt + smoke, data = birthwt)
summary(model)
predict(model, data.frame("age"=c(30,35), "lwt"=c(110, 120), "smoke"=c(0,1)))
model


