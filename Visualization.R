require(ggplot2)
require(ggthemes)
require(Cairo)
library(plyr)


file<-read.csv("data/Respostas.csv",header=T)

file[,3]<-revalue(file[,3], c("até 20 anos" = "<= 20", "21 a 30 anos" = "21 to 30",
                "31 a 40 anos" = "31 to 40","41 a 50 anos" ="41 to 50",
                "a partir de 51 anos" = ">= 51"))
file[,3]<- factor(file[,3], levels = c("<= 20", "21 to 30", "31 to 40",
                                       "41 to 50",">= 51"))
file[,4] <- revalue(file[,4],c("Feminino" = "Women","Masculino" = "Men"))

file[,5]<- revalue(file[,5],c("Não" = "Non-Student","Sim" = "Student"))



gdata<-file[,c(3,4,5,17)]
colnames(gdata) <- c("Age","Gender","Student","civil_2013")
g1 <- ggplot(aes(x=civil_2013,fill=Age),data=gdata) +
  geom_bar() + facet_wrap(Gender ~ Student,scales="free_y") +
  theme_economist() + scale_fill_wsj()+
  theme(legend.background = element_rect(fill="white"),legend.key = element_rect(fill = "white"),plot.background = element_rect(fill = "white"),panel.grid.major = element_line(colour = "gray"),panel.background = element_rect(fill = "white"),legend.title = element_text(size=15),
        axis.title=element_text(size=15,face="bold"),
    text = element_text(size=12),axis.title.x=element_text(size=rel(1)))+
  xlab("Likert scale") + ylab("Number of responses")+
  ggtitle("Civic and Political Rights Concerns")
  
  
pdf("Civil3.pdf",height = 12,width = 15)
g1
dev.off()