library(ggplot2)
library(dplyr)
library(tidyr)

# colocar lista de arquivos e concatenar os nomes com os locais (função paste)
fileNames <- c("238Ping",
               "62Ping",
               "PingGeral",
               "TimesPingAndroidTo238",
               "TimesPing238ToAndroid")

for(name in fileNames){
  # ler cada arquivo de entrada
  df = read.csv(paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/dadosPreProcessados/",name,".out",sep=""),header=T,colClasses = c("numeric"))
  # resumo: por alternativa
  result1 = summarise(df, num = n(),mean = mean(time), sd = sd(time), min = min(time), max = max(time),
              se = 2*sd/sqrt(num)) 
  # escrever resultados
  write.csv(x=result1,file = paste("C:/Users/Guilherme/Dropbox/Dissertação/experimentos/resultadosR/",name,"Result.csv",sep=""))
}
