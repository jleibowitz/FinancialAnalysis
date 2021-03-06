library("openxlsx")
library("zoo")
setwd("/Users/jeffrey/desktop/github/financialanalysis/Historical Data/ACN")

ticker<-read.csv("ACN.csv")
financials<-read.xlsx("financials.xlsx",rowNames=T)
colnames(financials)<-convertToDate(colnames(financials))
keptFinancials<-c("Gross Profit","Operating Income","Income Tax Expense","Net Income","Net Income Common","Gross Margin")
kept<-financials[keptFinancials,]
kept<-t(kept)

#ticker$Date<-as.Date(ticker$Date,format="%m/%d/%Y")
ticker$Date<-as.Date(ticker$Date)
  
  
Date<-row.names(kept)
kept<-cbind(Date,kept)
kept<-data.frame(kept)
kept$Date<-as.Date(kept$Date)



data<-merge(ticker,kept,by.x="Date",by.y="Date", all.y=TRUE, all.x=TRUE)


data<-na.omit(data)
write.xlsx(data,"ACN_financials_quarterlyinfo.xlsx")
