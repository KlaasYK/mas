function s = plotcluster(p, size)

cluster = gencluster(p,size);
img = gray2ind(cluster);
imshow(img,[0,64]);