shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Bordeaux Wine Prediction"),

    sidebarPanel(
      numericInput('Age', 'Wine Age (years)', 10, min = 0, max = 100, step = 1),
      sliderInput('AGST','Temperature (Celcius)', 10, 40, 16.5, step = 0.1, round = FALSE, 
                  ticks = TRUE, animate = FALSE),
      numericInput('HarvestRain', 'Harvest Rain (ml)', 140, min = 0, max = 2000, step = 10),
      numericInput('WinterRain', 'Winter Rain (ml)', 600, min = 0, max = 2000, step = 10),
      submitButton('Submit'),
      h4("Enter values and hit submit to calculate price"),
      br(),
      p("With this app one can predict prices for vintage bordeaux wines. The depedent variables are:"),
      strong("Age:"),
      em("wine's age in years"),
      br(),
      strong("Temperature:"),
      em("average growing temperature (degrees celcius) April-Sept"),
      br(),
      strong("Harvest Rain:"),
      em("Harvest (August and Sept.) rain in (ml)"),
      br(),
      strong("Winter Rain:"),
      em("Winter (Oct.-March) rain in (ml)"),      
      br(),
      br(),
      p("This app is a reproduction of Orley Ashenfelter's study",
        a("Predicting the Quality and Prices of Bordeaux Wines .", 
          href = "http://www.wine-economics.org/workingpapers/AAWE_WP04.pdf")),
      p("Wine dataset downloaded from course: ",
        a("MITx Analytics edge.", 
          href = "https://www.edx.org/course/analytics-edge-mitx-15-071x-0"))
    ),
    mainPanel(
        h3('Results of prediction'),
        h4('You entered'),
        verbatimTextOutput("inputValue"),
        h4('Which resulted in a price prediction of '),
        verbatimTextOutput("prediction")

    )
  )
)