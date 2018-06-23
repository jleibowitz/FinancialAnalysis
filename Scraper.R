setwd("/Users/jleibowitz/desktop/FINANCE")
library('openxlsx')

t<-url("https://finance.yahoo.com/quote/F/history?p=F")
open(t)
thepage<- readLines(t)
linenumb<-grep("CrumbStore",thepage)
mypattern='"CrumbStore"([^<]*),"UserStore"'
cookie<- grep(mypattern,thepage[linenumb],value=TRUE)
linelocation<-test<-gregexpr('CrumbStore',thepage[43])
crumbnumb<-substring(thepage[43],linelocation[[1]][1]+22,linelocation[[1]][1]+32)
root1<-"https://query1.finance.yahoo.com/v7/finance/download/"
root2<-paste0("?period1=76219200&period2=1529380800&interval=1d&events=history&crumb=",crumbnumb)
sp500<-read.xlsx("SP500 stock list.xlsx")
test<-read.csv(paste0(root1,sp500$TICKER.SYMBOL[1],root2))
close(t)


f<-curl("https://www.investopedia.com/markets/api/partial/historical/?Symbol=MMM&Type= Historical+Prices&Timeframe=Daily&StartDate=Nov+28%2C+2017&EndDate=Dec+05%2C+2017")
open(f)
test<-readLines(f)






