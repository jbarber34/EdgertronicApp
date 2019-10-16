library(readr)
EdgertronicMaster <- read_csv("EdgertronicMaster.csv")

ui <- fluidPage(
  titlePanel("Edgertronic Video"),
  sidebarLayout(
    sidebarPanel("",
                 uiOutput("pitcher"),
                 uiOutput("type"),
                 uiOutput("file"),
                 uiOutput("batter"),
                 uiOutput("velo"),
                 uiOutput("spin"),
                 uiOutput("axis"),
                 uiOutput("tilt"),
                 uiOutput("induced"),
                 uiOutput("vertical"),
                 uiOutput("horizontal")
    ),
    mainPanel(uiOutput("video"), id = "video")))