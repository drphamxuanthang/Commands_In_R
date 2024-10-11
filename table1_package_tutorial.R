## Table1 package
install.packages("table1")
library(boot, table1)

melanoma2 <- melanoma
str(melanoma2)

# Factor the basic variables that we're interested in

melanoma2$status <- 
  factor(melanoma2$status,
         levels = c(2, 1, 3),
         labels = c("Alive", "Melanoma death", "Non-melanoma death"))

melanoma2$sex <- 
  factor(melanoma2$sex,
         levels = c(0, 1),
         labels = c("Female", "Male"))

melanoma2$ulcer <- 
  factor(melanoma2$ulcer,
         levels = c(0, 1),
         labels = c("Abscent", "Present"))

label(melanoma2$sex)       <- "Sex"
label(melanoma2$age)       <- "Age"
label(melanoma2$ulcer)     <- "Ulceration"
label(melanoma2$thickness) <- "Thicknessᵃ"

units(melanoma2$age)       <- "years"
units(melanoma2$thickness) <- "mm"


table1(~ sex + age + ulcer + thickness | status, data = melanoma2,
       overall = c(left = "Total"), 
       caption = c("Sociademographic characteristics"),
       footnote = c("ᵃ Also known as Breslow thickness")
       )
