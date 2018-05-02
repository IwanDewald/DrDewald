# Hackaton (снова)

index <- read.table(file = 'chr10_102394215-102394715.ct', header = T, stringsAsFactors = F)
index <- index[, c(2, 5)]

df <- read.table(file = 'chr11_441882-442382.ct', header = T, stringsAsFactors = F)
buff <- df[, c(2, 5)]

index[, 2] <- as.numeric(index[, 2])
index <- index[1002:1503, ]

buff <- buff[1002:1503, ]

cord <- index[, 2] == buff[, 2]

temp <- cbind(index, buff)
names(temp)[c(1, 3)] <- c("Nuc1", "Nuc2")
Seq <- (temp$Nuc1 == 'A' | temp$Nuc1 == 'T') & (temp$Nuc2 == 'A' | temp$Nuc2 == 'T')|
           (temp$Nuc1 == 'C' | temp$Nuc1 == 'G') & (temp$Nuc2 == 'C' | temp$Nuc2 == 'G')

result_1_3 <- cbind(Seq, cord)

res_5_7 <- cbind(Seq, cord)

res_10_11 <- cbind(Seq, cord)
i <- which(res_10_11[, 1] == T & res_10_11[, 2] == T)

index[i, ]

buff[i, ]

rm(list = ls())
