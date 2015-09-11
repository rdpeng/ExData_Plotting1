best <- function(state,outcome){
  
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
        dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
        return (as.character(dd[1,1]))
      } else if (tolower(outcome)=="heart failure") {
        
        dd <- file[ file$State==state ,c(2,17) ]
        dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
        return (as.character(dd[1,1]))
        
      } else if (tolower(outcome)=="pneumonia"){
        
        dd <- file[ file$State==state ,c(2,23) ]
        dd <- dd[order(as.numeric(paste(dd[,2]) , na.rm = TRUE),dd[,1]) , ]
        return (as.character(dd[1,1]))
      }
  }
