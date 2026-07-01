library(readxl)
library(rpart)
library(rpart.plot)
library(caret)

bank=read_excel("D:\\Virus\\R\\Practical 2\\bank_tree.xlsx")
summary(bank)

set.seed(100)
sample_index = sample(1:nrow(bank), size=0.92*nrow(bank))

train_data = bank[sample_index,]
test_data = bank[-sample_index,]

test_x = test_data[,1:16]
test_y = test_data[,17]

tree = rpart(y~., data= train_data, method = "class")
rpart.plot(tree)
plotcp(tree)
printcp(tree)


prediction = predict(tree,test_x, type="class")
prediction
test_y = as.factor(test_data$y)
confusionMatrix(prediction,test_data$y)
