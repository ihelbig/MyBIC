```
###in datatables 

library(DT)

iris2 = iris
datatable(iris2, filter = 'top', extensions = 'Buttons', 
          options = list(
            pageLength = 5, autoWidth = TRUE,
            columnDefs = list(list(visible = FALSE, targets = c(1,-1))),
            dom = 'Bfrtip',
            buttons = c(I('colvis'), 'copy', 'csv', 'excel', 'pdf', 'print')
            )
        )

### in Shiny
library(shiny)
library(DT)
library(readr)


ui <- basicPage(
  h2("test"),
  DT::dataTableOutput("mytable")
)

server <- function(input, output) {
  
  iris2 <- iris
  output$mytable = DT::renderDataTable(
    iris2, filter = 'top', extensions = 'Buttons', 
     options = list(
       pageLength = 5, autoWidth = TRUE,
       columnDefs = list(list(visible = FALSE, targets = c(1,-1))),
       dom = 'Bfrtip',
       buttons = c(I('colvis'), 'copy', 'csv', 'excel', 'pdf', 'print')
     )
    )
}

shinyApp(ui, server)
```
