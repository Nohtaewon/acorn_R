# 시각화(그래프 출력)
# 이산변수 : 막대, 점, 원형 그래프 등이 적당
# 연속변수 : 상자박스, 히스토그램, 산점도 등 적당

stu <- read.csv("testdata/ex_studentlist.csv")
head(stu, n=2)
names(stu)

# 세로 막대
barplot(stu$grade)
barplot(stu$grade, ylim=c(0,5), col = rainbow(3), main='제목')

# 가로 막대
barplot(stu$grade, col = rainbow(3), main='제목', horiz = T,
        xlab='학년', ylab = '학생 수')

par(mfrow=c(1, 2))   # 한 화면에 plot(그림영역) 여러개 표시
barplot(stu$grade, ylim=c(0,5), col = rainbow(3))
barplot(stu[,4], ylim=c(0,5), col = rainbow(5), space = 2)

par(mfrow=c(1,1))

# 점 차트
dotchart(stu$grade, color = 2:5, lcolor='black', pch=1:2, cex=1.5)

# 파이 차트
df <- na.omit(stu)
pie(df$age, labels = df$age, lty=3)

# 연속 변수
# 박스 플롯
mean(stu$height)
median(stu$height)
quantile(stu$height)

boxplot(stu$height)
boxplot(stu$height, range=1, notch = T)
abline(h=170, col='blue')

# 히스토그램
hist(stu$height)
hist(stu$height, breaks = 5)
hist(stu$height, xlab = '키', col = 'yellow')

# 산점도(산포도)
plot(stu$height)

head(iris, 2)
plot(iris$Sepal.Length)
pairs(iris[, 1:4])   # 산점도 행렬 그래프. 변수간의 상관관계 확인
pairs(iris[iris$Species=='setosa', 1:4])

# 3차원 산점도 그래프 ---
install.packages("scatterplot3d")
library("scatterplot3d") 

# 붓꽃의 종류별 분류로 3차원 그래프 그리기
levels(iris$Species) 
iris
ir.setosa = iris[iris$Species=='setosa', ]
ir.virginica = iris[iris$Species=='virginica', ]
ir.versicolor = iris[iris$Species=='versicolor', ]

# 형식 : scatterplot3d( 밑변，우변칼럼명，좌변칼럼명，type) 
# 틀 생성
irdata <- scatterplot3d(iris$Petal.Length, iris$Sepal.Length, iris$Sepal.Width, type = 'n')

# 산점도 시각화
irdata$points3d(ir.setosa$Petal.Length, ir.setosa$Sepal.Length, 
                ir.setosa$Sepal.Width, bg='red', pch=21)

irdata$points3d(ir.virginica$Petal.Length, ir.virginica$Sepal.Length, 
                ir.virginica$Sepal.Width, bg='blue', pch=23)

irdata$points3d(ir.versicolor$Petal.Length, ir.versicolor$Sepal.Length, 
                ir.versicolor$Sepal.Width, bg='yellow', pch=25)



