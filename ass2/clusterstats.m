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
bar([pstart:inc:pend],A(3,:));
errorbar([pstart:inc:pend],A(1,:),A(2,:));
axis([pstart,pend]);
axis("on");
hold off;
s=A;