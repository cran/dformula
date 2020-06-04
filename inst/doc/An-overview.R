## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, 
                      fig.width = 6, fig.height = 5, 
                      message = FALSE, warning = FALSE)

## ---- message = FALSE---------------------------------------------------------
library('dformula')

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  remotes::install_github('dataallaround/dformula')

## -----------------------------------------------------------------------------
data("population_data")
pop_data <- population_data

## -----------------------------------------------------------------------------
str(pop_data)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, formula = ~ I(Population / Area))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, formula = ~ I(Population / Area), as = "pop_density")
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, formula = ~ I(Population / Area) + I(log(Area)))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, formula = ~ I(Population / Area) + I(log(Area)), 
               as = c("pop_density", "log_area"))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, formula = Population + Area ~ log())
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, formula = Population + Area ~ log(),
               as = c("log_pop", "log_area"))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, 
               formula = ~ I(1:nrow(new_pop)), 
               position = "left", as = "id")
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, formula = ~ C("2020"), position = "left")
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, 
               formula = ~ I(1:nrow(new_pop)) + C("2020"), 
               position = "left", as = c("ids", "year"))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, formula =  ~ I(Population > 100000000))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, 
               formula =  ~ I(Population > 100000000) + I(Area > 8000000))
head(new_pop)


## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, 
               formula =  ~ I(Population > 100000000 & Area > 8000000))
head(new_pop)


## -----------------------------------------------------------------------------
new_pop <- add(from = pop_data, 
               formula =  ~ I(Population > 100000000), 
               logic_convert = FALSE, as = "most_populated")
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- transform(from = pop_data, 
                     formula =  Population ~ I(Population/10000))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- transform(from = pop_data, 
                     formula =  Population ~ I(log(Population)), 
                     as = "log_pop")
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- transform(from = pop_data, 
                     formula =  Population  + Area~ I(log()))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- transform(from = pop_data, 
                     formula =  Population + Area ~ I(Population > 100000000) + I(log(Area)))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- rename(from = pop_data, formula =  Population  ~ pop )
head(new_pop)


## -----------------------------------------------------------------------------
new_pop <- rename(from = pop_data, formula =  Population  + Area ~ pop + area)
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- select(from = pop_data, 
                  formula =  . ~ I(Population > 100000000))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- select(from = pop_data, 
                  formula =  Country ~ I(Population > 100000000))
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- select(from = pop_data, 
               formula = . ~ I(Population > 100000000 & Area > 8000000)) 
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- select(from = pop_data, 
               formula = ~ I(Population > 100000000 | Area > 8000000)) 
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- select(from = pop_data, 
               formula = Country ~ I(Population > 100000000 | Area > 8000000)) 
head(new_pop)

## -----------------------------------------------------------------------------
new_pop <- remove(from = pop_data, 
                  formula =  Area ~ I(Population > 100000000))
head(new_pop)

## -----------------------------------------------------------------------------
data("airquality")
dt <- airquality

dt_new <- remove(from = dt,formula = .~., na.remove = TRUE)
head(dt_new)

## -----------------------------------------------------------------------------
dt_new <- select(from = dt,formula = ~ I(Temp > 50), na.return = TRUE)
head(dt_new)

