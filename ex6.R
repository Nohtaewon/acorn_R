# 데이터 전처리(Data preprocessing)
# 수집 후 가공 : 직접 입력, 파일, DB, log 파일...
install.packages("dplyr")
library(dplyr)


stu <- read.csv("testdata/ex_studentlist.csv", fileEncoding = 'utf-8')
head(stu, n=3)
names(stu)

# 조건에 의해 데이터 추출
# dplyr::filter(df, 조건1, 조건2)
filter(stu, gender=='남', grade==2)   # and
filter(stu, gender=='남'| grade==2)   # or
length(filter(stu, gender=='남', grade==2))
length(filter(stu, gender=='남'| grade==2) )   # 건수

# select()
select(stu, name, age)
select(stu, name:age)
select(stu, -(name:age))

# arrange()
arrange(stu, age)
arrange(stu, desc(age))
arrange(stu, gender, grade)   # 정렬키 복수

# 함수 연속적으로 사용하기(파이프 연산자 사용 %>%)
stu %>% filter(grade == 1)
stu %>% filter(grade != 1)
stu %>% filter(height >= 170.0 & grade == 2)   # and
stu %>% filter(height >= 170.0 | grade == 2)   # or
stu %>% filter(grade %in% c(1,2))

stu %>% select(name, bloodtype)
stu %>% select(-name, -bloodtype)

stu %>% filter(grade==1) %>% select(gender, name) %>% head(2)






















