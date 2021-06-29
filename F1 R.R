data <- read.csv("C:/Users/Braun Family/Documents/CSU Global/MIS581 Capstone/F1 Data.csv")

install.packages("party")
library(party)
library(rpart)


head(data)

data['Percent.Completed.at.Fastest.Lap']

na.omit(data['Percent.Completed.at.Fastest.Lap'])

data <- data[data['Percent.Completed.at.Fastest.Lap'] != "NULL", ]

data$Podium <- ifelse(data$Finishing.Position <= 3, 1, 0)

# Logistic Regression with 1 predictor
mylogit <- glm(Podium ~ Constructor.Engine, data = data, family = "binomial")

summary(mylogit)

confint(mylogit)

# Logistic regression witha  few predictors
mylogit1 <- glm(Podium ~ Starting.Position + Constructor.Engine + Driver.Age.at.Race.in.Days, 
                data = data, family = "binomial")

summary(mylogit1)

confint(mylogit1)

tree_output <- ctree(Podium ~ Starting.Position + Constructor.Engine + Driver.Age.at.Race.in.Days + Percent.Completed.at.Fastest.Lap,
                     data = data)

plot(tree_output)

tree2 <- rpart(Podium ~ Starting.Position + Constructor.Engine + Driver.Age.at.Race.in.Days + Percent.Completed.at.Fastest.Lap,
               method="class", data=data)

printcp(tree2)
summary(tree2)
plotcp(tree2)

colnames(data)

linear_model <- lm(as.numeric(Percent.Completed.at.Fastest.Lap) ~ as.numeric(Finishing.Position) + as.numeric(Starting.Position)
                   + as.numeric(Podium) + as.numeric(Driver.Age.at.Race.in.Days), data = data)

summary(linear_model)

predict(linear_model, newdata = )


