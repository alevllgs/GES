library(readr)
library(tidyverse)
library(dplyr)
library(readxl)
library(janitor)

Fecha <- Sys.Date()

# Fecha <- "2021-01-31" #por si tengo que usar una fecha manual

# vigentes_semana <- read_excel("C:/Users/control.gestion3/OneDrive/BBDD Produccion/GES/CSV/Datos semanales/GES Vigentes.xlsx")
# vencidas_semana <- read_excel("C:/Users/control.gestion3/OneDrive/BBDD Produccion/GES/CSV/Datos semanales/GES Vencidas.xlsx")

vigentes_semana <- read_excel("C:/Users/control.gestion3/OneDrive/BBDD Produccion/GES/CSV/Datos semanales/vigentes_sigges.xlsx", 
                              col_types = c("text", "skip", "skip", 
                                            "skip", "skip", "skip", "numeric", 
                                            "numeric", "numeric", "text", "skip"),
                              skip = 7)
vigentes_semana <- na.omit(vigentes_semana)

vencidas_semana <- read_excel("C:/Users/control.gestion3/OneDrive/BBDD Produccion/GES/CSV/Datos semanales/vencidas_sigges.xlsx", 
              col_types = c("skip", "skip", "skip", 
                            "skip", "skip", "text", "text", "numeric", 
                            "numeric", "numeric", "text", "skip"), 
              skip = 7)
vencidas_semana <-na.omit(vencidas_semana)


vigentes_semana <- janitor::clean_names(vigentes_semana)
vencidas_semana <- janitor::clean_names(vencidas_semana)

vigentes_semana$fecha_de_corte <- Fecha
vencidas_semana$fecha_corte <- Fecha

# vigentes <- read.csv("BBDD Produccion/GES/CSV/Vigentes_BBDD_Tableau.csv")
vigentes <- read.csv("C:/Users/control.gestion3/OneDrive/BBDD Produccion/GES/CSV/Vigentes_BBDD.csv")
vencidas <- read.csv("C:/Users/control.gestion3/OneDrive/BBDD Produccion/GES/CSV/Vencidas_BBDD.csv")

vigentes_semana$fecha_de_inicio <- as.character(vigentes_semana$fecha_de_inicio)
vigentes_semana$fecha_limite <- as.character(vigentes_semana$fecha_limite)

vencidas_semana$fecha_de_inicio <- as.character(vencidas_semana$fecha_de_inicio)
vencidas_semana$fecha_limite <- as.character(vencidas_semana$fecha_limite)

vigentes <- rbind(vigentes_semana, vigentes)
vencidas <- rbind(vencidas_semana, vencidas)

write.csv(vigentes, file="C:/Users/control.gestion3/OneDrive/BBDD Produccion/GES/CSV/Vigentes_BBDD.csv", row.names = F)
write.csv(vencidas, file="C:/Users/control.gestion3/OneDrive/BBDD Produccion/GES/CSV/Vencidas_BBDD.csv", row.names = F)

rm(vencidas, vencidas_semana, vigentes, vigentes_semana, Fecha)


