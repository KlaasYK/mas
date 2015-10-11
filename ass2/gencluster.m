
# gave errors otherwise
#graphics_toolkit('gnuplot')
function s = gencluster(p, size)

probs = rand(2*size+1);
map = 0.5*ones(2*size+1,2*size+1);

#mark the center spot as occupied
probs(size+1,size+1) =  0;

# Take the center point and move it on top
current = [size+1,size+1];

loops = 0;

while (rows(current) > 0)
  top = current(1,:);
  current(1,:) = [];
  loops = loops + 1;

  x = top(1);
  y = top(2);
  #Check if current node is not visited
  if ( map(x,y) == 0.5 )

    if ( probs(x,y) <= p )
      map(x,y) = 0;
      #top
      if (y > 1 && map(x,y-1) == 0.5)
        current(end+1,:) = [x,y-1];
      end

      # Left and right
      if (x > 1 && map(x-1,y) == 0.5)
        current(end+1,:) = [x-1,y];
      end
      if (x < size*2+1 && map(x+1,y) == 0.5)
        current(end+1,:) = [x+1,y];
      end

      # bottom
      if (y < size*2+1 && map(x,y+1) == 0.5)
        current(end+1,:) = [x,y+1];
      end
      

    else
      # This field is empty
      map(x,y) = 1.0;
    end
    # Node not visited
  end

end
s = map;
