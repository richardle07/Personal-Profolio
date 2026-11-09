#install.packages("naniar")
#install.packages("NHANES")

library(NHANES)
library(naniar)
library(ggplot2)

names(NHANES)
print(NHANES)

win.graph()
vis_miss(NHANES)


unique(NHANES$Race1)
unique(NHANES$Race3)

head(NHANES)
as_shadow(NHANES)
bind_shadow(NHANES)

win.graph()
NHANES %>%
  bind_shadow() %>%
  ggplot(aes(x = Poverty,
             fill = BMI_NA,
             main = "Missing BMI Data vs Poverty")) + 
  geom_density(alpha = 0.5)


Shadow <- bind_shadow(NHANES)
Poverty <- NHANES$Poverty
BMI <- NHANES$BMI

print(Shadow$BMI_NA)
BMI_NA <- ifelse(Shadow$BMI_NA == "!NA", 0, 1)
print(BMI_NA)


cor(Poverty, BMI_NA, use = "complete.obs")
cor.test(Poverty, BMI_NA, use = "complete.obs")
t.test(Poverty,BMI_NA, use = "complete.obs")
#complete.obs removes missing data for correlation

win.graph()
gg_miss_var(NHANES)

win.graph()
gg_miss_fct(NHANES, Poverty)

#table <- table(Shadow$Height_NA, Shadow$ID)
#table

#colors <- c("blue", "red", "springgreen", 
            #"yellow", "plum", "orange")


#barplot(table,
        #beside = TRUE,
        #main = "Car Type by Origin (Grouped)",
        #xlab = "ID",
        #ylab = "Height",
        #col = colors,)








