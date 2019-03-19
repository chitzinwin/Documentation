#/usr/lib/R/etc/java.conf -- set the jdk to 1.8 solves the problem
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
#export PATH=$PATH:$JAVA_HOME/bin
install.packages("RJDBC")

library(rJava)
require(RJDBC)

cp=c("hive-jdbc-3.1.0-standalone.jar")
.jinit(classpath=cp)

drv <- JDBC("org.apache.hive.jdbc.HiveDriver",
            "hive-jdbc-3.1.0-standalone.jar",
            identifier.quote="`")
conn <- dbConnect(drv, "jdbc:hive2://precision-master:10500/default", "hadoop", "")
dbGetQuery(conn, "select * from airline where year=2001")

