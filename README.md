# Predicting Bike-Sharing Demand from Weather Patterns

## Overview

This project focuses on predicting bike-sharing demand in urban cities using weather and temporal features using API. It uses linear regression, polynomial regression, and regularized regression models to understand how factors like temperature, humidity, time of day, and holidays influence bike rentals.

A Shiny web application was built to visualize the results and offer an interactive experience for city planners and researchers.

---

## Key Features

- **Web Scraping**: Real-time scraping of bike-sharing station or city weather data using rvest and httr.
- **API** : Collecting real time weather data for required cities
- **Regression Modeling**: Multiple models including:
    Linear regression with weather features
    Polynomial regression
- **Performance Metrics**:
    R-squared (R²)
    Root Mean Squared Error (RMSE)
- **Exploratory Data Analysis**:
    Hourly and seasonal trends
    Weather vs bike count correlation
- **Shiny Web App**:
    Interactive plots
    Leaflet-based city mapping for similar cities
  
---

## Tech Stack

- **R** – Core data analysis and modeling language
- **OpenWeather API** - Provides real-time and forecasted weather data
- **Shiny** – Web application framework for R
- **tidyverse** – For data manipulation (`dplyr`, `ggplot2`, `readr`, etc.)
- **yardstick** – For model evaluation (RMSE, R-squared)
- **glmnet** – For regularized regression models
- **rsample** – For data splitting
- **stringr** – For string cleaning and normalization
- **DBI & RSQLite** – For SQL-based data handling
- **Leaflet** – For geospatial visualizations (if applicable)
- **Posit Cloud (RStudio)** – Development environment and deployment

---

## Dataset

- `seoul_bike_sharing.csv`
- `seoul_bike_sharing_converted.csv`
- `seoul_bike_sharing_converted_normalized.csv`
- `CITIES_WEATHER_FORECAST.csv`
- `BIKE_SHARING_SYSTEMS.csv`
- `WORLD_CITIES.csv`

---

## Files used in Posit Cloud
- `ui.R`	
- `server.R`
- `model_prediction.R`
- `selected_cities.csv`	
- `model.csv`

---

## Screenshots
![Screenshot (343)](https://github.com/user-attachments/assets/2c0808d7-369d-48eb-8b98-bb93a1c0bbf3)

![Screenshot (344)](https://github.com/user-attachments/assets/c9eb2efc-07da-4b00-b36a-ed9d03cfbd27)

![Screenshot (339)](https://github.com/user-attachments/assets/fc1fb51b-750c-4bf6-8cd5-0e511e9e0b1a)

![Screenshot (340)](https://github.com/user-attachments/assets/0261d854-a4af-491b-81e4-c7f3f27f6f30)

![Screenshot (341)](https://github.com/user-attachments/assets/767aff18-69dc-4d7b-8155-dcd077067513)



