## Read data
## Data begins on row 66638 to 69538
df <- read.table('household_power_consumption.txt',sep=';',na.strings='?',skip=66637,nrows =2880)

## Set first column to Date type

df[,10] <-paste(df[,1],df[,2])
df[,10]<-as.POSIXct(strptime(df[,10],'%d/%m/%Y %H:%M:%S'))
#weekdays(df[,10],abbreviate=TRUE)

## set names to columns
names(df)<- c("Date","Time","Global Active Power","Global Reactive Power","Voltage","Global Intensity","Kitchen","Laundry","Air and Heat","DateTime")

df[,"Global Active Power"]<- as.numeric(df[,"Global Active Power"])
df[,"Global Reactive Power"]<- as.numeric(df[,"Global Reactive Power"])
df[,"Voltage"]<- as.numeric(df[,"Voltage"])

##open file
png(filename = "./plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
#make 2 by 2 set of plots
par(mfcol=c(2,2))

#TopLeft
plot(y=df[,"Global Active Power"],x=df[,"DateTime"],type='l',xlab='',ylab='Global Active Power (kilowatts)')

##BottomLeft
with(df,plot(y=df[,"Kitchen"],x=df[,"DateTime"],type='l',xlab='',ylab='Energy sub meetering'))
lines(y=df[,"Laundry"],x=df[,"DateTime"],type='l',xlab='',col='RED')
lines(y=df[,"Air and Heat"],x=df[,"DateTime"],type='l',xlab='',col='BLUE')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("BLACK","RED","BLUE"),bty="n")

##TopRight
plot(y=df[,"Voltage"],x=df[,"DateTime"],type='l',xlab='DateTime',ylab='Voltage')

##BottomRight
plot(y=df[,"Global Reactive Power"],x=df[,"DateTime"],type='l',xlab='',ylab='Global_reactive_power)')


## Close File
dev.off()
