#Load all the data into 6 files, 3 test files and 3 train files

temp<-tempfile()
fileURL="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,temp,method="curl")
X_test<- read.table(unz(temp,"UCI\ HAR\ Dataset/test/X_test.txt"))
subject_test<- read.table(unz(temp,"UCI\ HAR\ Dataset/test/subject_test.txt"))
y_test<- read.table(unz(temp,"UCI\ HAR\ Dataset/test/y_test.txt"))
X_train<- read.table(unz(temp,"UCI\ HAR\ Dataset/train/X_train.txt"))
subject_train<- read.table(unz(temp,"UCI\ HAR\ Dataset/train/subject_train.txt"))
y_train<- read.table(unz(temp,"UCI\ HAR\ Dataset/train/y_train.txt"))
unlink(temp)

#Name the columns of the subject and y, in both test and train files, so that you 
#can cbind them to the X_test and X_train data set to get 
#one Test data set and one Train data set 

subject_test<-setnames(subject_test,"V1","Subject")
subject_train<-setnames(subject_train,"V1","Subject")
y_test<-setnames(y_test,"V1","y")
y_train<-setnames(y_train,"V1","y")

#Call cbind to create one Test data set and one Train data set

subject_y_test_bind <- cbind(subject_test, y_test)
subject_y_train_bind <- cbind(subject_train, y_train)
test_data <- cbind(subject_y_test_bind, X_test)
train_data <- cbind(subject_y_train_bind, X_train)

#Combine the Test and Train data set into one data set combinedData 
#This completes Step 1 in the project
combinedData <- rbind(test_data,train_data)

#I am now extracting only the measurements on mean and standard deviation 
#for each measurement
#This completes Step 2 in the project
Data <- combinedData[,c("Subject","y","V1","V2","V3","V4","V5","V6",
            "V41","V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86",
            "V121","V122","V123","V124","V125","V126","V161","V162","V163","V164","V165","V166",
            "V201","V202","V214","V215","V227","V228","V240","V241","V253","V254",
            "V266","V267","V268","V269","V270","V271","V345","V346","V347","V348","V349","V350",
            "V424","V425","V426","V427","V428","V429",
            "V503","V504","V516","V517","V529","V530","V542","V543")]

#Create a dummy column in the Data data set, and then replace the numbers under the y column
#with descriptive activity names. I am calling the new column Activity and deleting the 
#y column once the Activity column has been populated
#This completes Step 3 in the project

Data$Activity <- "placeholder"

Data$Activity[Data$y == 1] <- "walking"
Data$Activity[Data$y == 2] <- "walking_up_stairs"
Data$Activity[Data$y == 3] <- "walking_down_stairs"
Data$Activity[Data$y == 4] <- "sitting"
Data$Activity[Data$y == 5] <- "standing"
Data$Activity[Data$y == 6] <- "laying_down"

Data <- subset(Data, select = -y)

#I am using the setnames function to relabel the data set with descriptive names
#This completes Step 4 in the project

Data<-setnames(Data,"V1","mean_accelermeter_measurement_of_body_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V2","mean_accelermeter_measurement_of_body_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V3","mean_accelermeter_measurement_of_body_signal_in_time_domain_along_z_axis")
Data<-setnames(Data,"V4","standard_deviation_of_accelermeter_measurement_of_body_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V5","standard_deviation_of_accelermeter_measurement_of_body_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V6","standard_deviation_of_accelermeter_measurement_of_body_signal_in_time_domain_along_z_axis")

Data<-setnames(Data,"V41","mean_accelermeter_measurement_of_gravity_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V42","mean_accelermeter_measurement_of_gravity_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V43","mean_accelermeter_measurement_of_gravity_signal_in_time_domain_along_z_axis")
Data<-setnames(Data,"V44","standard_deviation_of_accelermeter_measurement_of_gravity_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V45","standard_deviation_of_accelermeter_measurement_of_gravity_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V46","standard_deviation_of_accelermeter_measurement_of_gravity_signal_in_time_domain_along_z_axis")

Data<-setnames(Data,"V81","mean_linear_acceleration_of_body_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V82","mean_linear_acceleration_of_body_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V83","mean_linear_acceleration_of_body_signal_in_time_domain_along_z_axis")
Data<-setnames(Data,"V84","standard_deviation_of_linear_acceleration_of_body_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V85","standard_deviation_of_linear_acceleration_of_body_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V86","standard_deviation_of_linear_acceleration_of_body_signal_in_time_domain_along_z_axis")

Data<-setnames(Data,"V121","mean_gyroscope_measurement_of_body_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V122","mean_gyroscope_measurement_of_body_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V123","mean_gyroscope_measurement_of_body_signal_in_time_domain_along_z_axis")
Data<-setnames(Data,"V124","standard_deviation_of_gyroscope_measurement_of_body_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V125","standard_deviation_of_gyroscope_measurement_of_body_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V126","standard_deviation_of_gyroscope_measurement_of_body_signal_in_time_domain_along_z_axis")

Data<-setnames(Data,"V161","mean_angular_velocity_measurement_of_body_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V162","mean_angular_velocity_measurement_of_body_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V163","mean_angular_velocity_measurement_of_body_signal_in_time_domain_along_z_axis")
Data<-setnames(Data,"V164","standard_deviation_of_angular_velocity_measurement_of_body_signal_in_time_domain_along_x_axis")
Data<-setnames(Data,"V165","standard_deviation_of_angular_velocity_measurement_of_body_signal_in_time_domain_along_y_axis")
Data<-setnames(Data,"V166","standard_deviation_of_angular_velocity_measurement_of_body_signal_in_time_domain_along_z_axis")

Data<-setnames(Data,"V201","mean_of_the_Euclidean_norm_of_accelermeter_measurement_of_body_signal_in_time_domain")
Data<-setnames(Data,"V202","standard_deviation_of_the_Euclidean_norm_of_accelermeter_measurement_of_body_signal_in_time_domain")
Data<-setnames(Data,"V214","mean_of_the_Euclidean_norm_of_accelermeter_measurement_of_gravity_signal_in_time_domain")
Data<-setnames(Data,"V215","standard_deviation_of_the_Euclidean_norm_of_accelermeter_measurement_of_gravity_signal_in_time_domain")
Data<-setnames(Data,"V227","mean_of_the_Euclidean_norm_of_linear_acceleration_of_body_signal_in_time_domain")
Data<-setnames(Data,"V228","standard_deviation_of_the_Euclidean_norm_of_linear_acceleration_of_body_signal_in_time_domain")
Data<-setnames(Data,"V240","mean_of_the_Euclidean_norm_of_gyroscope_measurement_of_body_signal_in_time_domain")
Data<-setnames(Data,"V241","standard_deviation_of_the_Euclidean_norm_of_gyroscope_measurement_of_body_signal_in_time_domain")
Data<-setnames(Data,"V253","mean_of_the_Euclidean_norm_of_angular_velocity_measurement_of_body_signal_in_time_domain")
Data<-setnames(Data,"V254","standard_deviation_of_the_Euclidean_norm_of_angular_velocity_measurement_of_body_signal_in_time_domain")

Data<-setnames(Data,"V266","mean_accelermeter_measurement_of_body_signal_in_frequency_domain_along_x_axis")
Data<-setnames(Data,"V267","mean_accelermeter_measurement_of_body_signal_in_frequency_domain_along_y_axis")
Data<-setnames(Data,"V268","mean_accelermeter_measurement_of_body_signal_in_frequency_domain_along_z_axis")
Data<-setnames(Data,"V269","standard_deviation_of_accelermeter_measurement_of_body_signal_in_frequency_domain_along_x_axis")
Data<-setnames(Data,"V270","standard_deviation_of_accelermeter_measurement_of_body_signal_in_frequency_domain_along_y_axis")
Data<-setnames(Data,"V271","standard_deviation_of_accelermeter_measurement_of_body_signal_in_frequency_domain_along_z_axis")

Data<-setnames(Data,"V345","mean_linear_acceleration_of_body_signal_in_frequency_domain_along_x_axis")
Data<-setnames(Data,"V346","mean_linear_acceleration_of_body_signal_in_frequency_domain_along_y_axis")
Data<-setnames(Data,"V347","mean_linear_acceleration_of_body_signal_in_frequency_domain_along_z_axis")
Data<-setnames(Data,"V348","standard_deviation_of_linear_acceleration_of_body_signal_in_frequency_domain_along_x_axis")
Data<-setnames(Data,"V349","standard_deviation_of_linear_acceleration_of_body_signal_in_frequency_domain_along_y_axis")
Data<-setnames(Data,"V350","standard_deviation_of_linear_acceleration_of_body_signal_in_frequency_domain_along_z_axis")

Data<-setnames(Data,"V424","mean_gyroscope_measurement_of_body_signal_in_frequency_domain_along_x_axis")
Data<-setnames(Data,"V425","mean_gyroscope_measurement_of_body_signal_in_frequency_domain_along_y_axis")
Data<-setnames(Data,"V426","mean_gyroscope_measurement_of_body_signal_in_frequency_domain_along_z_axis")
Data<-setnames(Data,"V427","standard_deviation_of_gyroscope_measurement_of_body_signal_in_frequency_domain_along_x_axis")
Data<-setnames(Data,"V428","standard_deviation_of_gyroscope_measurement_of_body_signal_in_frequency_domain_along_y_axis")
Data<-setnames(Data,"V429","standard_deviation_of_gyroscope_measurement_of_body_signal_in_frequency_domain_along_z_axis")

Data<-setnames(Data,"V503","mean_of_the_Euclidean_norm_of_accelermeter_measurement_of_body_signal_in_frequency_domain")
Data<-setnames(Data,"V504","standard_deviation_of_the_Euclidean_norm_of_accelermeter_measurement_of_body_signal_in_frequency_domain")
Data<-setnames(Data,"V516","mean_of_the_Euclidean_norm_of_linear_acceleration_of_body_signal_in_frequency_domain")
Data<-setnames(Data,"V517","standard_deviation_of_the_Euclidean_norm_of_linear_acceleration_of_body_signal_in_frequency_domain")
Data<-setnames(Data,"V529","mean_of_the_Euclidean_norm_of_gyroscope_measurement_of_body_signal_in_frequency_domain")
Data<-setnames(Data,"V530","standard_deviation_of_the_Euclidean_norm_of_gyroscope_measurement_of_body_signal_in_frequency_domain")
Data<-setnames(Data,"V542","mean_of_the_Euclidean_norm_of_angular_velocity_measurement_of_body_signal_in_frquency_domain")
Data<-setnames(Data,"V543","standard_deviation_of_the_Euclidean_norm_of_angular_velocity_measurement_of_body_signal_in_frquency_domain")

#This is a second "tidy" data set with teh average of each variable for each activity 
#and each subject
#This completes Step 5 in the project

tidy_data <- summarise_each(group_by(Data,Subject,Activity),funs(mean))

#This creates a local txt version of the tidy_data data set to uploaded 

write.table(tidy_data, "/Users/cmichael/data/tidy_data.txt", row.name=FALSE)