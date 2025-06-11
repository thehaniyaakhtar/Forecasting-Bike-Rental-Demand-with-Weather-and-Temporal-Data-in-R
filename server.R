library(shiny)
library(leaflet)
library(tidyverse)
library(ggplot2)
library(scales)

# Load prediction function
source("model_prediction.R")

shinyServer(function(input, output) {
  
  # Reactive data loading
  city_weather_bike_df <- reactive({
    generate_city_weather_bike_data()
  })
  
  # Color scale
  color_levels <- colorFactor(c("green", "yellow", "red"), 
                              levels = c("small", "medium", "large"))
  
  # Leaflet output
  observeEvent(input$city_select, {
    df <- city_weather_bike_df()
    req(nrow(df) > 0)
    
    if (input$city_select == "All") {
      output$city_bike_map <- renderLeaflet({
        leaflet(df) %>%
          addTiles() %>%
          addCircleMarkers(
            lng = ~LNG,
            lat = ~LAT,
            popup = ~LABEL,
            color = ~color_levels(BIKE_PREDICTION_LEVEL),
            radius = 8
          )
      })
      
    } else {
      selected_df <- df %>% filter(CITY_ASCII == input$city_select)
      
      output$city_bike_map <- renderLeaflet({
        leaflet(selected_df) %>%
          addTiles() %>%
          addMarkers(
            lng = ~LNG,
            lat = ~LAT,
            popup = ~DETAILED_LABEL
          )
      })
      
      # --- Task 1: Temperature trend ---
      output$temp_line <- renderPlot({
        ggplot(selected_df, aes(x = as.POSIXct(FORECASTDATETIME), y = TEMPERATURE)) +
          geom_line(color = "tomato") +
          geom_point() +
          geom_text(aes(label = TEMPERATURE), vjust = -0.5, size = 3) +
          labs(title = "5-day Temperature Trend",
               x = "Datetime", y = "Temperature (°C)") +
          theme_minimal()
      })
      
      # --- Task 2: Interactive Bike-sharing Trend ---
      output$bike_line <- renderPlot({
        ggplot(selected_df, aes(x = as.POSIXct(FORECASTDATETIME), y = BIKE_PREDICTION)) +
          geom_line(color = "blue") +
          geom_point(color = "darkblue") +
          geom_text(aes(label = BIKE_PREDICTION), vjust = -0.5, size = 3) +
          labs(title = "5-day Bike-sharing Demand Prediction",
               x = "Datetime", y = "Predicted Bikes") +
          theme_minimal()
      })
      
      output$bike_date_output <- renderText({
        click <- input$plot_click
        if (is.null(click)) return("Click on a point to see details")
        
        # Find nearest point
        df <- selected_df
        df$click_dist <- sqrt((as.numeric(as.POSIXct(df$FORECASTDATETIME)) - click$x)^2 +
                                (df$BIKE_PREDICTION - click$y)^2)
        nearest <- df[which.min(df$click_dist), ]
        
        paste0("Datetime: ", nearest$FORECASTDATETIME,
               "\nBike Prediction: ", nearest$BIKE_PREDICTION)
      })
      
      # --- Task 3: Humidity vs Bike Prediction correlation ---
      output$humidity_pred_chart <- renderPlot({
        ggplot(selected_df, aes(x = HUMIDITY, y = BIKE_PREDICTION)) +
          geom_point(color = "darkgreen") +
          geom_smooth(method = "lm", formula = y ~ poly(x, 4), se = FALSE, color = "black") +
          labs(title = "Humidity vs Bike Prediction",
               x = "Humidity (%)", y = "Predicted Bikes") +
          theme_minimal()
      })
    }
  })
})
