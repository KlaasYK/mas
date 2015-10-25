function s = orbitsplot(K, numorbits, numsteps)

hold on;
if (K == 0)
  x = ones(1,numsteps);
  p =  ones(1,numsteps);

  for j=1:numorbits
    x(1) = rand();
    p(1) = rand();
    for i=2:numsteps
      x(i) = i/numsteps;
      p(i) = p(i-1);
    end
    scatter(x,p,1,[rand(), rand(), rand()]);
  end
else
  x = ones(1,numsteps);
  p =  ones(1,numsteps);

  for j=1:numorbits
    x(1) = rand();
    p(1) = rand();
    for i=2:numsteps
      tempv = logstep2(K,x(i-1),p(i-1),1);
      x(i) = tempv(1);
      p(i) = tempv(2);
    end
    scatter(x,p,1,[rand(), rand(), rand()]);
  end
end

%scatter(x,p,1);
title([ 'K = ' num2str(K,'%0.5f')],'FontSize',18);
xlabel("x");
ylabel("p");
axis square;

hold off;
