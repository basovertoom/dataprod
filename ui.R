library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("MOTOR TREND APP"),
  sidebarPanel(
    h5('Based on our reseach in the regression class, we found that Weight, Acceleration & transmisison as the key values to influence the MPG of a car. With this App you can get an good indication of the MPG of your New to buy car'),
    numericInput('weight','Weight of the desired car in 1000 lbs:', 2, min=1, max=6, step=0.5),
    numericInput('qpsec', 'Acceleration of the desired car in qsec:', 16, min=14, max=23, step=0.5),
    numericInput('amto', 'Automatic 1= yes, 0 = no:', 0, min=0, max=1, step=1),
    submitButton('Calculate MPG'),
    h5('Based on this input - we predict an MPG-value of:'),
    verbatimTextOutput("prediction")
  ),
  mainPanel(
    h5('Gain more understanding on the logical individual relations'),
    h5('If we do some more exploratory analytics to look a little deeper into the relation MPG and the car weight - figure 1 -  and MPG and the acceleration time - figure 2 - plotted for the automatic - red -  and manual transmission cars - blue. We see a logical correlations between the Mass, Accelerator and MPG - related to the physical rule F = m*a.'),
    radioButtons('reg_selection', 'Generate insights', c('plot of Weight vs MPG' = TRUE, 'plot of Qsec vs MPG' = FALSE)),
    submitButton('Show plot'),
    plotOutput('regLine')
   
  )
))
