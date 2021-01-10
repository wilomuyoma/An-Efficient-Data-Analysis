library(tidyverse)

book_review_df = read_csv("book_reviews.csv")

head(book_review_df)
ncol(book_review_df)
nrow(book_review_df)



for( c in colnames(book_review_df)){
  typeof(book_review_df[[c]])
}

