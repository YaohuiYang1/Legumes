# Libraries
library(ggraph)
library(igraph)
library(tidyverse)
library(ggplot2)
library(ggsci)

edges <- read.delim('Edge.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
vertices <- read.delim('Node.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)

# Then we have to make a 'graph' object using the igraph library:
mygraph <- graph_from_data_frame( edges, vertices=vertices )

# Left: color depends of depth
p <- ggraph(mygraph, layout = 'circlepack', weight=size) + 
  geom_node_circle(aes(fill = group)) + 
  geom_node_text( aes(label=shortName, filter=leaf,  size=size*0.001)) +
  theme_void() + 
  theme(legend.position="FALSE")
p
#p
#p + scale_fill_viridis()
# Adjust color palette: colorBrewer
p + scale_fill_distiller(palette = "RdPu") 


