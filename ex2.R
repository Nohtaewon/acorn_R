# R 객체 타입 (vector, matrix, array, list, dataframe)
# scala 는 지원하지 않음

# Vector : 1차원 배열 형태의 자료구조 (동일한 형태의 자료만 저장됨)
# 벡터는 같은 자료형의 데이터를 정해진 갯수만큼 모아놓은 것이다. 
# 생성 함수 : c(), seq(), rep()
# 처리 함수 : setdiff(), intersect(), union()

y <- 2022
is.vector(y)
is(y)
typeof(y)
y <- as.integer(y)
typeof(y)

rank(y)
y
y[1]

seq(1, 5)
seq(1:5)
seq(1, 10, 2)
seq(1, 10, length.out=3)

rep(1:3, 3)  # 패턴이 있는 수열 생성
rep(1:3, each=3)

c(2, 5, 1)
c(2, 5, 1, 10:15, 17)
x <- c(1,3,5)
y <- c(1:3, 1:3)
x; y
print(x)
print(x, y)
cat(x,y)

age <- c(27, 28, 30)
age
names(age) <- c('오공', '팔계', '오정')    # 벡터에 칼럼명 지정
age
age[1]
age["오공"]
age[1:2]
age
age <- c(age, 40)   # 벡터에 값 추가
age
age[10] <- 50
age
age2<-append(age, 50, after=6)
age2
age<-NULL
age
age[1]

v1<-c(13, -3, 20:23, 12, -2:3)
v1
v1[1]
v1[1:5]
v1[c(1:5, 8)]
v1[-1]   # 여집합
v1[-c(1, 3, 6:9)]

a <- 1:30
a
b <- a %% 3   # %%: 나머지 연산
b; b==0
a[b==0]

length(a)
nrow(a)     # matrix만 가능
NROW(a)     # vector, matrix 가능

a<-1:5
a+5
a-5
a*5
a/5
a^2
a**2
sqrt(a)    # 제곱근
sqrt(a)^2

a <- 1:3
b <- 4:6
a; b
a*b
a+b
a+10
a[4] <- 2
a; b
union(a,b)   # 합집합 중복x
c(a,b)       # 벡터 결합 중복o
setdiff(a, b)
b[4] <-2
a; b
setdiff(a,b)  # 차집합
intersect(a, b)  # 교집합


# --------------------------------------------------------
# Matrices(Matrix) : 2차원의 dataset 이다. 
# 이는 매트릭스 함수에 벡터를 제공함으로써 만들 수 있다.
# 동일 데이터 타입을 갖는 2차원 배열(행렬 구조).
# 선형대수학 정리
# - 생성 함수 : dim(), matrix(), rbind(), cbind()
# : matrix: 긴 벡터를 잘라서 행렬로 변환
# : cbind: 여러 개의 벡터를 좌우로 붙여서 행렬로 변환
# : rbind: 여러 개의 벡터를 위아래로 붙여서 행렬로 변환
# - 처리함수 : apply()

a <- 1:8
dim(a)
dim(a) <- c(2,4)
a
class(a)

matrix(c(1:5))
matrix(1:9, nrow=3)   # I열방향 채우기가 default
matrix(1:9, nrow=3, byrow=T)
matrix(1:10, 2)
matrix(1:10, 3)
m <- matrix(1:10, 3)
m
dim(m)
rank(m)
class(m)
m[1,]
m
m[,3]
m[2,3]
m[1, c(2:4)]
m[,-1]
m[-1,-1]

matrix(c(1,2,3,4,'5'))
a <- matrix(1:9, nrow=3, ncol=3)
a
rownames(a) <- c('r1', 'r2', 'r3')
colnames(a) <- c('one', 'two', 'three')
a
length(a)
ncol(a)
nrow(a)
NROW(a)

a <- matrix(c(1,2,3,4), 2, 2)   # nrow=2,ncol
a
b <- matrix(5:8, 2)
b
a+b
a-b
a*b
a/b
a %% b # 행렬 곱곱

dig(3)
diag(3)
a
t(a)
x1 <- c(5, 40, 50:52)
x2 <- c(30, 5, 6:8)
x1; x2
mr <- rbind(x1, x2)
mr
mc <- cbind(x1, x2)
mc

# apply (변수, 행렬, 함수)
x <- matrix(1:9, nrow=3)
apply(x, 1, max)  # 행 기준 가장 큰 값 반환
apply(x, 2, max)  # 열 기준 가장 큰 값 반환
apply(x, 2, mean)


# -----------------------------------------------------------
# Arrays : matrix는 2차원에 한정되지만 arrays는 어떠한 차원으로도 만들 수 있다. 
# 동일 데이터 타입을 갖는 다차원 배열. (활용도는 다소 낮다)
# - matrix는 행과 열을 갖는 2차원 자료구조다.
# - Array는 행과 열, page를 갖는 3차원 자료구조다.
# - 생성 함수 : array(data, dim)

d <- 1:12
class(d)
arr1 <- array(d)
class(arr1)
dim(arr1)   # 12열 짜리 1차원 배열

arr2 <- array(1:12, dim = c(6,2))
arr2
dim(arr2)   # 6행 2 열짜리 2차원 배열

arr3 <- array(1:12, dim = c(3,2,2))
arr3
dim(arr3)   # 3행 2열 2면짜리 2차원 배열
arr3[,,1]
arr3[,,2]
arr3[1,1,1]  # 1행 1열 1면 요소값 반환

#---------------------------------------------------------
# List : 서로 다른 타입의 데이터를 기억할 수 있다.
# - 성격이 다른 데이터(벡터, 행렬, 데이터프레임 등 모든 데이터)의 기억이 가능,
# c의 구조체, java의 레코드형 기억장소와 유사
# - 생성 함수 : list()
# - 처리 함수 : unlist(), lapply(), sapply()

li <- list('1', '홍길동', 55, '2', '고길동', 75 )
class(li)
li
li[1]
li[[1]]
li[[1]][1]

li <- list(x=1:5, y=6:10)
li
li$x
li$y
# --------------------------------------------------------
# Data Frames : 구조화된 데이터 오브젝트다. 
# 데이터베이스의 테이블 구조와 유사, 칼럼 단위로 type이 달라도 됨
# - 가장 많이 사용되는 객체 타입
# - 데이터프레임과 행렬은 모두 2차원 데이터이지만 다음과 같은 점이 다르다.
# 데이터프레임의 각 열은 서로 다른 자료형이 될 수 있다.
# 데이터프레임은 열 이름, 행 이름을 가질 수 있다.
# - 생성 함수 : data.frame(열이름1=요소, 열이름2=요소, …)
# - 처리 함수 : apply(), str(), ncol(), nrow(), summary()

# 작성1 : vector 로 DataFrame 작성
no <- c(1,2,3)
name <- c("홍", "김", "이")
pay <-c(500,550,400)
# df <- data.frame(no, name, pay)
df <- data.frame(bunho=no, irum=name, imkum=pay)
df
class(df)
str(df)
summary(df)
head(df, n=2)
tail(df, n=2)

class(iris)
head(iris, n=3)
tail(iris, 3)

# 작성2 : matrix로 DataFrame 작성
m <- matrix(c(1, "홍길동", 300, 2, "신길동", 400, 3, "고길동", 330), 3, by=T)
m
mdf <- data.frame(m)
mdf
class(mdf)

# 작성3 : data.frame로 DataFrame 작성
df <- data.frame(irum=c('james','oscar','tom'), nai=c(34, 28, 26))
df
df$irum
df$nai
df$nai[1]
df['addr']=c('서울', '인천', '수원')
df['imsi']=ifelse(df$nai>=30,"good","nice")
df
df[,2]
df[,1]
df[1, ]
df[1,c(1,3)]

# 조건 지정
df
df[df$addr == '서울', 1]
df[df$addr == '서울', 2]
subset(df, addr == '서울')
subset(df, addr == '서울', select=c(1,2))

df[, 'addr']<-NULL   # 열 삭제
df

# file i/o
getwd()
txtdf <- read.table('testdata/emp.txt', encoding = 'utf-8', header=T)
txtdf
class(txtdf)
summary(txtdf)
str(txtdf)

csvdf <- read.csv('testdata/emp.csv', encoding='utf-8', header=T)
csvdf

df
write.csv(df, 'mydf.csv', row.names = T)
df2<- read.csv('mydf.csv', encoding='utf-8', header=T)
df2
