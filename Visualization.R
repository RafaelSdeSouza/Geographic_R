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



gdata<-file[,c(3,4,5,8,23,24,31)]
colnames(gdata) <- c("Age","Gender","Student","Q1","Q2","Q3","Q4")

gdata$Q1<-as.factor(gdata$Q1)
gdata$Q2<-as.factor(gdata$Q2)
gdata$Q3<-as.factor(gdata$Q3)
gdata$Q4<-as.factor(gdata$Q4)
Q1 <- ggplot(aes(x=Q1,fill=Age),data=gdata) +
  geom_bar() + facet_wrap(Gender ~ Student,scales="free_y") +
  theme_economist() + scale_fill_wsj()+
  theme(legend.background = element_rect(fill="white"),legend.key = element_rect(fill = "white"),plot.background = element_rect(fill = "white"),panel.grid.major = element_line(colour = "gray"),panel.background = element_rect(fill = "white"),legend.title = element_text(size=15),
        axis.title=element_text(size=15,face="bold"),
    text = element_text(size=12),axis.title.x=element_text(size=rel(1)))+
  xlab("Likert scale") + ylab("Number of responses")+
  ggtitle("Interested in Politics")
  
  
pdf("Q1.pdf",height = 12,width = 15)
Q1
dev.off()


Q2 <- ggplot(aes(x=Q2,fill=Age),data=gdata) +
  geom_bar() + facet_wrap(Gender ~ Student,scales="free_y") +
  theme_economist() + scale_fill_wsj()+
  theme(legend.background = element_rect(fill="white"),legend.key = element_rect(fill = "white"),plot.background = element_rect(fill = "white"),panel.grid.major = element_line(colour = "gray"),panel.background = element_rect(fill = "white"),legend.title = element_text(size=15),
        axis.title=element_text(size=15,face="bold"),
        text = element_text(size=12),axis.title.x=element_text(size=rel(1)))+
  xlab("Likert scale") + ylab("Number of responses")+
  ggtitle("Shared Opinion by Pressing the Like Button")


pdf("Q2.pdf",height = 12,width = 15)
Q2
dev.off()


Q3 <- ggplot(aes(x=Q3,fill=Age),data=gdata) +
  geom_bar() + facet_wrap(Gender ~ Student,scales="free_y") +
  theme_economist() + scale_fill_wsj()+
  theme(legend.background = element_rect(fill="white"),legend.key = element_rect(fill = "white"),plot.background = element_rect(fill = "white"),panel.grid.major = element_line(colour = "gray"),panel.background = element_rect(fill = "white"),legend.title = element_text(size=15),
        axis.title=element_text(size=15,face="bold"),
        text = element_text(size=12),axis.title.x=element_text(size=rel(1)))+
  xlab("Likert scale") + ylab("Number of responses")+
  ggtitle("Shared Political Content on SNS")


pdf("Q3.pdf",height = 12,width = 15)
Q3
dev.off()


Q4 <- ggplot(aes(x=Q4,fill=Age),data=gdata) +
  geom_bar() + facet_wrap(Gender ~ Student,scales="free_y") +
  theme_economist() + scale_fill_wsj()+
  theme(legend.background = element_rect(fill="white"),legend.key = element_rect(fill = "white"),plot.background = element_rect(fill = "white"),panel.grid.major = element_line(colour = "gray"),panel.background = element_rect(fill = "white"),legend.title = element_text(size=15),
        axis.title=element_text(size=15,face="bold"),
        text = element_text(size=12),axis.title.x=element_text(size=rel(1)))+
  xlab("Likert scale") + ylab("Number of responses")+
  ggtitle("Attended to a Protest or Similar Event")


pdf("Q4.pdf",height = 12,width = 15)
Q4
dev.off()