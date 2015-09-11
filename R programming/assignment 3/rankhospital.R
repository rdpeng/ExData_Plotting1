rankhospital <- function(state,outcome,num){
  setwd("C:/Users/monahaghighi/Desktop/coursera_assignment 3")
  file <- read.csv("outcome-of-care-measures.csv")
  disease <- c("heart attack","heart failure","pneumonia")
  state <- toupper(state)
  if (!(state %in% state.abb)){
    stop("invalid state")
  } else if (!(tolower(outcome) %in% disease)){
      stop ("invalid outcome")
    } else if (tolower(outcome)=="heart attack"){ 
        dd <- file[ file$State==state ,c(2,11) ]
        dd <- dd[dd[,2]!="Not Available",]
        dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
        if (num=="best"){
          return(as.character(dd[1,1]))
        } else if (num=="worst"){
          return (as.character(dd[dim(dd)[1],1]))
        } else{
          num <- as.numeric(paste(num))
          if (num > dim(dd)[1]){
            return ("NA")
          } else {return(as.character(dd[num,1]))}
        }
      } else if (tolower(outcome)=="heart failure") {
        
        dd <- file[ file$State==state ,c(2,17) ]
        dd <- dd[dd[,2]!="Not Available",]
        dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
        if (num=="best"){
          return(as.character(dd[1,1]))
        } else if (num=="worst"){
          return (as.character(dd[dim(dd)[1],1]))
        } else{
          num <- as.numeric(paste(num))
          if (num>dim(dd)[1]){
            return ("NA")
          } else {
          return(as.character(dd[num,1]))
        }}
      } else if (tolower(outcome)=="pneumonia"){
        
        dd <- file[ file$State==state ,c(2,23) ]
        dd <- dd[dd[,2]!="Not Available",]
        dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
        if (num=="best"){
          return(as.character(dd[1,1]))
        } else if (num=="worst"){
          return (as.character(dd[dim(dd)[1],1]))
        } else{
          num <- as.numeric(paste(num))
          if (num > dim(dd)[1]){
            return ("NA")
          } else {  return(as.character(dd[num,1]))
        }      }
  }}
