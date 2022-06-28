library(shiny)
library(shinythemes)

# Define UI for Application that shows ALL
ui <- fluidPage(
  
  theme = shinytheme("slate"),
  
  navbarPage(
    
    p(strong("ALL - Dashboard")),
    tabPanel( icon = icon("fad fa-home"),
              
              br(),
              img(src = 'header_krebszelle.png', align = "center", height = "280 px"),
              
              h1(em("Welcome to our Leukemia Dashboard !"), Style = "color: grey; font-size:40px"),
      
    ),
    
    
    tabPanel("Informations about Leukemia",
             
             mainPanel(
               "Die akute lymphatische Leukämie (ALL) ist eine Art des Blutkrebs, welche aufgrund einer Reihe von erworbenen genetischen Aberrationen entsteht. Die ALL entsteht im Knochenmark und hängt mit einer Überproduktion unreifer weißer Blutzellen zusammen. Der Reifungsprozess, bei dem sich alle Blutzellen in einem harmonischen Gleichgewicht vermehren und erneuern, gerät hier außer Kontrolle. Dadurch wird die normale Blutbildung verdrängt, wodurch nicht mehr genug gesunde weiße Blutzellen, wie auch Erythrozyten (rote Blutzellen) und Thrombozyten (Blutplättchen) gebildet werden können."
             ),
             br(), br(),
             
             mainPanel(
               tabsetPanel(
                 tabPanel("Pathophysiologie",
                          
                          p("Die akute lymphatische Leukämie (ALL) ist eine Art des Blutkrebs, welche aufgrund einer Reihe von erworbenen genetischen Aberrationen entsteht. Die ALL entsteht im Knochenmark und hängt mit einer Überproduktion unreifer weißer Blutzellen zusammen. Der Reifungsprozess, bei dem sich alle Blutzellen in einem harmonischen Gleichgewicht vermehren und erneuern, gerät hier außer Kontrolle. Dadurch wird die normale Blutbildung verdrängt, wodurch nicht mehr genug gesunde weiße Blutzellen, wie auch Erythrozyten (rote Blutzellen) und Thrombozyten (Blutplättchen) gebildet werden können.
Da die ALL vom Knochenmark aus das gesamte Orgransystem befallen kann, wird sie als bösartige Systemerkrankung bezeichnet. Unbehandelt kann die ALL aufgrund des schnellen Verlaufes innerhalb weniger Monate zum Tod führen.
"), br(),
                          
                   
                 ),
                 
                 
                 tabPanel("Ursachen",
                          
                          p("Bisher sind die Ursachen für die Erkrankung an ALL weitgehend unbekannt. Jedoch kann es vor allem durch Mutationen (genetische Veränderungen) in einer lymphatischen Zelle zu einer bösartigen Veränderung dieser Zelle kommen. Die Vermehrung dieser Zelle und der Nachkommen geschieht dann unkontrolliert.
Zudem gibt es Risikofaktoren, welche diskutiert werden. Darunter zählen die radioaktive Strahlung, bestimmte chemische Substanzen, Virusinfektionen oder Schwächungen des Immunsystems. 
"), br(),
                          img(src = 'leukemia-symptoms.png', align = "center", height = "280 px"),
                 ),
                 
                 
                 tabPanel("Symptome", 
                          p("Übliche Symptome, welche bei einer ALL auftreten, sind allgemeine Schwäche und Anämie (Blutarmut), welche sich durch Schwäche, blätte, Müdigkeit, Unwohlsein und belastungsabhängige Brustschmerzen manifestieren. Zudem können Patienten unter Blutgerinnungsstörungen und Blutneigung durch wenige Blutplättchen leiden. Diese können leichte Blutergüsse, Schleimhautblutungen, Nasenbluten und Zahnfleischbluten verursachen. Weitere Symptome können Infekte mit Lymphknotenschwellungen, Fieber und Knochenschmerzen sein, wie eine Immunschwäche, welche aus dem Mangel an funktionsfähigen weißen Blutkörperchen resultieren."), br(),
                   
                 ),
                 
                 
                 tabPanel("Diagnostik",
                          p("Für die Erstellung einer Diagnose ist eine Untersuchung des Knochenmarks essenziell. Grund hierfür ist, dass noch keine feststellbare Ausschwemmung von Leukämiezellen aus dem Knochenmark im Blut vorliegt. Die Diagnose einer ALL kann durch den Nachweis eines Anteils lymphatischer Blasten von mindestens 20% im Knochenmark, der Zuordnung der Blasten zur lymphatischen Reihe durch Immunphänotypisierung und dem Nachweis charakteristischer genetischer Veränderungen gestellt werden."), br(),
                   
                 ),
                 
                 
                 tabPanel("Therapie",
                          p("Unbehandelt können Patienten binnen weniger Wochen an ALL versterben.  Heutzutage liegt die Heilungsrate nach intensiver Therapie bei 40 bis 50% bei Erwachsenen, bei Kindern bei 80%. 
Häufige Therapiearten sind die systemische Chemptherapie, Tyrosinkinase-Inhibitor, prophylaktische ZNS-Chemotherapie und ZNS-Bestrahlung.
"), br(),
                   
                 ),
               )
             ),
    ), 
      tabPanel("Dataset",
               
        
      ),
      
      
      tabPanel("Data Visualisation",
               
               
               navlistPanel(
                 
                 
                 tabPanel("Plot 1",
                   
                 ),
                 
                 
                 tabPanel("Plot 2",
                   
                 ),
                 
                 
                 
                 tabPanel("Plot 3",
                   
                 ),
                 
                 
                 
                 tabPanel("Plot 4",
                   
                 ),
                 
                 
                 tabPanel("Reactive Plot",
                   
                 ),
                 
                 
                 
                 
                 
                 
                 
                 
               )
        
      )
      
    
  
  

  ) 
  
    
)  
