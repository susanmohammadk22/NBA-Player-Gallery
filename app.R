#install.packages(c("shiny","DBI","RSQLite"))
library(shiny)
library(DBI)
library(RSQLite)
library(DT)
# Define UI for application
ui <- fluidPage(
  sliderInput("nrows", "Enter the number of rows to display:",
              min = 1,
              max = 519,
              value = 15),
  # tableOutput("tbl")
  DT::DTOutput("tbl")
)

# Define server logic
server <- function(input, output) {
  table <- renderDataTable({
    
    # sqllite
    # Be sure the data file must be in same folder
    sqlite_conn <- dbConnect(RSQLite::SQLite(), dbname ='nba.db')
    
    # Create SQL commmand to join variables from tables for query
    
    sqlite_sql="SELECT p.id, p.first_name, p.last_name, p.full_name, pp.urlPlayerHeadshot FROM Player p INNER JOIN Player_Photos pp ON pp.idPlayer=p.id WHERE p.is_active=1"
    
    conn=sqlite_conn
    str_sql = sqlite_sql
    
    on.exit(dbDisconnect(conn), add = TRUE)
    table_df = dbGetQuery(conn, paste0(str_sql, " LIMIT ", input$nrows, ";"))
    table_df$headshot<-c(paste0('<img src="', table_df$urlPlayerHeadshot, '"></img>'))
    table_df<-table_df[c('full_name', 'headshot')]
  }, escape = FALSE)
  
  output$tbl <- table
}

# Run the application 
shinyApp(ui = ui, server = server)
