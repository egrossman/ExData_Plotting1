
## Read data
## Data begins on row 66638 to 69538
df <- read.table('household_power_consumption.txt',sep=';',na.strings='?',skip=66637,nrows =2880)

## Set first column to Date type
df[,1]<-as.Date(strptime(df[,1],format='%d/%m/%Y'))

## set names to columns
names(df)<- c("Date","Time","Global Active Power","Global Reactive Power","Voltage","Global Intensity","Kitchen","Laundry","Air and Heat")

df[,"Global Active Power"]<- as.numeric(df[,"Global Active Power"])

##plot histogram
with(df,hist(df[,"Global Active Power"],col="RED",main="Global Active Power",xlab='Global Active Power (killowatts)'))

## Save file to png
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

##Close file
dev.off()