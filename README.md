# Predicting Bike-Sharing Demand from Weather Patterns

## Overview

The app predicts bike-sharing demand based on real weather and temporal features, offering interactive insights and visualizations to support smart mobility planning.

This project uses the Seoul Bike Sharing dataset, enriched with city-level weather and infrastructure data, to model bike rental patterns using various statistical and machine learning techniques.

---

## Tech Stack

- **R** – Core data analysis and modeling language
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

## Key Features

- Data cleaning and imputation (temperature, rental counts)
- Min-max normalization of numerical predictors
- Linear regression using:
  - Only weather-based features
  - All available features (weather + time + holidays)
  - Polynomial and interaction-based enhancements
- Model performance comparison using R² and RMSE
- Coefficient interpretation and bar chart visualizations
- SQL-based exploration of weather trends and city info
- Data-driven insights for seasonal rental trends





