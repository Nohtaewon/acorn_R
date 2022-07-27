# 로지스틱회귀 분류 분석 모델
# 날씨 관련 정보를 이용해 비 유무 판단 
weather <- read.csv("testdata/weather.csv")
head(weather, n=3)
dim(weather)
str(weather)
colnames(weather)
weather_df <- weather[ , c(-1, -6, -8, -14)]
head(weather_df, n=3)

weather_df[!complete.cases(weather_df), ]  # NA(결측값) 확인
sum(is.na(weather_df))
weather_df <- na.omit(weather_df)   # NA가 있는 행 제거거
sum(is.na(weather_df))


# 종속변수 대상인 RainTommorrow 변수에(명목척도) 대해 더미변수 처리.
weather_df$RainTomorrow[weather_df$RainTomorrow == 'Yes'] <- 1
weather_df$RainTomorrow[weather_df$RainTomorrow == 'No'] <- 0
head(weather_df, n=3)
unique(weather_df$RainTomorrow)
weather_df$RainTomorrow <- as.numeric(weather_df$RainTomorrow)
str(weather_df)

# train / test 분리
set.seed(12)
idx <- sample(1:nrow(weather_df), nrow(weather_df) * 0.7) # 랜덤 추출 비복원 추출
idx
length(idx)
train <- weather_df[idx, ]   # 학습 데이터
test <- weather_df[-idx, ]   # 검정(평가) 데이터
dim(train); dim(test)

# model
weather_model <- glm(RainTomorrow ~ ., data = train, family = 'binomial')
weather_model
summary(weather_model)

# 모델 성능 확인 (분류 정확도)
pred <- predict(weather_model, newdata = test, type = 'response')
cat('예측값:', head(pred, 5))
cat('실제값:', head(test$RainTomorrow, 5))

result_pred <- ifelse(pred >= 0.5, 1, 0)
table(result_pred)    # 예측결과에 대한 빈도표

table(result_pred, test$RainTomorrow)   # 예측값, 실제값으로 빈도표
table(test$RainTomorrow, result_pred)   # 실제값, 예측값으로 빈도표 (Confusion matrix)
(90+7) / nrow(test)   # accuracy(분류 정확도) : 0.8899083

# 분류 모델 평가 : ROC curve

install.packages('ROCR')
library(ROCR)

pr <- prediction(pred, test$RainTomorrow)  # 예측값, 실제값
prf <- performance(pr, measure = 'tpr', x.measure = 'fpr')
plot(prf)

# AUC(Area Under a ROC Curve) : ROC curve의 밑면적을 계산한 값(0 ~ 1)
auc <- performance(pr, measure = 'auc')
auc <- auc@y.values
auc  # 0.8918495     0.9 ~ 1 : excellent, 0.8 ~ 0.9:good

# 새 값으로 예측
m <- train[c(1:3), ]
m <- edit(m)
m
new_pred <- predict(weather_model, newdata = m, type='response')
ifelse(new_pred > 0.5, '비옴', '맑음')
