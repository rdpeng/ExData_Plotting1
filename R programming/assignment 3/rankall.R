rankall <- function(outcome,num){
  setwd("C:/Users/monahaghighi/Desktop/coursera_assignment 3")
  file <- read.csv("outcome-of-care-measures.csv")
  disease <- c("heart attack","heart failure","pneumonia")
  output <- matrix(0,50,2)
  colnames(output)<-c("hospital","state")
  if (num=="best"){num=1}
  if (!(tolower(outcome) %in% disease)){
      stop ("invalid outcome")
    } else if (tolower(outcome)=="heart attack"){
      for (i in 1:50){
        dd <- file[ file$State==state.abb[i] ,c(2,11) ]
        dd <- dd[dd[,2]!="Not Available",]
        dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
        if (num=="worst"){
          output[i,1] <- as.character(dd[dim(dd)[1],1])
          output[i,2] <- as.character(state.abb[i])  
        } else {
          if (num > dim(dd)[1]){
            output[i,1] <- "NA"
            output[i,2] <- as.character(state.abb[i])
          } else {
            output[i,1] <- as.character(dd[num,1])
            output[i,2] <- as.character(state.abb[i])
          }
        }}} else if (tolower(outcome)=="heart failure") {
          for (i in 1:50){
            dd <- file[ file$State==state.abb[i] ,c(2,17) ]
            dd <- dd[dd[,2]!="Not Available",]
            dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
            if (num=="worst"){
              output[i,1] <- as.character(dd[dim(dd)[1],1])
              output[i,2] <- as.character(state.abb[i])  
            } else {
              if (num > dim(dd)[1]){
                output[i,1] <- "NA"
                output[i,2] <- as.character(state.abb[i])
              } else {
                output[i,1] <- as.character(dd[num,1])
                output[i,2] <- as.character(state.abb[i])
              }
            }}        
      } else if (tolower(outcome)=="pneumonia"){
        for (i in 1:50){
          dd <- file[ file$State==state.abb[i] ,c(2,23) ]
          dd <- dd[dd[,2]!="Not Available",]
          dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
          if (num=="worst"){
            output[i,1] <- as.character(dd[dim(dd)[1],1])
            output[i,2] <- as.character(state.abb[i])  
          } else {
            if (num > dim(dd)[1]){
              output[i,1] <- "NA"
              output[i,2] <- as.character(state.abb[i])
            } else {
              output[i,1] <- as.character(dd[num,1])
              output[i,2] <- as.character(state.abb[i])
            }
          }}        
      }
  return(as.data.frame(output))
}