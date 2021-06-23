library(shiny)
library("devtools")
library("ROpenCVLite")
#installOpenCV(batch = T)

#installOpenCV()
library("Rvision")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Webcam"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    my_stream <- stream(0)   # 0 will start your default webcam in general.
    my_selfie <- readNext(my_stream)
    #plot(my_selfie)
    release(my_stream)


    output$distPlot <- renderPlot({
        plot(my_selfie)
    })
}

# Run the application
shinyApp(ui = ui, server = server)
