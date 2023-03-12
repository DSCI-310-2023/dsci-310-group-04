# function input for tests
three_value_113 <- data.frame(first_column = c("class1", "class2", "class3", "class3", "class3"), second_column = c(1,1,1,1,1))
one_value_2 <- data.frame(first_column = c("class1", "class1"))
empty_df  <- data.frame()


# expected function output
three_value_113_out <- data.frame(first_column = c("class1", "class2", "class3"), class_n = c(1,1,3), class_prop = c(20,20,60))
one_value_2_out <- data.frame(first_column = c("class1"), one_n = 2, one_prop = 100)
