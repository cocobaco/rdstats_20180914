# clustering: hierarchical and non-hierachical
# hierarchical: agglomorative and divisive

data(USArrests)

head(USArrests)

arrests <- na.omit(USArrests)
# standard normalization
arrests_norm <- scale(arrests)

head(arrests_norm)

# distance matrix
d  <- dist(arrests_norm, method='euclidean')
# hierarchical clustering
hc <- hclust(d, method='complete')

plot(hc, cex=0.6, hang=-1)  # cex = scaling factor

# cut dendogram into 4 clusters
sub_grp <- cutree(hc, k=4)
sub_grp

