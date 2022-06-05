library(dplyr)

# PART ONE

mechaCar_df <- read.csv("Resources/MechaCar_mpg.csv")

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
     ground_clearance + AWD ,mechaCar_df)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
             ground_clearance + AWD, mechaCar_df))

# PART TWO

coil_df <- read.csv("Resources/Suspension_Coil.csv")

total_summary <- coil_df %>% 
  summarize(Mean = mean(PSI), Median = median(PSI), 
            Variance = var(PSI), SD = sd(PSI), 
            .groups = "keep" )

lot_summary <- coil_df %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI), Median = median(PSI), 
            Variance = var(PSI), SD = sd(PSI), 
            Vehicle_Count = n(),
            .groups = "keep" )

# PART THREE

t.test(subset(coil_df, Manufacturing_Lot %in% "Lot1", select=PSI), 
       mu=1500
)

t.test(subset(coil_df, Manufacturing_Lot %in% "Lot2", select=PSI), 
       mu=1500, 
)

t.test(subset(coil_df, Manufacturing_Lot %in% "Lot3", select=PSI), 
       mu=1500)
