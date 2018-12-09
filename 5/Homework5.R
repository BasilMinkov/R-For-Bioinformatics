# Wassily Minkow, HW4

# 1 

library(ape)
dna = paste(read.dna("/Users/wassilyminkow/Scripts/R/CourseR/4/sequence.fasta", format="fasta", as.character=TRUE), collapse = "")

text = dna

countWords = function(text='abbbaasd',len=2)
{
  li = unlist(strsplit(text, split = ""), use.names = F)
  range = 1:(length(li)-len+1)
  table(sapply(range, function(b) paste0(li[c(b:(b+len-1))], collapse = "")))
}

table_fast = countWords(text=text, len=len)
write.table(table_fast, file = "dna_sixes_faster")
system.time(countWords(text=text, len=len))

sort(table_fast)[c(1,2, length(table_fast), length(table_fast)-1)] # cctagg - 24; ctagac - 25; ctggcg - 5666; cgccag - 5883

# 2 

sort(table_fast)[c(1,2, length(table_fast), length(table_fast)-1)]

p_i = table_fast
for (i in 1:length(table_fast))
  p_i[i] = table_fast[i]/sum(table_fast)

p_i[1]
# sort(p_i)[c(1,2, length(p_i), length(p_i)-1)]

# 3

count.nuc.fr = function(dna)
{
  nuc.fr = c(0,0,0,0)
  dna_array = unlist(strsplit(dna, split = ""), use.names = F)
  nuc.fr[1] = (sum(dna_array == "a")/length(dna_array))
  nuc.fr[2] = (sum(dna_array == "t")/length(dna_array))
  nuc.fr[3] = (sum(dna_array == "g")/length(dna_array))
  nuc.fr[4] = (sum(dna_array == "c")/length(dna_array))
  return(nuc.fr)
}


count.word.fr = function(word, nuc.fr)
{
  fr = 1
  word = unlist(strsplit(word, split = ""), use.names = F)
  for (i in 1:(length(word)))
    if (word[i] == "a")
      fr = fr * nuc.fr[1]
    else if (word[i] == "t")
      fr = fr * nuc.fr[2]
    else if (word[i] == "g")
      fr = fr * nuc.fr[3]
    else if (word[i] == "c")
      fr = fr * nuc.fr[4]
  return(fr)
}

nuc.fr = count.nuc.fr(dna)
nuc.fr

fr_table = table_fast

for (j in 1:length(table_fast))
  fr_table[j] = count.word.fr(names(table_fast)[j], nuc.fr)  

count.word.fr(names(table_fast)[length(fr_table)-1001], nuc.fr)

sort(fr_table)[]

fr_table

# 4 

m = (p_i)/(fr_table)

sort(m)[c(1:5)]
sort(m)[c((length(m)-5):length(m))]

