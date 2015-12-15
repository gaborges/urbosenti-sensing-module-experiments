library(ggplot2)
library(dplyr)
library(tidyr)

# colocar lista de arquivos e concatenar os nomes com os locais (função paste)
fileNames <- c("238cpu01",
               "238cpu01-noAdaptation",
               "238cpu02",
               "238cpu02-noAdaptation",
               "238cpu01-14h-new",
               "238cpu01-noAdaptation-14h-new",
               "238cpu02-14h-new",
               "238cpu02-noAdaptation-14h-new",
               "238cpu01-old-14h",
               "238cpu01-noAdaptation-old-14h",
               "238cpu02-old-14h",
               "238cpu02-noAdaptation-old-14h",
               "cpuDump01WithAdaptation",
               "cpuDump01WithoutAdaptation",
               "cpuDump02WithAdaptation",
               "cpuDump02WithoutAdaptation",
               "cpuDump03WithAdaptation",
               "238cpu03-no-adaptation-14h",
               "238cpu03-adaptation-14h",
               "62cpu01",
               "62cpu01-noAdaptation",
               "62cpu02",
               "62cpu02-noAdaptation")

for(name in fileNames){
  # ler cada arquivo de entrada
  df = read.csv(paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/dadosPreProcessados/",name,".out",sep=""),header=T,colClasses = c("numeric"))
  # resumo: por alternativa
  result1 = summarise(df, num = n(),mean = mean(CPU), sd = sd(CPU), min = min(CPU), max = max(CPU),
              se = 2*sd/sqrt(num)) 
  # escrever resultados
  write.csv(x=result1,file = paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/resultadosR/",name,"ResultCPU.csv",sep=""))
}