# 내장함수 / 사용자정의함수
# 주요 내장함수 경험하기
seq(0, 5, by=1.5)
seq(length=10, from=5, by=.2)

set.seed(123)
rnorm(10, mean = 0, sd=1)  # 정규분포를 따르는 난수 발생
hist(rnorm(10000, mean = 0, sd=1))

runif(10, min=0, max=100)
hist(runif(100000, min=0, max=100))  # 균등등분포를 따르는 난수 발생

x <- 1:10
min(x)
max(x)
range(x)
mean(x)
median(x)
var(x)
sqrt(var(x))
sd(x)

# ...
# 사용자정의함수 작성
func1 <- function(arg){
  print(arg)
  print('사용자 함수 만세')
  return(arg+10)
}
func1(5)
result=func1(5)
result

# 구구단
gugu_func <- function(dan){
  for(d in dan){
    for(i in 1:9){
      cat(d, '*', i, '=', d*i, ' ')
    }
    cat('\n')
  }
}
gugu_func(2:5)

# 윤년 체크
yun_func <- function(y){
  if(y %% 4 == 0 & y %% 100 !=0 | y %% 400 == 0){
    paste(y, '년은 윤년')
  }else{
    paste(y, '년은 평년')
  }
}

yun_func(2022)
yun_func(2020)
yun_func(2024)






