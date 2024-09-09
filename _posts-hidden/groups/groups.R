"%w/o%" <- function(x, y) x[!x %in% y] #--  x without y

dat <- read.csv("roster.csv", header=T)
name <- strsplit(dat$StudentName, " ")
first <- sapply(name, function(x) x[2])
last <- sapply(name, function(x) gsub(",", "", x[1]))

first[first=="Xi"] <- "Abby"

name <- paste(first, last, sep=" ")
email <- dat$Email
dat2 <- cbind(first, last, name, email)
oo <- order(first)
dat2 <- dat2[oo, ]
dat2 <- rbind(dat2[1:2,], c("", "", "", ""), dat2[3:14,])
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

dat3 <- cbind(dat2, gr2, gr3, gr4, gr5, gr6, gr7, gr8, gr9, gr10, gr11, gr12, gr13, gr14)

grsize <- 3
wk=2

for (wk in wk) {
gr <- vector(mode="list")
ngroups <- ceiling(nrow(dat)/grsize)
n <- 1:nrow(dat3)
i = 1

for (j in 1:(ngroups)) {
    	gr[[j]] <- sample(n, grsize)
    	n <- n %w/o% gr[[j]]
}

#gr[[ngroups-1]] <- sample(n, grsize-1)
#    	n <- n %w/o% gr[[ngroups-1]]
gr[[ngroups]] <- n

grn <- c(paste("group", rep(1:(ngroups-1), each=3, sep="")), 
			  paste("group", rep(ngroups, each=2, sep=""))
			)
gr.name <- unlist( lapply(gr, function(i) last[i]))
gr.email <- unlist( lapply(gr, function(i) email[i]))
gr.first <- unlist( lapply(gr, function(i) first[i]))
zoom <- data.frame( "Pre-assign Room Name"=grn, "Email Address"=gr.email, check.names=F)

teammates <- data.frame( Section="1", Team=grn, Name=paste(gr.first, gr.name, sep=" "), Email=gr.email, check.names=F)

sink(file=paste("week", wk, "web.txt", sep=""))
print(lapply(gr, function(i) paste(first[i])))
sink()
write.csv(zoom, file=paste("week", wk, ".csv", sep=""), row.names=F)
write.csv(teammates, file=paste("week", wk, "teammates.csv", sep=""), row.names=F)

}

