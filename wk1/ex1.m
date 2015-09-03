# randomness
# gave errors otherwise
graphics_toolkit('gnuplot')
# initial matrix
A = [0,0;1,0;1/2,sqrt(3)/2];
# add an element
A(end+1,1) = 1/2;
A(end,2) = 1/3;
i = 1;
while (i < 10000)
	# Choose random corner
	r = randi(3);
	vecrj = A(r,:);
	vecrk = A(end,:);
	# Add the vectors
	veck1 = (vecrj+vecrk)/2;
	# Add it to the array
	A(end+1,1) = veck1(1);
	A(end,2) = veck1(2);	
	i++;
endwhile
img = scatter(A(:,1),A(:,2));
