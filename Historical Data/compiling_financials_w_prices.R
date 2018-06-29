library("openxlsx")
library("zoo")
setwd("/Users/jleibowitz/desktop/github/financialanalysis/Historical Data/ABT")

ABT<-read.csv("ABT.csv")
ABT_financials<-read.xlsx("ABT_financials.xlsx",rowNames=T)
colnames(ABT_financials)<-convertToDate(colnames(ABT_financials))
keptFinancials<-c("Gross Profit","Operating Income","Income Tax Expense","Net Income","Net Income Common","Gross Margin")
kept<-ABT_financials[keptFinancials,]
kept<-t(kept)

ABT$Date<-as.Date(ABT$Date,format="%m/%d/%Y")

  
  
Date<-row.names(kept)
kept<-cbind(Date,kept)
kept<-data.frame(kept)
kept$Date<-as.Date(kept$Date)



data<-merge(ABT,kept,by.x="Date",by.y="Date", all.y=TRUE, all.x=TRUE)

data<-data[-c(1:7074),]
data<-na.omit(data)
write.xlsx(data,"ABT_financials_quarterlyinfo.xlsx")
