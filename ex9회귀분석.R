# 회귀분석 모델을 작성
# 적정한 추세선을 만들기 위한 수식을 완성을 해줌. y = f(x)  y=wx+b
# 미국 여성 데이터(height, weight) 를 사용해 회귀모델 작성
# 미지의 경험하지 않은 height를 입력하여 몸무게를 예측하기

str(women)
dim(women)

cor(women$height, women$weight)   # r: 0.9954948
cor.test(women$height, women$weight)   # 상관계수 분석

plot(weight ~ height, data=women)

# 인과관계는? height(독립)가 weight(종속)에 영향을 주는 것으로 판단됨
# 조건이 만족되었음으로 회귀분석 모델을 작성
# y=wx+b : 이 수식 얻기
mfit <- lm(formula = weight ~ height, data = women)   # 전통적인 기계학습 알고리즘 모델을 이용
mfit  # slope(기울기):3.45, bias(절편):-87.52    y_hat= 3.45*x + -87.52
abline(mfit, col='blue')
head(women)
pred1 <- 3.45*63 + -87.52
cat('예측 결과:', pred1)

# 경험한 적이 없는 새로운 height값에 대한 weight는 ?
# new_x <- 33
new_x <- 77
new_pred <-3.45*new_x + -87.52
cat('새 예측 결과:', new_pred)

summary(women)
summary(mfit)   # 모델에 대한 요약 통계량


# 회귀분석모형의 적절성을 위한 조건 : 아래의 조건 위배 시에는 변수 제거나 조정을 신중히 고려해야 함.
# 1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
# 2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
# 3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
# 4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
# 5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.
# 예) 나이와 학년이 신체 구조에 미치는 영향(교집합이 매우 커 다중공선성 우려)

# 회귀분석모형의 적절성을 위한 조건을 시각화로 확인
par(mfrow=c(2,2))
plot(mfit)











