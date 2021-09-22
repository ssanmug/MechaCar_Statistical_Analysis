library(dplyr)

# Deliverable 1
demo_table <- read.csv(file='~/Desktop/Analysis Projects (Class Folder)/MechaCar_Statistical_Analysis/Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=demo_table) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=demo_table)) #generate summary statistics

# Deliverable 2
susp_coil <- read.csv(file='~/Desktop/Analysis Projects (Class Folder)/MechaCar_Statistical_Analysis/Resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- susp_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'drop') #create summary table for PSI column
lot_summary <- susp_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'drop') #create summary table for each lot

# Deliverable 3
t.test(susp_coil$PSI, mu=1500) #two-tailed t-test for all manufacturing lots 

t.test(subset(susp_coil$PSI, susp_coil$Manufacturing_Lot=="Lot1"), mu=1500) # t-test for Lot1

t.test(subset(susp_coil$PSI, susp_coil$Manufacturing_Lot=="Lot2"), mu=1500) # t-test for Lot2

t.test(subset(susp_coil$PSI, susp_coil$Manufacturing_Lot=="Lot3"), mu=1500) # t-test for Lot3
