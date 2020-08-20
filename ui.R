#install.packages("shinythemes")
library(shinythemes)
library(shiny)

shinyUI(fluidPage( theme = shinytheme("united"),

   
  navbarPage( "Internship/Job",
               
              tabPanel( "Home ", 
                         
              img( HTML('<center> <img src = "logo.png", style="margin:100px 0px"> </center>') )
                        
              ),
              
               tabPanel( "Find Jobs", 
                        
                            selectInput("jtype", "Select Type", c("Job","Internship")),
                            dataTableOutput("jobtable")
                        ),
              
              navbarMenu("Find Company",
                         tabPanel("Company", 
                                selectInput("cname", "Select Company", c("Amazon", "Oracle", "Google", "GE", "Salesforce")),
                                dataTableOutput("ctable")),
                         
                          tabPanel("Work Authorization",
                               selectInput("worka", "Select Work Authorization", c("Citizen", "NonCitizen")),
                               dataTableOutput("c2table")),
                         tabPanel("Location",
                                  selectInput("loc", "Select Company Location", c("Washington", "Alexandria", "Layton", "Houston")),
                                  dataTableOutput("c3table") )
                       ),
              
              tabPanel("Find Student", 
                        
                           selectInput("uniname", "Select University", c("University of Maryland", "University of Southern California", "Carnegie Mellon University", "George Washington University")),
                           dataTableOutput("unitable")),
              tabPanel("Find Position", 
                       
                       selectInput("posname", "Select Position", c("Business Analyst", "Data Analyst", "Technology Analyst", "Data Scientist")),
                       dataTableOutput("postable"))
              
              
              
  )
 ) )

