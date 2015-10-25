function s = clusterstats(pstart, pend, size, runs, inc)

A = zeros(4, (pend-pstart)/inc);
c = 1;
for p = pstart:inc:pend
  vec = [];
  per = 0;
  for i = 1:runs
      k = clustersize(p,size);
      if (isnan(k))
        per = per + 1;
      else 
        vec(end+1) = k;
      endif     
  endfor
  if (columns(vec) > 1)
    A(1,c) = mean(vec);
    A(2,c) = std(vec);
  endif
  A(3,c) = per;
  A(4,c) = per/runs;
  c = c+1;
endfor
hold on;
axis([pstart,pend]);
title([ 'size: ' num2str(2*size+1,'%d') 'x' num2str(2*size+1,'%d') ' runs: ' num2str(runs,'%d')  ],'FontSize',18);
axis("on");
bar([pstart:inc:pend],A(3,:));
errorbar([pstart:inc:pend],A(1,:),A(2,:));
xlabel("p");
ylabel("cluster size/infinite clusters");
legend("infinite clusters","cluster size","location","northwest");
hold off;
s=A;