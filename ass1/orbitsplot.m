function s = orbitsplot(K, numorbits, numsteps)

x = ones(1,numorbits*numsteps);
p =  ones(1,numorbits*numsteps);

for j=1:numorbits
  curindex = (j-1)*numsteps;
  x(curindex+1) = rand();
  p(curindex+1) = rand();
  for i=2:numsteps
    tempv = logstep2(K,x(curindex+i-1),p(curindex+i-1),1);
    x(curindex+i) = tempv(1);
    p(curindex+i) = tempv(2);
  end
end

scatter(x,p,1);
title([ 'K = ' num2str(K,'%0.5f')],'FontSize',18);
axis square;
