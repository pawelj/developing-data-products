---
title       : BMI Calculator
author      : Pawel Jamer
framework   : io2012
highlighter : highlight.js
hitheme     : tomorrow
widgets     : [mathjax, bootstrap]
mode        : selfcontained
knit        : slidify::knit2slides
--- bg:black color:white

## Problem

In many developed countries human life is really fast. We don't have enought
time for doing sport and eating healthy. Thus more and more people have
problem with **overweight**.

From the other hand, current fashion promotes extremely slim type of beauty
which sometimes causes problem with **underweight** among the people that try 
to follow the fashion.

Both **overweight** and **underweight** can cause healthy problems like 
diabetes, hypertension, heart attack etc. So it will be reasonable to inform
people about weight irregularities.

--- bg:black

## Solution

The simplest method of measureing body mass correctness is Body Mass Index 
(BMI) which tie together height with weight by the following relation:

$$BMI = \frac{weight}{height^2}$$

Depends on BMI value you can be classified as a person with underweight, normal weight, overweight or obese.

An example calculations for person with 80 kg weight and 1.8 m height is presented:


```r
80 -> weight
1.8 -> height
weight / height^2
```

```
## [1] 24.69136
```

In this case, obtained BMI suggests normal weight.

--- bg:black

## Implementation



BMI was implemented as Shiny application where weight information are presented
in three ways:

- as BMI value,
- as descriptive information about body state
- as point on the BMI plot.

An example of all this information are showed below:


```r
calculateBMI(1.8, 80)
```

```
## [1] 24.69136
```

```r
rateBMI(calculateBMI(1.8, 80))
```

```
## [1] "You have <strong>normal weight</strong>. :)"
```

--- bg:black

## Conclusions

BMI value gives easy to use and interpret measure of body weight. Shiny gives
visually attractive way for presenting BMI. Therefore we could hope that 
people will be interested in the solution.


