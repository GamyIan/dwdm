library(class)
dataset = data("iris")
summary(iris)
set.seed(100)
sample_data = sample(1:nrow(iris),0.9*nrow(iris))
train_data = iris[sample_data,]
test_data = iris[-sample_data,]

train_x = train_data[,1:4]
train_y = train_data[,5]
test_x = test_data[,1:4]
test_y = test_data[,5]s

normalize = function(x)
{
  mx = max(x)
  mn = min(x)
  
  return ((x-mn)/(mx-mn))
  
}
train_x = as.data.frame(lapply(train_x,normalize))
test_x = as.data.frame(lapply(test_x,normalize))

prediction = knn(train=train_x, 
                 test=test_x, 
                 cl=train_y, 
                 k=11)

confusion_mat = table(Actual=test_y, Predicted=prediction)
# For direct confusion matrix
library(caret)
confusionMatrix(prediction,test_y)


