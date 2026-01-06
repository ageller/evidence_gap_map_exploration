source("global.R")

ui <- fluidPage(
  tags$head(
    tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "styles.css"
    )
  ),
  
  titlePanel("EGM Skeleton"),
  
  sidebarLayout(
    sidebarPanel(
      # Generic dropdowns
      selectInput("filter1", "filter 1:", choices = c("Option 1", "Option 2")),
      selectInput("filter2", "filter 2:", choices = c("Option A", "Option B"))
    ),
    
    mainPanel(
      mod_plot_ui("egm")
    )
  )

)

server <- function(input, output, session) { 
    mod_plot_server(
        "egm", 
        x_col = "WorkType", 
        y_col = "Theme.Assignment", 
        n_col = "n")
}

shinyApp(ui, server)