library(shiny)

data(mtcars)
automatics <- mtcars[mtcars$am == 0,]
manual <- mtcars[mtcars$am == 1,]
fit <- lm(formula = mpg ~ wt + qsec + am, data = mtcars)
predmpg<-function(weight, qpsec, amto){
  predict(fit, newdata = data.frame(wt = weight, qsec = qpsec, am = amto))
}
shinyServer(
  function(input, output){
    output$prediction <- renderPrint({predmpg(input$weight, input$qpsec, input$amto)})
    output$regLine <- renderPlot({
      if(input$reg_selection) {
        plot(mpg ~ wt, data=mtcars, type='n', main = 'Figure 1: MPG vs car weight')
        points(mpg~ wt, data=automatics, col = 'red')
        line1 <- lm(mpg ~ wt, data = automatics)
        abline(line1, col = 'red')
        points(mpg~ wt, data=manual, col='blue')
        line2 <- lm(mpg ~ wt, data = manual)
        abline(line2, col ='blue')
        }
      else {        
        plot(mpg ~ qsec, data=mtcars, type='n', main = 'Figure 2: MPG vs 1/4 mile time')
        points(mpg ~ qsec, data=automatics, col = 'red')
        line3 <- lm(mpg ~ qsec, data = automatics)
        abline(line3, col = 'red')
        points(mpg~ qsec, data=manual, col='blue')
        line4 <- lm(mpg ~ qsec, data = manual)
        abline(line4, col ='blue')
      }
    })
  }
)
