#################
### LIBRARIES ###
#################

library(shiny)
library(shinythemes)

###########
### GUI ###
###########

shinyUI(fluidPage(
    
    theme=shinytheme('flatly'),
    
    navbarPage('BMI calculator',
        tabPanel('Calculator',
            sidebarPanel(
                textInput('name', 'Name:', 'Stranger'),
                sliderInput('height', 'Height [m]:', 1.5, 2.0, 1.8, 0.01),
                sliderInput('weight', 'Weight [kg]:', 40.0, 120.0, 70.0, 1.0),
                actionButton('calculateBMI', 'Calculate', width='100%')
            ),
            mainPanel(
                htmlOutput('inputInfo'),
                br(),
                htmlOutput('bmiInfo'),
                br(),
                plotOutput('bmiPlot')
            )
        ),
        tabPanel('Documentation',
            htmlOutput('documentation')
        )
    )
    
))
