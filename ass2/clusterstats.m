function s = clusterstats(pstart, pend, size, runs, inc)

A = zeros(3, (pend-pstart)/inc);
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
  A(1,c) = mean(vec);
  A(2,c) = std(vec);
  A(3,c) = per/runs;
  c = c+1;
endfor

A