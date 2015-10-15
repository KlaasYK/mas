function s = plotcluster(p, size)

cluster = gencluster(p,size);
img = gray2ind(cluster);
hold on
imshow(img,[0,64]);
axis("image")
axis("on")
hold off