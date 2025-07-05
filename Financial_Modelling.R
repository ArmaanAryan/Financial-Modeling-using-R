
if (!require(tidyquant)) {
  install.packages("tidyquant", dependencies = TRUE)
}

library(tidyquant)


stock_data <- tq_get('TSLA')

str(stock_data)

tail(stock_data)

plot(stock_data$date, stock_data$adjusted, type="l", col="blue")

plot(stock_data$date, stock_data$adjusted, 
     type = "l", xlab = "Date", ylab = "Adjusted price", 
     main = "Tesla stock price", col = "blue")

NAS <- tq_get("NDX")

str(NAS)

par(mar = c(5, 5, 2, 5))
plot(NAS$date, NAS$adjusted, type = "l", col = "red",
     ylab = "Nasdaq 100 index",
     xlab = "Date")
par(new = T)
plot(stock_data$date, stock_data$adjusted, 
     type = "l", axes = F, xlab = NA, ylab = NA, cex = 1.2)
axis(side = 4)
mtext(side = 4, line = 3, "Tesla stock price")
legend("topleft",
       legend=c("NAS100", "Tesla"),
       lty = 1, col = c("red", "blue"))

tesla_diff = stock_data$high - stock_data$low

plot(stock_data$date, aapl_diff, type="h", xlab="Date", ylab="Diff", col="purple")
