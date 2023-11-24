# loading libraries
library(caret)
library(randomForest)
library(class)

# loading the enviromnet
load("data/models.RData")

cat("","###########################",
    "#                         #",
    "# -Select a .csv file-    #",
    "#                         #",
    "###########################", 
    sep = "\n")


infile <- file.choose()
testing_data <- read.csv(infile)

# predict_tessting_data
# SVM
predict_test_svm <- predict(SVM_radial_bor14, newdata = testing_data[,1:14])
# knn model
predict_test_knn <- knn(train = traindata[,1:14], test = testing_data[,1:14], cl = traindata$Type, k=3)
# RF model
predict_test_rf <- predict(CV.RF, testing_data[,1:14])

# predict_test_svm
# predict_test_knn
# predict_test_rf

predict_test_svm <- as.character(predict_test_svm)
predict_test_knn <- as.character(predict_test_knn)
predict_test_rf <- as.character(predict_test_rf)


probs <- cbind.data.frame(predict_test_svm, predict_test_knn,predict_test_rf)


# Function to get the majority vote
get_majority_vote <- function(row) {
  counts <- table(row)
  majority_label <- names(counts)[which.max(counts)]
  return(majority_label)
}

# Apply the majority vote function row-wise to get the final prediction
probs$majority_vote <- apply(probs, 1, get_majority_vote)

# Display the final predictions
final_prediction <- probs$majority_vote
cat("-----------------------------------------------------------------------------------------------------", sep = '\n')

cat("Given sample: ", final_prediction, "\n")
cat("Please see the file ovarian_cancer_prediction.csv generated in working directory", sep = '\n')
cat("-----------------------------------------------------------------------------------------------------")
result <- cbind.data.frame(Sample = rownames(testing_data), 
                           SVM = predict_test_svm,
                           kNN = predict_test_knn,
                           RF = predict_test_rf,
                           Majority_Vote_from_3_models = final_prediction)
write.csv(result, file = 'ovarian_cancer_prediction.csv', row.names = F)















