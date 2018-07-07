setwd("/Users/jeffrey/desktop/github/financialanalysis")
library('openxlsx')
library(BatchGetSymbols)

first.date <- Sys.Date()-(12*365)
last.date <- Sys.Date()

SP500 <- GetSP500Stocks()
tickers <- SP500$tickers

stockdata <- BatchGetSymbols(tickers = tickers,
                         first.date = first.date,
                         last.date = last.date)

print(stockdata$df.control)
print(stockdata$df.tickers)


financials<- list()
for (i in 1:length(tickers)){
  site<-paste0("https://stockrow.com/api/companies/",tickers[i],"/financials.xlsx?dimension=MRQ&section=Income%20Statement")
  financials[[i]]<-read.xlsx(site)
  
}








