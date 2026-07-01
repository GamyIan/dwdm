# Importing libraries
library(rpart)
library(rpart.plot)
library(caret)

# Loading and Splitting the data
data(iris)

set.seed(123)

sample_index = sample(1:nrow(iris), size=0.92*nrow(iris))

train_data = iris[sample_index,]
test_data = iris[-sample_index,]

test_x = test_data[,1:4]
test_y = test_data[,5]

# Making the Tree Model
tree_model = rpart(Species~., data= train_data, method = "class", 
                   control = rpart.control(minsplit = 3, cp=0.001))



print(tree_model)

rpart.plot(tree_model)

# Making prediction on test data and viewing confusion matrix
prediction = predict(tree_model, test_x, type="class")
prediction

confusionMatrix(prediction, test_y)

#Pruning the Tree
pruned_tree = prune(tree_model, cp = 0.01, minsplit=5)
rpart.plot(pruned_tree)

