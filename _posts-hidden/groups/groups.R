"%w/o%" <- function(x, y) x[!x %in% y] #--  x without y

dat <- read.csv("roster.csv", header=T)
name <- strsplit(dat$StudentName, " ")
first <- sapply(name, function(x) x[2])
last <- sapply(name, function(x) gsub(",", "", x[1]))

first[first=="Xi"] <- "Abby"   # preferred name

name <- paste(first, last, sep=" ")
email <- dat$Email
dat2 <- cbind(first, last, name, email)
oo <- order(first)
dat2 <- dat2[oo, ]
dat2 <- rbind(dat2[1:2,], c("", "", "", ""), dat2[3:14,]). # dropped student
nn <- 1:dim(dat2)[1]

wk2 <- nn[c(1:5, 10:6, 11:15)]
gr2 <- c(c(1:5), c(5:1), c(1:5))
gr3 <- c(c(1,4,5), c(5:1), c(1:5), c(2:3))
gr4 <- c(c(1), c(5:1), c(1:5), c(2:5))
gr5 <- c(c(1), c(3:1), c(1:5), c(2:5), c(5:4))
gr6 <- c(c(1), c(1), c(1:5), c(2:5), c(5:2))
gr7 <- c(c(1), c(2:5), c(2:5), c(5:1), c(1))
gr8 <- c(c(1), c(4:5), c(2:5), c(5:1), c(1:3))
gr9 <- c(c(1), c(5), c(2:5), c(5:1), c(1:4))
gr10 <- c(c(1), c(3:5), c(5:1), c(1:5), c(2))
gr11 <- c(c(1), c(5), c(5:1), c(1:5), c(2:4))
gr12 <- c(c(1), c(4:1), c(1:5), c(2:5), c(5))
gr13 <- c(c(1), c(2:1), c(1:5), c(2:5), c(5:3))
gr14 <- c(c(1), c(1:5), c(2:5), c(5:1))

dat3 <- data.frame(cbind(dat2, gr2, gr3, gr4, gr5, gr6, gr7, gr8, gr9, gr10, gr11, gr12, gr13, gr14))
dat3 <- dat3[dat3$first!="",]  # removed dropped student

grsize <- 3
ngroups <- ceiling(nrow(dat3)/grsize)
groupweeks <- grep("gr", colnames(dat3), value=T)

for (j in groupweeks) {
  week <- gsub("gr", "", j)
  oo <- order(dat3[[j]])
  group <- dat3[[j]][oo]
  first <- dat3$first[oo]
  name <- dat3$name[oo]
  email <- dat3$email[oo]
  
  teammates <- data.frame( Section="1", Team=group, Name=name, Email=email, check.names=F)
  write.csv(teammates, file=paste("week", week, "teammates.csv", sep=""), row.names=F)

  sink(file=paste("week", week, "web.txt", sep=""))
  for (i in 1:ngroups)
    print(first[group==i])
  sink()

  zoom <- data.frame( "Pre-assign Room Name"=group, "Email Address"=email, check.names=F)
  write.csv(zoom, file=paste("Zoom_week", week, ".csv", sep=""), row.names=F)
}


