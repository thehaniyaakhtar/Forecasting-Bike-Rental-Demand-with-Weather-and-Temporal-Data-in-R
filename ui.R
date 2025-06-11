library(shiny)
library(leaflet)

shinyUI(
  fluidPage(padding = 5,
            titlePanel("Bike-sharing demand prediction app"),
            sidebarLayout(
              sidebarPanel(
                selectInput("city_select", "Select a city:",
                            choices = c("All", "New York", "London", "Paris", "Tokyo", "Mumbai")),
                
                plotOutput("temp_line", height = "250px"),
                
                plotOutput("bike_line", height = "300px", click = "plot_click"),
                verbatimTextOutput("bike_date_output"),
                
                plotOutput("humidity_pred_chart", height = "250px")
              ),
              mainPanel(
                leafletOutput("city_bike_map", height = 600)
              )
            )
  )
)
 
