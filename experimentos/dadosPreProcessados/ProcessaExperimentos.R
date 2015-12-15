library(ggplot2)
library(dplyr)
library(tidyr)

# colocar lista de arquivos e concatenar os nomes com os locais (função paste)
fileNames <- c("62TemposCondicoes",
               "62TemposInteracoes",
               "62TemposEventos",
               "62TemposRegras",
               "62TemposCondicoesReexecucao",
               "62TemposRegrasReexecucao",
               "238TemposCondicoes",
               "238TemposInteracoes",
               "238TemposInteracoesReexecucao",
               "238TemposEventos",
               "238TemposRegras",
               "AndroidTemposEventos",
			         "TemposInteracaoAndroidTo238",
			         "TemposInteracao238ToAndroid")

for(name in fileNames){
  # ler cada arquivo de entrada
  df = read.csv(paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/dadosPreProcessados/",name,".csv",sep=""),header=T)
  # juntar colunas e dar nome a elas
  dfgg = df %>% gather(Alternative, Time)
  # resumo: por alternativa
  result1 = dfgg %>%
    group_by(Alternative) %>%
    summarise(num = n(),
              mean = mean(Time), sd = sd(Time), min = min(Time), max = max(Time),
              se = 2*sd/sqrt(num)) 
  # resumo: somente tempo
  result2 = summarise(dfgg, num = n(),
                      mean = mean(Time), sd = sd(Time), min = min(Time), max = max(Time),
                      se = 2*sd/sqrt(num)) 
  # escrever resultados
  write.csv(x=result1,file = paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/resultadosR/",name,"ResultByExperiment.csv",sep=""))
  write.csv(x=result2,file = paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/resultadosR/",name,"ResultSimple.csv",sep=""))
}


