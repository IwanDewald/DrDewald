# TurboFold

# Multilign

df <- read.table("C:\\Johannes\\Hackaton\\multilign_RNA_out\\chr10_102394215-102394715.ct", 
                 header = T, stringsAsFactors = F)
df <- df[, c(2, 5)]
str(df)

names(df)[1] <- "Nucl.1"
names(df)[2] <- "chr10_102394215_102394715" 

df2 <- read.table("C:\\Johannes\\Hackaton\\multilign_RNA_out\\chr11_102317102-102317602.ct", header = T, stringsAsFactors = F)
df2 <- df2[, c(2, 5)]
str(df2)

names(df2)[1] <- "Nucl.2"
names(df2)[2] <- "chr11_102317102_102317602" 


df2 <- df2[1:500, ]
cord <- df[, 2] == df2[, 2]

seq <- (df$Nucl.1 == 'A' | df$Nucl.1 == 'T') & (df2$Nucl.2 == 'A' | df2$Nucl.2 == 'T')|
  (df$Nucl.1 == 'C' | df$Nucl.1 == 'G') & (df2$Nucl.2 == 'C' | df2$Nucl.2 == 'G')

V <- cbind(seq, cord)
i <- which(V[, 1] == T & V[, 2] == T)
df[i, ]

x <- df[i, ]
names(x) <- c("Seq", "Coords")
write.table(x, file = "res.csv")
