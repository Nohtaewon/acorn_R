# 데이터의 종류
# 정형, 반정형, 비정형
# 정형 데이터 처리 - Maria DB 데이터 처리
install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
library(rJava)
library(DBI)
library(RJDBC)

install.packages("RSQLite")
library(RSQLite)

# 개인용 DB(sqlite)와 연결
conn <- dbConnect(RSQLite::SQLite(), ":memory:")
conn
# 기본 dataset : mtcars로 연습
head(mtcars, 3)
str(mtcars)

dbWriteTable(conn=conn, name="mtcars", mtcars)
dbWriteTable(conn=conn, name="iris_tab", iris)
dbListTables(conn)   # 테이블 목록 보기
dbListFields(conn, "mtcars")   # 해당 테이블의 칼럼명
query <- "select mpg, cyl, hp, wt from mtcars"
result <- dbGetQuery(conn, "select mpg, cyl, hp, wt from mtcars where hp >= 150")
head(result, 2)
dbDisconnect(conn)

# 원격 DB : MariaDB
# drive 파일로 연결시키기 위해 driver 파일 준비
drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver",
            classPath = "C:/work/rsou/mariadb-java-client-2.6.2.jar")
conn <- dbConnect(drv = drv, "jdbc:mysql://127.0.0.1:3306/test", "root", "7hongdb73")

dbListTables(conn)

# sangdata 테이블 자료
query <- "select * from sangdata"
sangAll <- dbGetQuery(conn, query)
sangAll
is(sangAll)
typeof(sangAll)
class(sangAll)
barplot(sangAll$su, col=rainbow(5), names.arg=sangAll$sang)

query2 <- "select * from sangdata where sang like '가죽%' order by code desc"
sangPart <- dbGetQuery(conn, query2)
sangPart

# 레코드 추가
query <- "insert into sangdata values(15, '신상품', 6, 8000)"
dbSendUpdate(conn, query)

df <- data.frame(code=16, sang='마우스', su=1, dan=5500)
df
dbSendUpdate(conn, "insert into sangdata value(?,?,?,?)", df$code, df$sang, df$su, df$dan)
dbGetQuery(conn, "select * from sangdata")

# 레코드 수정
query <- "update sangdata set sang='안경2', su=1 where code=9"
dbSendUpdate(conn, query)
dbGetQuery(conn, "select * from sangdata")

# 레코드 삭제
query <- "delete from sangdata where code=12"
dbGetQuery(conn, query)
dbGetQuery(conn, "select * from sangdata")





