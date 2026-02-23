## load diversitree
library(diversitree)
mytrees <- read.nexus("10kTrees_Primates.nex")
mytree<-consensus.edges(mytrees,method="least.squares")
mytree
#mytree <- force.ultrametric(mytree)
mytree <- multi2di(mytree)
sampling.f <- 273/376
## make birth-death likelihood function
bd<-make.bd(mytree,sampling.f=sampling.f)
## find MLE using optimization function
fitted.bd<-find.mle(bd,x.init=c(0.1,0.05),method="optim",lower=0)
fitted.bd

## make pure-birth likelihood function
yule<-make.yule(mytree,sampling.f=sampling.f)
## find MLE using optimization function
fitted.yule<-find.mle(yule,x.init=0.1,method="optim",lower=0)
fitted.yule

anova(fitted.yule,fitted.bd)


sampling.f <- 273/522
## make birth-death likelihood function
bd<-make.bd(mytree,sampling.f=sampling.f)
## find MLE using optimization function
fitted.bd<-find.mle(bd,x.init=c(0.1,0.05),method="optim",lower=0)
fitted.bd

## make pure-birth likelihood function
yule<-make.yule(darter.tree,sampling.f=sampling.f)
## find MLE using optimization function
fitted.yule<-find.mle(yule,x.init=0.1,method="optim",lower=0)
fitted.yule

anova(fitted.yule,fitted.bd)
