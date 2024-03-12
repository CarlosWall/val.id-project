# app.R

library(shiny)

# Define a UI
ui <- fluidPage(
  titlePanel("Teste de Kolmogorov-Smirnov"),

  sidebarLayout(
    sidebarPanel(
      textInput("dados1", "Insira os dados do Grupo 1 (separados por espaços):"),
      textInput("dados2", "Insira os dados do Grupo 2 (separados por espaços):"),
      actionButton("realizarTeste", "Realizar Teste")
    ),
    mainPanel(
      h4("Resultado do Teste"),
      verbatimTextOutput("resultado")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  observeEvent(input$realizarTeste, {
    data1 <- as.numeric(strsplit(input$dados1, " ")[[1]])
    data2 <- as.numeric(strsplit(input$dados2, " ")[[1]])
    
    result <- ks.test(data1, data2)
    
    output$resultado <- renderText({
      paste("Estatística D:", result$statistic, "\nValor p:", result$p.value)
    })
  })
}

# Run the application
shinyApp(ui, server)
