# Hackaton

index <- read.table(file = 'chr1_1064081-1064581.ct', header = T, stringsAsFactors = F)
index <- index[, c(2, 5)]

df <- read.table(file = 'chr3_101827525-101828025.ct', header = T, stringsAsFactors = F)
buff <- df[, c(2, 5)]

# Convert_to_numeric!

str(index)
index[, 2] <- as.numeric(index[, 2])
index <- index[1:500, ]

str(buff)
buff[, 2] <- as.numeric(buff[, 2])
buff <- buff[1:500, ]

temp <- cbind(index, buff)
names(temp)[c(1, 3)] <- c("Nuc1", "Nuc2")
names(temp)[2] <- 'chr1_1064081-1064581'
names(temp)[4] <- 'chr1_37477171-37477671'

temp <- temp[temp$`chr1_1064081-1064581` == temp$`chr1_37477171-37477671`, ]
temp_AT <- temp[(temp$Nuc1 == 'A' | temp$Nuc1 == 'T') & (temp$Nuc2 == 'A' | temp$Nuc2 == 'T'), ]
temp_GC <- temp[(temp$Nuc1 == 'C' | temp$Nuc1 == 'G') & (temp$Nuc2 == 'C' | temp$Nuc2 == 'G'), ]
temprory <- rbind(temp_AT, temp_GC)
temprory <- temprory[temprory$`chr1_1064081-1064581` == temprory$`chr1_1215122-1215622`, ]

rm(df, buff, temp, temp_AT, temp_GC)
