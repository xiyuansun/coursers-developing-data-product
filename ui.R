# ui.R
library(shiny)
library(shinythemes)


fig.width <- 600
fig.height <- 450


shinyUI(fluidPage(theme =  shinytheme("cerulean"),
                  titlePanel("Linear Regression Model of Ames House Price"),
                  #list(tags$head(tags$style("body {background-color: gray; }"))),
                  sidebarLayout(
                    sidebarPanel(
                      
                      # sidepbar panel has the Input
                      h4("Note that"),
                      h4("the input data set shuold contain",
                         "dependent variable in fisrt column and up to 14 explanatory variables",style = "font-family: 'times'; font-si16pt"),
                      helpText("the type of file you upload should be .csv or .txt",style = "font-family: 'times'; font-si16pt"),
                      
                      br(),
                      # Check box for selection of header and type of file option
                      checkboxInput('header','Header', value = F),
                      checkboxInput('default','Default Data Set', value = T),
                      br(),
                      sliderInput("predictor_index", "Selected Predictor Index: ", min=2, max=15, value=1, step=1),
                      br(),
                      radioButtons('sep', 'separator', c(comma = ',', semicolon = ';', tab = '\t'), selected = NULL, inline = FALSE),
                      br(),
                      
                      # take the file from user
                      fileInput('data', 'Choose file to upload', multiple = FALSE, accept = c('.text/ comma-separated-values',
                                                                                              '.csv',
                                                                                              '.xlsx',
                                                                                              '.txt',
                                                                                              '.text/ tab-separated-values')),
                      
                      helpText("Deselect default data set when you upload your data set"),
                      
                      numericInput("obs", "Observations:", 20,
                                   min = 1, max = 88),
                      
                      
                      
                      
                      #    sliderInput("intercept",
                      #                strong("Intercept"),
                      #                min=-2, max=6, step=.5,
                      #                value=sample(seq(-2, 6, .5), 1), ticks=FALSE),
                      #    sliderInput("slope", 
                      #                strong("Slope"),
                      #                min=-1, max=3, step=.25, 
                      #                value=sample(seq(-1, 3, .25), 1), ticks=FALSE),
                      br(),
                      wellPanel(
                        h5("Contact Info: "),
                        h5("Kelly Sun @ ISU"),
                        helpText(   a("View My LinkedIn Profile",href="https://www.linkedin.com/in/xiyuan-sun-294ba366")),
                        helpText("xiyuansun2010@gmail.com")
                      ),
                      br(),br(),br(),br()
                    ),
                    
                    
                    mainPanel(
                      tabsetPanel(
                        
                        tabPanel("Table", tableOutput("table")),
                        tabPanel("Plot", plotOutput("plot")),
                        tabPanel("Linear Regression", plotOutput("LinearPlot")),
                        tabPanel("Summary", verbatimTextOutput("summary")),
                        tabPanel("Linear Regression Summary", verbatimTextOutput("Linearsummary"))
                      )
                    )
                    
                  )  
)
)