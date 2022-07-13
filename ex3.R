# 도수분포표 작성 : 빈도수를 표로 출력
df <- utils::read.csv("testdata/ex_studentlist.csv")
head(df, n=2)

str(df)

# 명목형 데이터로 빈도수 구하기
table(df$gender)
table(df$gender, df$bloodtype)   # 성별 혈액형 별 빈도수
freq <- table(df$bloodtype)
freq
class(freq)

rfreq <- prop.table(freq)   # 상대 도수(비율) 얻기
rfreq 
rtable <- rbind(freq, rfreq)
rtable

rtable <- addmargins(rtable, margin = 2)   # 1 : 열방향, 2:행방향
rtable

# 연속형 데이터로 빈도수 구하기
df$height
factorHeight <- cut(df$height, breaks = 4)
factorHeight   # ()포함 []포함 아님

freqHeight <- table(factorHeight)
freqHeight
str(df)

freqHeight<-rbind(freqHeight, prop.table(freqHeight))
freqHeight

rownames(freqHeight)[2]<-"realHeight"
freqHeight

cumfreq <- cumsum(freqHeight[2,])  # 누적 상대 도수 얻기
cumfreq

freqHeight<-rbind(freqHeight, cumfreq)
freqHeight
rownames(freqHeight) <- c('빈도수', '상대도수', '누적도수')
freqHeight

freqHeight <- addmargins(freqHeight, margin=2)
freqHeight
