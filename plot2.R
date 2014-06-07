## Read data
## Data begins on row 66638 to 69538
df <- read.table('household_power_consumption.txt',sep=';',na.strings='?',skip=66637,nrows =2880)

## Set first column to Date type
#df[,1]<-as.Date(strptime(df[,1],format='%d/%m/%Y'))
df[,10] <-paste(df[,1],df[,2])
df[,10]<-as.POSIXct(strptime(df[,10],'%d/%m/%Y %H:%M:%S'))
#weekdays(df[,10],abbreviate=TRUE)

## set names to columns
names(df)<- c("Date","Time","Global Active Power","Global Reactive Power","Voltage","Global Intensity","Kitchen","Laundry","Air and Heat","DateTime")

df[,"Global Active Power"]<- as.numeric(df[,"Global Active Power"])

##open file
png(filename = "./plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

##plot
with(df,plot(y=df[,"Global Active Power"],x=df[,"DateTime"],type='l',xlab='',ylab='Global Active Power (kilowatts)'))

## Close File
dev.off()


