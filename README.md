Run_analysis
============

Script creates a tidy data set of average data collected from the accelerometers from the Samsung Galaxy S smartphone for each activity and each subject.

Data collected from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

============
Script does:
 1. Merging the test sets
  1.1. Read in the data from subject test, test activities, test data 
  1.2. Separate elements by whitepace
  1.3. Convert data to numeric format 
  1.4. Merging the test sets
2. Merging the training sets
  2.1. Read in the data from subject training, training activities, training data
  1.2. Separate elements by whitepace
  1.3. Convert data to numeric format 
  1.4. Merging the training sets
3. Merging the training and the test sets into one data set
4. Shaping the data set 
  4.1. Subset the data by subjects
  4.2. Additional subset by activity
  4.3. Calculate average of each variable for each activity and each subject 
  4.4. Create tidy set of averages 



