#Libraries
library(phyloseq)
library(igraph)
library(network)
library(sna)
library(tidyverse)
library(ggClusterNet)
library(Biostrings)
library(tidyfst)
library("pulsar")
library(tidyverse)

#Data import and merge data
metadata = read.delim("metadata.tsv",row.names = 1)
otutab = read.delim("otu_table.txt", row.names=1)
taxonomy = read.table("taxonomy.txt", row.names=1)
# tree  = read_tree("./otus.tree")
# rep = readDNAStringSet("./otus.fa")

ps = phyloseq(sample_data(metadata),otu_table(as.matrix(otutab), taxa_are_rows=TRUE),
              tax_table(as.matrix(taxonomy))#,
              # phy_tree(tree),
              # refseq(rep)
)
#Network stability calculation
res = natural.con.microp (
  ps = ps,
  Top = 500,
  r.threshold= 0.6,
  p.threshold=0.05,
  method = "spearman",
  norm = F,
  end = 400,# Less than the number of nodes in the network
  start = 0,
  con.method = "pulsar"
)

p = res[[1]]
p
dat  = res[[2]]
