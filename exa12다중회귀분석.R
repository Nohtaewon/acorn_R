# 다중회귀분석(Multiple Linear Regression) : 독립변수가 복수

state.x77   # 미국 각 주 관련 정보 dataset
colnames(state.x77)
dim(state.x77)   # 50 8
head(state.x77, n=3)
states <- as.data.frame(state.x77[, c('Murder', 'Population', 'Income', 'Illiteracy', 'Frost')])
typeof(states)
class(states)
str(states)

cor(states)

# 다중회귀모델
mfit <- lm(formula = Murder ~ Population + Income + Illiteracy+Frost, data=states)
# mfit <- lm(formula = Murder ~ ., data=states)
# mfit <- lm(formula = Murder ~ . -Income, data=states)

summary(mfit)  # y=2.237e-04*x 6.442e -05 * x2 +4.143e+00*x3+5.823-04
#p-value: 9.133e-08 <0.05 유의한 모델
# Adjusted R-squared:  0.5285
# Income, Frost : p-value >0.05 이므로 독립변수 자격을 의심

# 선형회귀모델 기본 충족 조건 확인
par(mfrow=c(2,2))
plot(mfit)

# 잔차의 정규성 검정
# 독립변수들의 잔차항이 정규분포를 따라야한다.
shapiro.test(residuals(mfit))  # p-value = 0.6672 > 0.05 이므로 정규성 만족


# 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
install.packages("car")
library(car)
durbinWatsonTest(mfit) # D-W Statistic : 2.317691    2에 근사하면 독립성 만족

# 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
boxTidwell(Murder ~ Population + Illiteracy, data=states)

# Population : p-value 0.7468 > 0.05 선형성 만족
# Illiteracy : p-value 0.5357 > 0.05 선형성 만족

# 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
ncvTest(mfit)  # p = 0.18632 > 0.05 등분산성 만족

par(mfrow=c(1,1))
spreadLevelPlot(mfit)  # 만약에 ncvTest(mfit) 결과가 0.05 보다 작으면 얘를 사용용
# Suggested power transformation:  1.209626  # Murder 에 1.209626 배를 적용하면 등분산성의 문제 개선

# 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.
# vif : variance Inflation Factor 10을 넘으면 다중공선성으로 판정
vif(mfit)   # 결과 값 중에 10을 넘는 변수는 다중공선성 문제 있음

# 모델을 작성하면서 독립변수를 무엇으로 해야할지가 고민거리 ---------------
# 독립변수 선택을 위한 함수 제공됨
mfit1 <- lm(Murder ~ ., data = states)
summary(mfit1)

mfit2 <- lm(Murder ~ Population + Illiteracy +Frost, data = states)
summary(mfit2)

mfit3 <- lm(Murder ~ Population + Illiteracy, data = states)
summary(mfit3)

# AIC 통계량 : 어떤 모형(모델)이 더 우수한지를 비교 가능
AIC(mfit1, mfit3)
# df      AIC
# mfit1  6 241.6429
# mfit3  4 237.6565    # AIC 결과는 작을수록 좋다

# stepwise regression : 여러 개의 변수에 대해 단계적으로 회귀모형을 검정해서 적합 모형을 제시
# backward(후진소거법) : 모든 변수를 넣고 기여도가 낮은 변수를 하나씩 제거
full_model <- lm(Murder ~ ., data = states)
reduce_model <- step(full_model, direction = 'backward')

# forward(전진선택법) : 유익한 변수를 하나씩 선택
min_model <- lm(Murder ~ 1, data = states)
fwd_model <- step(min_model, direction = 'forward', 
                  scope = (Murder ~ Population + Income + Illiteracy+Frost), trace = 1)

# 두 개는 방법에 차이가 있을뿐 결과는 같다. 그런데 경우에 따라서 기회를 갖지 못하는 변수가 발생할 수 있다.

# all subset regression : 모든 조합에 대한 검증을 함
install.packages("leaps")
library(leaps)

m <- leaps::regsubsets(Murder ~ Population + Income + Illiteracy+Frost, data=states, nbest=4)
summary(m)$bic     # BIC 값:AIC 와 마찬가지로 모델의 확률분포의 차이를 알려줌. 작을 수록 좋음
summary(m)$adjr2   # 수정결정계수

plot(m, scale="adjr2", main="변수 선택 그래프")
# adjr2 값이 가장 큰 변수는 Population, Illiteracy 임을 알려줌


