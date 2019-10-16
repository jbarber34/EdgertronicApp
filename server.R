library(shiny)
library(dplyr)
library(readr)
EdgertronicMaster <- read_csv("EdgertronicMaster.csv")
server <- function(input, output, session) {

  output$pitcher <- renderUI({
    selectInput("pitcher", "Pitcher", choices = EdgertronicMaster$PITCHER)
  })
  
  update <- reactive({
    EdgertronicMaster %>%
      filter(PITCHER == input$pitcher)
  })
  
  output$type <- renderUI({
    update <- update()
    selectInput("types", "Pitch Type", choices = update$AUTO_PITCH_TYPE)
  })
  
  update2 <- reactive({
    update <- update()
    update %>%
      filter(AUTO_PITCH_TYPE == input$types)
  })
  
  output$file <- renderUI({
    update2 <- update2()
    selectInput("file", "File", choices = update2$VideoFile)
  })
  
  update3 <- reactive({
    update2 <- update2()
    update2 %>%
      filter(VideoFile == input$file)
  })
  
  output$batter <- renderUI({
    update3 <- update3()
    paste("Batter: ", update3$Batter)
  })
  
  output$velo <- renderUI({
    update3 <- update3()
    paste("Velocity:", round(as.numeric(update3$RELEASE_SPEED),2))
  })

  output$spin <- renderUI({
    update3 <- update3()
    paste("Spin:   ", round(as.numeric(update3$SPIN_RATE),2))
  })
  
  output$axis <- renderUI({
    update3 <- update3()
    paste("Axis:", round(as.numeric(update3$SPIN_AXIS),2))
  })
  
  output$tilt <- renderUI({
    update3 <- update3()
    paste("Tilt:", update3$TILT_TIME)
  })
  
  output$induced <- renderUI({
    update3 <- update3()
    paste("Induced:", update3$INDUCED_VERTICAL_BREAK)
  })
  
  output$vertical <- renderUI({
    update3 <- update3()
    paste("Vertical Break:", update3$INDUCED_VERTICAL_BREAK)
  })
  
  output$horizontal <- renderUI({
    update3 <- update3()
    paste("Horizontal Break:", update3$HORIZONTAL_BREAK)
  })
  
  
  output$video <- renderUI({
    tags$video(id = "video", src = input$file, type = "video/mov", autoplay = NA, controls = TRUE, height = "850px", width = "1050px")
  })
  
}