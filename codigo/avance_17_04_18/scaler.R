data <- read.csv("train.csv")

data <- data[,-1]

data <- scale(data)

train <- data[1:222,]

write.csv(train,"train_sc.csv")

#data <- read.csv("val.csv")

#data <- data[,-1]

#data <- scale(data)

val <- data[-c(1:111),]

write.csv(val,"val_sc.csv")
