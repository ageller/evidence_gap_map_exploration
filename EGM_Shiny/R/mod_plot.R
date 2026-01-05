mod_plot_ui <- function(id) {
    ns <- NS(id)

    plotlyOutput(ns("egm_plot"))
}

mod_plot_server <- function(id, x_col, y_col, n_col) {
    moduleServer(
        id,
        function(input, output, session) {

          # Get the number of unique levels for each axis
          n_x <- length(unique(batch3_egm_counts[[x_col]]))
          n_y <- length(unique(batch3_egm_counts[[y_col]]))
          
          # Create vertical lines
          vlines <- lapply(0:(n_x), function(i) {
            list(
              type = "line",
              x0 = i - 0.5, x1 = i - 0.5,
              y0 = -0.5, y1 = n_y - 0.5,
              line = list(color = "lightgray", width = 1)
            )
          })
          
          # Create horizontal lines
          hlines <- lapply(0:(n_y), function(i) {
            list(
              type = "line",
              x0 = -0.5, x1 = n_x - 0.5,
              y0 = i - 0.5, y1 = i - 0.5,
              line = list(color = "lightgray", width = 1)
            )
          })
          
            egm_plot <- plot_ly(
                data = batch3_egm_counts,
                x = batch3_egm_counts[[x_col]],
                y = batch3_egm_counts[[y_col]],
                size = batch3_egm_counts[[n_col]],
                type = "scatter",
                mode = "markers",
                sizes = c(5, 100),   # controls min/max bubble size
                marker = list(opacity = 0.7),
                text = ~paste(
                    "Intervention:", batch3_egm_counts[[x_col]],
                    "<br>Outcome:", batch3_egm_counts[[y_col]],
                    "<br>Papers:", batch3_egm_counts[[n_col]]
                ),
                hoverinfo = "text"
            ) %>%
            layout(
                xaxis = list(title = x_col, showgrid = FALSE),
                yaxis = list( title = y_col, showgrid = FALSE),
                shapes = c(vlines, hlines),
                showlegend = FALSE
            )

            output$egm_plot <- renderPlotly(egm_plot)

        }
    )
}