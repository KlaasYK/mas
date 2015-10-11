function s = plotcluster(p, size)

cluster = gencluster(p,size)
img = gray2ind(cluster);

s=imshow(img,[0,1.1]);