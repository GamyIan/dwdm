library(dbscan)
data = read.csv("D:\\Virus\\R Studio\\DBSCAN\\dbscan_aug.csv")
model = dbscan(data, eps=0.75, minPts = 3)
model
plot(data$X,data$Y, col=model$cluster)