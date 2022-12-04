library(shiny)
library(shinythemes)
shinyUI(fluidPage(
  theme = shinytheme("superhero"),
  themeSelector(), 
  
  titlePanel(title = "My BMI Monitor"),
  sidebarLayout(
    sidebarPanel(helpText("The body mass index (BMI), or Quetelet index, is a 
                          a measure of relative weight based on an individuals
                          mass and height. Devised between 1830 and 1850 by 
                          Belgian polymath Adolphe Quetelet during the course of
                          developing 'social physics' defined as the body weight
                          divided by the square of their height, with the value
                           beign given in units of kg/m^2.(wikipedia)"),
                 textInput("name","Enter your name", ""),
                 textInput("age", "Enter your age", ""),
                 radioButtons("gender", "Select gender", list("Male", "Female"), ""), 
                 sliderInput("height",
                             label = "Height",
                             value = 175,
                             min = 40,
                             max = 250),
                 sliderInput("weight",
                             label = "Weight",
                             value = 70,
                             min = 20,
                             max = 100),
                 actionButton("submitbutton",
                              "submit",
                              class = "btn btn-primary")
    ),
    mainPanel(h4("mainpanel"),
              textOutput("myname"),
              textOutput("myage"),
              textOutput("mygender"),
              tags$label(h3("status/output")),
              verbatimTextOutput("contents"),
              tableOutput("tabledata")
    ),
    
    
  )
)

)
