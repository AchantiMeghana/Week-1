
library(shiny)
library(datasets)
head(mtcars)
# Define UI for application 
ui <- fluidPage(
  title = "Regression Model",
  
  fluidRow(
    
    column(3,
      selectInput("Independent","Independent variable",
                  choices = c("mpg","wt"),selected = "mpg"
              )),
      column(3,
      selectInput("Dependent","Dependent variable",
                  choices = c("wt","mpg","cyl"),selected = "mpg"
                  )
      
      )
          ),
    
      mainPanel(
      h1("Regression Plot")),
      plotOutput("regression"),
      
      )


# Define server logic 
server <- function(input, output) { 
  simple <- reactive({input$Independent })
  
     output$regression <- renderPlot({plot(mtcars[,input$Independent],
                                         mtcars[,input$Dependent],
                                         col = "darkred",
                                         abline(lm(mtcars[,input$Dependent]~ mtcars[,input$Independent])))
     
             
             
   }
     
   )
     }


# Run the application 
shinyApp(ui = ui, server = server)

#


