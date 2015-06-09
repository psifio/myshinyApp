
  wine = read.csv("data/wine.csv")
  wineModel<-lm(Price ~ Age+AGST + HarvestRain + WinterRain , data=wine)

  getPricePrediction <- function(paramAge,paramAGST,paramHarvestRain,paramWinterRain){
    userinput=data.frame(Age=paramAge,AGST=paramAGST,
                        HarvestRain=paramHarvestRain, WinterRain=paramWinterRain)
    predict(wineModel, newdata=userinput)
} 

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({
      paste("Age:",input$Age, ", Temp:",input$AGST,
            ", HarvestRain:",input$HarvestRain,", WinterRain:",input$WinterRain, sep = "")
    })
    output$prediction <- renderPrint({
      exp(getPricePrediction(input$Age,input$AGST,input$HarvestRain,input$WinterRain))  })
  }
)