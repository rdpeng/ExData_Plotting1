gettingandcleaningdata
======================

This is the code book for the UCI_HAR_Dataset

There are 6 files that are to be uploaded:
1) X_test.txt
2) y_test.txt
3) subject_test.txt
4) X_train.txt
5) y_train.txt
6) subject_train.txt

In the case of the y_ and the subject_ the column names are relabelled from V1 to y in the 
y_ case and to Subject in the subject_ case.

The test data sets are combined to creat a test_data data set.
The train data sets are combined to creat a train_data data set.
 
The test_data and train_data are then combined to create ONE data set

The raw data now starts to get manipulated. The following columns are combined into a 'new' data set called Data

The following columns(representing the mean and standard deviation) are extracted from the raw data

"Subject","y","V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46",
"V81","V82","V83","V84","V85","V86","V121","V122","V123","V124","V125","V126",
"V161","V162","V163","V164","V165","V166","V201","V202","V214","V215","V227","V228","V240","V241","V253","V254",
"V266","V267","V268","V269","V270","V271","V345","V346","V347","V348","V349","V350",
"V424","V425","V426","V427","V428","V429","V503","V504","V516","V517","V529","V530","V542","V543"

The column y was then transformed into a column Avtivity where the value in the column 
was changed to a descriptive activity instead of a numerical value. Using the key:

1 == walking
2 == walking_up_stairs
3 == walking_down_stairs
4 == sitting
5 == standing
6 == laying_down

This maybe overkill, but I read the features_info.txt file and created descriptive variable names
(perhaps too descriptive)

V1 == mean_accelermeter_measurement_of_body_signal_in_time_domain_along_x_axis
V2 == mean_accelermeter_measurement_of_body_signal_in_time_domain_along_y_axis
V3 == mean_accelermeter_measurement_of_body_signal_in_time_domain_along_z_axis
V4 == standard_deviation_of_accelermeter_measurement_of_body_signal_in_time_domain_along_x_axis
V5 == standard_deviation_of_accelermeter_measurement_of_body_signal_in_time_domain_along_y_axis
V6 == standard_deviation_of_accelermeter_measurement_of_body_signal_in_time_domain_along_z_axis 

V41 == mean_accelermeter_measurement_of_gravity_signal_in_time_domain_along_x_axis
V42 == mean_accelermeter_measurement_of_gravity_signal_in_time_domain_along_y_axis
V43 == mean_accelermeter_measurement_of_gravity_signal_in_time_domain_along_z_axis
V44 == standard_deviation_of_accelermeter_measurement_of_gravity_signal_in_time_domain_along_x_axis
V45 == standard_deviation_of_accelermeter_measurement_of_gravity_signal_in_time_domain_along_y_axis
V46 == standard_deviation_of_accelermeter_measurement_of_gravity_signal_in_time_domain_along_z_axis

V81 == mean_linear_acceleration_of_body_signal_in_time_domain_along_x_axis
V82 == mean_linear_acceleration_of_body_signal_in_time_domain_along_y_axis
V83 == mean_linear_acceleration_of_body_signal_in_time_domain_along_z_axis
V84 == standard_deviation_of_linear_acceleration_of_body_signal_in_time_domain_along_x_axis
V85 == standard_deviation_of_linear_acceleration_of_body_signal_in_time_domain_along_y_axis
V86 == standard_deviation_of_linear_acceleration_of_body_signal_in_time_domain_along_z_axis

V121 == mean_gyroscope_measurement_of_body_signal_in_time_domain_along_x_axis
V122 == mean_gyroscope_measurement_of_body_signal_in_time_domain_along_y_axis
V123 == mean_gyroscope_measurement_of_body_signal_in_time_domain_along_z_axis
V124 == standard_deviation_of_gyroscope_measurement_of_body_signal_in_time_domain_along_x_axis
V125 == standard_deviation_of_gyroscope_measurement_of_body_signal_in_time_domain_along_y_axis
V126 == standard_deviation_of_gyroscope_measurement_of_body_signal_in_time_domain_along_z_axis

V161 == mean_angular_velocity_measurement_of_body_signal_in_time_domain_along_x_axis
V162 == mean_angular_velocity_measurement_of_body_signal_in_time_domain_along_y_axis
V163 == mean_angular_velocity_measurement_of_body_signal_in_time_domain_along_z_axis
V164 == standard_deviation_of_angular_velocity_measurement_of_body_signal_in_time_domain_along_x_axis
V165 == standard_deviation_of_angular_velocity_measurement_of_body_signal_in_time_domain_along_y_axis
V166 == standard_deviation_of_angular_velocity_measurement_of_body_signal_in_time_domain_along_z_axis

V201 == mean_of_the_Euclidean_norm_of_accelermeter_measurement_of_body_signal_in_time_domain
V202 == standard_deviation_of_the_Euclidean_norm_of_accelermeter_measurement_of_body_signal_in_time_domain
V214 == mean_of_the_Euclidean_norm_of_accelermeter_measurement_of_gravity_signal_in_time_domain
V215 == standard_deviation_of_the_Euclidean_norm_of_accelermeter_measurement_of_gravity_signal_in_time_domain
V227 == mean_of_the_Euclidean_norm_of_linear_acceleration_of_body_signal_in_time_domain
V228 == standard_deviation_of_the_Euclidean_norm_of_linear_acceleration_of_body_signal_in_time_domain
V240 == mean_of_the_Euclidean_norm_of_gyroscope_measurement_of_body_signal_in_time_domain
V241 == standard_deviation_of_the_Euclidean_norm_of_gyroscope_measurement_of_body_signal_in_time_domain
V253 == mean_of_the_Euclidean_norm_of_angular_velocity_measurement_of_body_signal_in_time_domain
V254 == standard_deviation_of_the_Euclidean_norm_of_angular_velocity_measurement_of_body_signal_in_time_domain

V266 == mean_accelermeter_measurement_of_body_signal_in_frequency_domain_along_x_axis
V267 == mean_accelermeter_measurement_of_body_signal_in_frequency_domain_along_y_axis
V268 == mean_accelermeter_measurement_of_body_signal_in_frequency_domain_along_z_axis
V269 == standard_deviation_of_accelermeter_measurement_of_body_signal_in_frequency_domain_along_x_axis
V270 == standard_deviation_of_accelermeter_measurement_of_body_signal_in_frequency_domain_along_y_axis
V271 ==standard_deviation_of_accelermeter_measurement_of_body_signal_in_frequency_domain_along_z_axis

V345 == mean_linear_acceleration_of_body_signal_in_frequency_domain_along_x_axis
V346 == mean_linear_acceleration_of_body_signal_in_frequency_domain_along_y_axis
V347 == mean_linear_acceleration_of_body_signal_in_frequency_domain_along_z_axis
V348 == standard_deviation_of_linear_acceleration_of_body_signal_in_frequency_domain_along_x_axis
V349 == standard_deviation_of_linear_acceleration_of_body_signal_in_frequency_domain_along_y_axis
V350 == standard_deviation_of_linear_acceleration_of_body_signal_in_frequency_domain_along_z_axis

V424 == mean_gyroscope_measurement_of_body_signal_in_frequency_domain_along_x_axis
V425 == mean_gyroscope_measurement_of_body_signal_in_frequency_domain_along_y_axis
V426 == mean_gyroscope_measurement_of_body_signal_in_frequency_domain_along_z_axis
V427 == standard_deviation_of_gyroscope_measurement_of_body_signal_in_frequency_domain_along_x_axis
V428 == standard_deviation_of_gyroscope_measurement_of_body_signal_in_frequency_domain_along_y_axis
V429 == standard_deviation_of_gyroscope_measurement_of_body_signal_in_frequency_domain_along_z_axis

V503 == mean_of_the_Euclidean_norm_of_accelermeter_measurement_of_body_signal_in_frequency_domain
V504 == standard_deviation_of_the_Euclidean_norm_of_accelermeter_measurement_of_body_signal_in_frequency_domain
V516 == mean_of_the_Euclidean_norm_of_linear_acceleration_of_body_signal_in_frequency_domain
V517 == standard_deviation_of_the_Euclidean_norm_of_linear_acceleration_of_body_signal_in_frequency_domain
V529 == mean_of_the_Euclidean_norm_of_gyroscope_measurement_of_body_signal_in_frequency_domain
V530 == standard_deviation_of_the_Euclidean_norm_of_gyroscope_measurement_of_body_signal_in_frequency_domain
V542 == mean_of_the_Euclidean_norm_of_angular_velocity_measurement_of_body_signal_in_frquency_domain
V543 == standard_deviation_of_the_Euclidean_norm_of_angular_velocity_measurement_of_body_signal_in_frquency_domain

Then create a tidy data set with the average of each variable for each activity and each subject

Finally creates a local txt version of the tidy_data data set
