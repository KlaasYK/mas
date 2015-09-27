
function s = logstep2(K,x,p,n)
for i=1:n
  p = p + K * (sin(2*pi*x)/(2*pi));
  p = p - floor(p);
  x = x + p;
  x = x - floor(x);
end
s=[x,p];
