library(shiny)

shinyServer(function(input, output){
  output$myname <- renderText(input$name)
  output$myage <- renderText(input$age)
  output$mygender<- renderText(input$gender)
  
  datasetInput <- reactive({
    
    bmi <- input$weight/( (input$height/100) * (input$height/100) )
    bmi <- data.frame(bmi)
    names(bmi) <- "BMI"
    print(bmi)
    
    
  })
  
  output$contents <- renderPrint({
    if (input$submitbutton>0) {
      isolate("calculation complete.")
    } else {
      return("server is ready for calculation.") 
    }
  })
  
  
  output$tabledata <- renderTable({
    if (input$submitbutton>0) {
      isolate(datasetInput())
    }
  })
  
  
}

)