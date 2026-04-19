# NBA Player Gallery & Stats Viewer

- This project was a Information Management class project and totally guided by Professor Dr Karl HO.
- Data, codes and structures are from the Professor, I just follow the instruction and guidance of Professor for running the app.r and nba.db in the shiny app.
  
### A Full-Stack R/Shiny Application with SQLite Integration

[Live Demo](https://qevent.shinyapps.io/nba-final/)

## Project Overview
This application serves as a dynamic interface for exploring NBA player data. It demonstrates the integration of a relational database with a reactive web interface, allowing users to query player headshots and statistics in real-time.

## Tech Stack
* **Language:** R
* **Framework:** [Shiny](https://shiny.posit.co/)
* **Database:** SQLite (managed via `DBI` and `RSQLite`)
* **UI Components:** `DT` (DataTables) for interactive rendering
* **Deployment:** Shinyapps.io

## Key Features
* **Relational Joins:** Executes SQL `INNER JOIN` queries across `Player` and `Player_Photos` tables.
* **Reactive Controls:** Dynamic UI allows users to adjust data volume via a slider input.
* **Image Rendering:** Custom HTML integration within DataTables to display player headshots directly from URLs.

## Repository Structure
* `app.R`: Contains the UI and Server logic.
* `nba.db`: The SQLite relational database containing player metrics and photo metadata.
