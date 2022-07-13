# 데이터 유형
# 숫자형 : numeric(, ), integer, double
# 문자형 : character
# 논리형 : logical
# 결측데이터 : NA, NaN, NULL
# Factor : 문자 ==> 숫자 처럼 순서를 가짐
# 함수 : closure


kbs <- 9
object.size(kbs)
typeof(kbs)
is(kbs)   # 데이터 유형 확인 함수
kbs[1]
kbs[0]

# mbc = kbs
mbc <- as.integer(kbs)  # 형 변환
# kbs -> mbc
is(mbc)
sbs <- 5L   # 형 변환
is(sbs)
ss <- "홍길동"
typeof(ss)
is.character(ss)
bb<-TRUE
bb<-T
typeof(bb)

aa<-NA      # 결측 데이터(값이 입력되지 않은 상태)
typeof(aa)
sum(2,3)
sum(2, 3, aa)
sum(2, 3, aa, na.rm = T)
typeof(NA) # "logical" 결측 데이터
typeof(NULL) # "NULL" 데이터 값이 없음
typeof(NaN) # "double" Not aNumber : 수학적으로 정의x

2/3
0/0
0*Inf
Inf+ -Inf
Inf-Inf

5.4 - 3i
typeof(5.4-3i)
Re(5.4-3i)
Im(5.4-3i)

f <- function(){
  return('good')
}
f()
typeof(f)

x<-FALSE
print(x)
cat(x)
print(1,2)
cat(1,2)

class(x)
typeof(x)
mode(x)

# class() : R 객체지향 관점에서의 자료형
# 
# typeof() : 원시 자료형 (R 에서의)
# 
# mode() : 원시 자료형 (S1 에서의)

strOptions(x)  # 객체의 구조 확인 함수
ls()   # 현재 사용중인 객체변수 목록
ls.str()
rm(aa)  # 객체 삭제
rm(list=ls()) # 사용중인 객체 모두 삭제
# Ctrl+L console 삭제
# -----------------------------------------------------------------------------
# package : 데이터 + 기능 + 알고리즘 덩어리
available.packages()
dim(available.packages())   # 18323
installed.packages()
length(installed.packages())

# 패키지 설치
install.packages("plyr")
library(plyr)   # 패키지 로딩
help("plyr")
search()
ls("package:plyr")
data(package="plyr")
head(ozone, 3)

remove.packages("plyr")
search()

data()   # 현재 지원되는 dataset 목록
head(iris)
?sum
?mean
help("mean")

x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

hist(iris$Sepal.Length)


getwd()
setwd("C:/work/rsou/pro1")









