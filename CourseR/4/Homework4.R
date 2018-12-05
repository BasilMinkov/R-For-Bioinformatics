# Wassily Minkow, HW4

# 1. 

# The "runif" function generates uniform distribution, so the letters will appear we the equal probability.
generate.text = function(len, alphabet) paste(alphabet[runif(len, 1, length(alphabet)+1)],  collapse = "")

len = 16
alphabet = c("a", "c", "b", "d")

generate.text(len, alphabet)

# 2. 

countWords = function(text='abbba',len=2) return(table(substring(text, 1:(nchar(text)-len+1), 1:(nchar(text)-len+1)+len-1)))

text='dna'
len=2

answer = countWords(text, len)
answer

# 3.

library(ape)
dna = paste(read.dna("/Users/wassilyminkow/Scripts/R/CourseR/4/sequence.fasta", format="fasta", as.character=TRUE), collapse = "")

table = countWords(text=dna, len=6)
write.table(table, file = "dna_sixes")

sort(table)[c(1,2, length(table), length(table)-1)] # cctagg - 24; ctagac - 25; ctggcg - 5666; cgccag - 5883


