PA1 - Reproducible Research
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
install.packages("knitr")
```

```
## Installing package into 'C:/Users/Anshu/Documents/R/win-library/3.0'
## (as 'lib' is unspecified)
```

```
## Error: trying to use CRAN without setting a mirror
```

```r
install.packages("plyr")
```

```
## Installing package into 'C:/Users/Anshu/Documents/R/win-library/3.0'
## (as 'lib' is unspecified)
```

```
## Error: trying to use CRAN without setting a mirror
```

```r
library(knitr)
library(plyr)
```

```
## Warning: package 'plyr' was built under R version 3.0.3
```

```r
activity <- read.csv("activity.csv")
activity[, 4] <- as.character(as.factor(sprintf("%02d:%02d:%02d", activity[, 
    3]%/%100, activity[, 3]%%100, activity[, 3]%%1)))
names(activity)[c(4)] <- c("Time")
activity[, 2] <- as.Date(activity[, 2])
datetime <- as.POSIXct(paste(activity$date, activity$Time))
activity <- cbind(activity, datetime)
activity[, 6] <- weekdays(activity[, 2])
names(activity)[c(6)] <- c("Weekday")
```


Part 1

```r
data1 <- activity
data1 <- na.omit(data1)
data1 <- ddply(data1, .(date), summarize, steps = sum(steps))
```


Histogram : 


```r
hist(data1$steps)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 



```r
median(data1$steps)
```

```
## [1] 10765
```

```r
mean(data1$steps)
```

```
## [1] 10766
```


Part 2


```r
# Replace NA values by mean number of steps
data2 <- activity
i = 1
while (i < nrow(data1)) {
    activity_date <- as.character(data1[1, 1])
    mean_steps <- as.numeric(as.character(data1[1, 2]))
    j = 1
    while (j < nrow(data2) + 1) {
        d <- as.character(data2[j, 2])
        if (d == activity_date) {
            if (is.na(data2[j, 1])) {
                data2[j, 1] <- mean_steps
            }
        }
        j = j + 1
    }
    i = i + 1
}

# Calculate average steps based on interval
data2 <- na.omit(data2)
steps.interval.summary <- ddply(data2, .(Time), summarize, steps = mean(steps))
data <- steps.interval.summary
i = 1
while (i < nrow(data) + 1) {
    data[i, 3] <- Sys.Date()
    i = i + 1
}
data[, 3] <- as.Date(data[, 3])
```

```
## Error: 'origin' must be supplied
```

```r
names(data)[c(3)] <- c("Date")
datetime <- as.POSIXct(paste(data$Date, data$Time))
```

```
## Error: character string is not in a standard unambiguous format
```

```r
data <- cbind(data, datetime)
average_steps <- mean(l$steps)
```

```
## Error: object 'l' not found
```

```r
average_steps
```

```
## Error: object 'average_steps' not found
```

```r
median_steps <- median(l$steps)
```

```
## Error: object 'l' not found
```

```r
median_steps
```

```
## Error: object 'median_steps' not found
```


Plot Time series


```r
plot(data$datetime, as.numeric(as.character(data$steps)), type = "l", xlab = "Time Interval", 
    ylab = "Average Number of Steps")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 


Part 3


```r
weekend_data <- activity[activity$Weekday %in% (c("Saturday", "Sunday")), ]
weekday_data <- activity[activity$Weekday %in% (c("Monday", "Tuesday", "Wednesday", 
    "Thursday", "Friday")), ]

i = 1
while (i < nrow(data1)) {
    activity_date <- as.character(data1[1, 1])
    mean_steps <- as.numeric(as.character(data1[1, 2]))
    j = 1
    while (j < nrow(weekend_data) + 1) {
        d <- as.character(weekend_data[j, 2])
        if (d == activity_date) {
            if (is.na(weekend_data[j, 1])) {
                weekend_data[j, 1] <- mean_steps
            }
        }
        j = j + 1
    }
    i = i + 1
}

i = 1
while (i < nrow(data1)) {
    activity_date <- as.character(data1[1, 1])
    mean_steps <- as.numeric(as.character(data1[1, 2]))
    j = 1
    while (j < nrow(weekday_data) + 1) {
        d <- as.character(weekday_data[j, 2])
        if (d == activity_date) {
            if (is.na(weekday_data[j, 1])) {
                weekday_data[j, 1] <- mean_steps
            }
        }
        j = j + 1
    }
    i = i + 1
}

weekend_data <- na.omit(weekend_data)
weekday_data <- na.omit(weekday_data)

steps.weekday.summary <- ddply(weekday_data, .(Time), summarize, steps = mean(steps))
weekdaydata <- steps.weekday.summary

steps.weekend.summary <- ddply(weekend_data, .(Time), summarize, steps = mean(steps))
weekenddata <- steps.weekday.summary

i = 1
while (i < nrow(weekenddata) + 1) {
    weekenddata[i, 3] <- Sys.Date()
    i = i + 1
}

i = 1
while (i < nrow(weekdaydata) + 1) {
    weekdaydata[i, 3] <- Sys.Date()
    i = i + 1
}

weekenddata[, 3] <- as.Date(weekenddata[, 3])
```

```
## Error: 'origin' must be supplied
```

```r
weekdaydata[, 3] <- as.Date(weekdaydata[, 3])
```

```
## Error: 'origin' must be supplied
```

```r

names(weekenddata)[c(3)] <- c("Date")
names(weekdaydata)[c(3)] <- c("Date")

datetime <- as.POSIXct(paste(weekenddata$Date, weekenddata$Time))
```

```
## Error: character string is not in a standard unambiguous format
```

```r
datetime <- as.POSIXct(paste(weekdaydata$Date, weekdaydata$Time))
```

```
## Error: character string is not in a standard unambiguous format
```

```r

week_day_data <- cbind(weekdaydata, datetime)
week_end_data <- cbind(weekenddata, datetime)
```


Plot Time series - Weekday vs Weekend

```r
par(mfrow = c(2, 1))
plot(week_day_data$datetime, as.numeric(as.character(week_day_data$steps)), 
    type = "l", xlab = "Time Interval", ylab = "Average Number of Steps", main = "Weekday")
plot(week_end_data$datetime, as.numeric(as.character(week_end_data$steps)), 
    type = "l", xlab = "Time Interval", ylab = "Average Number of Steps", main = "Weekend")
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 

