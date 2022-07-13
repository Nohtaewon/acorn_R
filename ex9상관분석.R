# 친밀도, 적절성, 만족도 변수로 상관분석
data <- read.csv("testdata/drinking_water.csv")
head(data, 3)
str(data)
cov(data$친밀도, data$적절성)
plot(data$친밀도, data$적절성)
cov(data)

cor(data$친밀도, data$적절성)
cor(data, method='pearson')

symnum(cor(data, method='pearson'))   # 상관계수를 시각화

install.packages("corrgram")
library(corrgram)
corrgram(data)

corrgram(data, upper.panel = panel.conf)
corrgram(data, lower.panel = panel.conf)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(data, histogram = , pch='+')

