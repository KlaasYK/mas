function s = iterplot2(K,xpinit,nsteps)

x = xpinit(1) * ones(1,nsteps);
xprev = x;
p = xpinit(2) * ones(1,nsteps);
pprev = p;
time = 1 : nsteps;

for i=2:nsteps
  tempv = logstep2(K,x(i-1),p(i-1),1);
  x(i) = tempv(1);
  p(i) = tempv(2);
  %xprev(i) = x(i-1);
  %pprev(i) = p(i-1);
end

scatter(x,p,1);
xlabel("x");
ylabel("p");
title([ 'K = ' num2str(K,'%0.5f') ' p0 = ' num2str(xpinit(2),'%0.5f') ' x0 = ' num2str(xpinit(1),'%0.5f')],'FontSize',18);
axis square;
