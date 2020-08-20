#install.packages("tidyverse")

library(tidyverse)
library(RODBC)
library(shiny)

shinyServer(function(input, output) {
  
  #con <-  odbcDriverConnect (
  #'Driver=FreeTDS;TDS_Version=7.0;Server=tcp:dbmsproj.database.windows.net,1433;Database=Project 09;Uid=Project_09@dbmsproj;Pwd=Dbms@1234;TrustServerCertificate=no;')
  #con <- odbcDriverConnect('Driver=FreeTDS;TDS_Version=7.0;Server=dbmsproj.database.windows.net;Database=Project 09;Uid=Project_09@dbmsproj;Pwd=Dbms@1234')
  
  
  con <- odbcDriverConnect('Driver=SQL Server Native Client 11.0;Server=dbmsproj.database.windows.net;Database=Project 09;Uid=Project_09@dbmsproj;Pwd=Dbms@1234')
  
  student <- sqlQuery(con, "SELECT * FROM University u , Student s WHERE s.uID=u.uID")
  jt <- sqlQuery(con, "SELECT * FROM Position p, Location l, Company c WHERE p.locID=l.locID AND p.cID=c.cID")
  #Find Jobs
  output$jobtable <-renderDataTable({
    
    a <- subset(jt, Type == input$jtype, 
                select = c("cName","pID", "PositionName","workAuthReq","Type", "state", "city", "zipcode"))
    a
  })
  
  #Find Company
  output$ctable <-renderDataTable({
    b <- subset(jt, cName == input$cname, 
                select = c("cName","pID", "PositionName","Type","workAuthReq", "state", "city", "zipcode"))
    b
  })
  #work authth
  output$c2table <-renderDataTable({
    b2 <- subset( jt, workAuthReq == input$worka, 
                select = c("cName","pID", "PositionName","Type","workAuthReq", "state", "city", "zipcode"))
    b2
  })
  
  #Location
  output$c3table <-renderDataTable({
    b3 <- subset( jt, city == input$loc, 
                  select = c("cName","pID", "PositionName","Type","workAuthReq", "state", "city", "zipcode"))
    b3
  })
  
  #Find students
  output$unitable <- renderDataTable({
    
    x <- subset(student, uName == input$uniname,
                select = c("sID","fName", "lName","gender","address","phoneNo","gpa","gradYear","workAuth","uLoc"))
    x
  })
  #position
  output$postable <-renderDataTable({
    b2 <- subset( jt, PositionName == input$posname, 
                  select = c("cName","pID", "PositionName","Type","workAuthReq", "state", "city", "zipcode"))
    b2
  })
  
})
