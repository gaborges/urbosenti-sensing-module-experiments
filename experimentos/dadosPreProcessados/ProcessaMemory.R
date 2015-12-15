library(ggplot2)
library(dplyr)
library(tidyr)

# colocar lista de arquivos e concatenar os nomes com os locais (função paste)
fileNames <- c("memoryDump01WithAdaptation",
               "memoryDump02WithAdaptation",
               "memoryDump03WithAdaptation",
               "memoryDump01WithoutAdaptation",
               "memoryDump02WithoutAdaptation",
               "62memory01-adaptation",
               "62memory02-adaptation",
               "62memory01-noAdaptation",
               "62memory02-noAdaptation",
               "238memory01-adaptation",
               "238memory02-adaptation",
               "238memory01-noAdaptation",
               "238memory02-noAdaptation",
               "238memory01-adaptation-14h-new",
               "238memory02-adaptation-14h-new",
               "238memory01-noAdaptation-14h-new",
               "238memory02-noAdaptation-14h-new",
               "238memory01-adaptation-old-14h",
               "238memory02-adaptation-old-14h",
               "238memory01-noAdaptation-old-14h",
               "238memory02-noAdaptation-old-14h")

for(name in fileNames){
  # ler cada arquivo de entrada
  df = read.csv(paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/dadosPreProcessados/",name,".out",sep=""),header=T,colClasses = c("numeric"))
  # resumo: por alternativa
  result1 = summarise(df, num = n(),mean = mean(mem), sd = sd(mem), min = min(mem), max = max(mem),
              se = 2*sd/sqrt(num)) 
  # escrever resultados
  write.csv(x=result1,file = paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/resultadosR/",name,"result.csv",sep=""))
}