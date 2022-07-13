# 상관분석은 확률론과 통계학에서 두 변수간에 어떤 선형적 관계를 갖고 있는 지를 분석하는 방법이다. 
# 두 변수는 서로 독립적인 관계로부터 서로 상관된 관계일 수 있으며 
# 이때 두 변수 간의 관계의 강도를 상관관계(Correlation)라 한다. 
# 공분산(covariance)은 2개의 확률변수의 선형 관계를 나타내는 값이다.

# 공분산의 예
x<-1:5
# y<-2:6
y<-5:1
plot(x, y)

mean(1:5) # 평균
var(1:5)  # 분산
sd(1:5)   # 표준 편차(평균에 대한 오차차)

cov(1:5, 2:6)   # 2.5  양의 관계가 있다.
cov(1:5, c(3,3,3,3,3))    # 0 양의 관계가 없다.
cov(1:5, 5:1)   # -2.5 음의 관계가 있다.
cov(1:5, c(50, 40, 30, 20, 10))
cov(1:5, c(500, 400, 300, 200, 100))

# 공분산 값을 표준화할 수 있다. -1 ~ 0 ~ 1 사이의 값으로 표현하게 됨
# 상관계수 : r 
cor(1:5, 2:6)
cor(1:5, 5:1)
cor(1:5, c(50, 40, 30, 20, 10))
cor(1:5, c(500, 400, 300, 200, 100))

# 아버지와 아들 키의 데이터로 상관분석
hf <- read.csv("testdata/galton.csv", header = T)
head(hf, 3)
str(hf)
dim(hf)
summary(hf)

hf_man <- subset(hf, sex=='M')
dim(hf_man)
head(hf_man, 3)
hf_man <- hf_man[c('father', 'height')]
dim(hf_man)
head(hf_man, 3)

mean(hf_man$father)
sd(hf_man$father)
mean(hf_man$height)
sd(hf_man$height)

# 두 변수의 관계를 파악 : 공분산
# 수식 사용
f_mean <- mean(hf_man$father)
s_mean <- mean(hf_man$height)
cov_sum <- sum((hf_man$father - f_mean)*(hf_man$height- s_mean))
cov_xy <- cov_sum / (nrow(hf_man) - 1)
cov_xy

# 함수 사용
?cov
cov(hf_man$father, hf_man$height)

# 두 변수의 관계를 파악 : 공분산을 표준화한 상관계수
r_xy <- cov_xy / (sd(hf_man$father) * sd(hf_man$height))
r_xy
cor(hf_man$father, hf_man$height)

plot(height ~ father, data=hf_man, xlab='아버지키', ylab='아들키키')
abline(lm(height ~ father, data=hf_man), col='red', lwd=2)

# 상관관계 결정
cor.test(hf_man$father, hf_man$height, method = 'pearson')
# p-value < 2.2e-16 < 0.05 이므로 의미있는 상관분석이라 할 수 있다.







