library(tidyverse)

book_review_df = read_csv("book_reviews.csv")

head(book_review_df)
ncol(book_review_df)
nrow(book_review_df)



for( c in colnames(book_review_df)){
  print(typeof(book_review_df[[c]]))
}

for ( c in colnames(book_review_df) ) {
  
  print("Unique value (s) are :")
  print(c)
  print(unique(book_review_df[[c]]))
}

#removed missing data 
complete_review <- book_review_df %>% 
  drop_na()

view(unique(complete_review[["state"]]))

complete_review <- complete_review %>% 
  mutate(
    state = case_when(
      state == "California" ~ "CA",
      state == "New York" ~ "NY",
      state == "Texas" ~ "TX",
      state == "Florida" ~ "FL",
      TRUE ~ state # ignore cases where it's already postal code
    )
  )

view(unique(complete_review[["state"]]))

complete_review <- complete_review %>% 
  mutate( review_num = case_when(
    review == "Poor" ~ 1,
    review == "Fair" ~ 2,
    review == "Good" ~ 3,
    review == "Great" ~ 4,
    review == "Excellent" ~ 5
)
)

complete_review %>% 
  group_by(book) %>% 
  summarise(purchased = sum(price)) %>% 
  arrange(desc(purchased))


         