###############
### LIBRARY ###
###############

library(shiny)

#############
### LOGIC ###
#############

initBMIInfo <- function() {
    'Calculate your BMI by pressing Calculate button.'
}

calculateBMI <- function(height, weight) {
    weight / height^2
}

rateBMI <- function(bmi) {
    if(bmi < 18.5) {
        'You are <strong>underweight</strong>. :('
    } else if(bmi < 25.0) {
        'You have <strong>normal weight</strong>. :)'
    } else if(bmi < 30.0) {
        'You are <strong>overweight</strong>. :('
    } else {
        'You are <strong>obese</strong>. :('
    }
}

initBMIPlot <- function() {
    plot(
        c(),
        xlim=c(40, 120), ylim=c(1.5, 2.0),
        xlab='weight [kg]', ylab='height [m]'
    )
    
    seq(30, 130, 0.01) -> kg
    
    polygon(c(0, 0, 200, 200), c(1.0, 2.5, 2.5, 1.0), col='red', border=NA)
    
    sqrt(kg / 18.5) -> lowM; sqrt(kg / 25.0) -> highM
    polygon(c(kg, rev(kg)), c(lowM, rev(highM)), col='green', border=NA)
    
    sqrt(kg / 25.0) -> lowM; sqrt(kg / 30.0) -> highM
    polygon(c(kg, rev(kg)), c(lowM, rev(highM)), col='orange', border=NA)
}

plotBMI <- function(height, weight) {
    initBMIPlot()
    
    points(weight, height, col='black', pch=16, cex=1.5)
}

##############
### ENGINE ###
##############

shinyServer(function(input, output) {
    
    output$inputInfo <- renderText({
        paste0(
            'Hi <strong>', input$name, '</strong>!<br />',
            'Your height is <strong>', input$height, '</strong> m.<br />',
            'Your weight is <strong>', input$weight, '</strong> kg<br />'
        )
    })
    
    output$bmiInfo <- renderText(initBMIInfo())
    observeEvent(input$height, output$bmiInfo <- renderText(initBMIInfo()))
    observeEvent(input$weight, output$bmiInfo <- renderText(initBMIInfo()))
    
    output$bmiPlot <- renderPlot(initBMIPlot())
    observeEvent(input$height, output$bmiPlot <- renderPlot(initBMIPlot()))
    observeEvent(input$weight, output$bmiPlot <- renderPlot(initBMIPlot()))
    
    observeEvent(input$calculateBMI, {
        round(calculateBMI(input$height, input$weight), 2) -> bmi
        
        output$bmiInfo <- renderText(paste0(
            'Your BMI is <strong>', bmi, '</strong>.', br(),
            rateBMI(bmi), br()
        ))
        
        output$bmiPlot <- renderPlot(
            plotBMI(input$height, input$weight)
        )
    })
    
    output$documentation <- renderText({
        './data/documentation.html' -> documentationPath
        readChar(documentationPath, file.info(documentationPath)$size)
    })
    
})
