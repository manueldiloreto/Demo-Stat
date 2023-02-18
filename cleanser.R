#### Cleaning function 1: births dataset ####
cleanse_b <- function(df) {
  
  # Remove useless variables
  df <- df %>% select(ITTER107, OBS_VALUE, TIME)
  
  # Transform OBS_VALUE from chr to numeric
  df$OBS_VALUE <- as.numeric(df$OBS_VALUE)
  
  # Reformat TIME from chr to date
  df$TIME <- as_date(df$TIME, format="%Y") 
  
  # Change column names
  colnames(df) <- c('area_code', 'births', 'date')
  
  # Assign area name
  df <- left_join(df, denominator, by="area_code")
  
  
  df
}

#### Cleaning function 2: deaths dataset ####
cleanse_d <- function(df) {
  
  # Remove useless variables
  df <- df %>% select(ITTER107, OBS_VALUE, TIME)
  
  # Transform OBS_VALUE from chr to numeric
  df$OBS_VALUE <- as.numeric(df$OBS_VALUE)
  
  # Reformat TIME from chr to date
  df$TIME <- as_date(df$TIME, format="%Y") 
  
  # Change column names
  colnames(df) <- c('area_code', 'deaths', 'date')
  
  # Assign area name
  df <- left_join(df, denominator, by="area_code")  
  
  
  df
}


#### Cleaning function 3: population datasets ####
cleanse <- function(df) {
  # Removes variable showing TOTAL
  df <- df[!(df$ETA1=="TOTAL"),]
  
  # Remove useless variables
  df <- df %>% select(ETA1, ITTER107, OBS_VALUE, SEXISTAT1, TIME)
  
  # Reformat TIME from chr to date
  df$TIME <- as_date(df$TIME, format="%Y") 
  
  # Transform ETA1 from chr to numeric
  df$ETA1 <- gsub('[Y_GE]','', df$ETA1)
  df$ETA1 <- as.numeric(df$ETA1)
  
  # Transform OBS_VALUE from chr to numeric
  df$OBS_VALUE <- as.numeric(df$OBS_VALUE)
  
  # Transform SEXISTAT1 values to "male" and "female"
  df$SEXISTAT1 <- if_else(df$SEXISTAT1=="1", "male", "female")
  
  # Change column names
  colnames(df) <- c('age', 'area_code', 'population', 'sex', 'date')
  
  # Assign area name
  df <- left_join(df, denominator, by="area_code")
  
  # Split
  df <- spread(df, sex, population)
  
  # drop NAs
  df <- df %>% drop_na()
  
  # Transform age into age groups, use if needed #
  # df$age <- AMR::age_groups(df$age, split_at="fives")
  
  df
}