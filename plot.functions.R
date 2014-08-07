hist.global.active.power <- function(power.data)
{
    hist(power.data$Active.Power, xlab = global.active.power.label(TRUE),
         col = 'red', main = global.active.power.label(FALSE))
}

global.active.power.label <- function(full.label)
{
    if (full.label)
    {
        'Global Active Power (kilowatts)'
    }
    else
    {
        'Global Active Power'
    }
}

line.plot.to.date.time <- function(power.data, data.to.plot, xlab, ylab)
{
    plot(power.data[[data.to.plot]] ~ power.data$Date.Time, type = 'l',
         xlab = xlab, ylab = ylab, main = '')
}

plot.active.power.to.date.time <- function(power.data, full.label = TRUE)
{
    line.plot.to.date.time(power.data, 'Active.Power', '',
                           global.active.power.label(full.label))
}

plot.sub.metering.to.date.time <- function(power.data, show.legend.box = TRUE)
{
    meta.data <- sub.meter.meta.data()
    plot(power.data[[meta.data$label[1]]] ~ power.data$Date.Time,
         type = 'n', xlab = '', ylab = 'Energy sub metering', main = '')
    apply(meta.data, 1, add.line.to.plot.sub.meter.plot, power.data)
    legend('topright', col = meta.data$color, legend = meta.data$label,
           lty = 1, bty = if (show.legend.box) 'o' else 'n')
}

add.line.to.plot.sub.meter.plot <- function(meta.data.row, power.data)
{
    lines(power.data[[meta.data.row['label']]] ~ power.data$Date.Time,
          col = meta.data.row['color'])
}

sub.meter.meta.data <- function()
{
    meta.data <- data.frame(label = sub.metering.labels(),
                            color = c('black', 'red', 'blue'),
                            stringsAsFactors = FALSE)
}

plot.voltage.to.date.time <- function(power.data)
{
    line.plot.to.date.time(power.data, 'Voltage', 'datetime',
                           'Voltage')
}

plot.reactive.power.to.date.time <- function(power.data)
{
    line.plot.to.date.time(power.data, 'Reactive.Power', 'datetime',
                           'Global_reactive_power')
}

multi.plot <- function(power.data)
{
    par(mfrow = c(2, 2))
    plot.active.power.to.date.time(power.data, FALSE)
    plot.voltage.to.date.time(power.data)
    plot.sub.metering.to.date.time(power.data, FALSE)
    plot.reactive.power.to.date.time(power.data)
}
