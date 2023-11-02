library(vegan)
library(picante)
#Load data
otu <- read.delim('Genus(relative abundance).txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
otu <- t(otu)
#Richness
richness <- rowSums(otu > 0)

#Shannon
shannon_index <- diversity(otu, index = 'shannon', base = exp(1))

#Shannon_diversity
shannon_diversity <- exp(1)^shannon_index

#Pielou
pielou <- shannon_index / log(richness, exp(1))

#Simpson
simpson=diversity(otu,"simpson")
#Save file
write.csv(richness, 'richness.csv', quote = FALSE)
write.csv(shannon_index, 'shannon_index.csv', quote = FALSE)
write.csv(shannon_diversity, 'shannon_diversity.csv', quote = FALSE)
write.csv(pielou, 'pielou.csv', quote = FALSE)
write.csv(simpson, 'simpson.csv', quote = FALSE)

