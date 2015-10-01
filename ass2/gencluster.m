
# gave errors otherwise
#graphics_toolkit('gnuplot')
function s = gencluster(p, size)

probs = rand(2*size+1);
map = 0.5*ones(2*size+1,2*size+1);

# Take the center point and move it on top
current = [size+1,size+1];

loops = 0;

while (rows(current) > 0)
  top = current(1,:);
  current(1,:) = [];
  loops = loops + 1;

  if ( map(top(1),top(2)) == 0.5 )

    if ( probs(top(1),top(2)) > p )
      map(top(1),top(2)) = 1;
      # Add neighbours
      if (top(2) > 0)
        if (top(1) > 0)
          current(end+1,:) = [top(1)-1,top(2)-1];
        end
        current(end+1,:) = [top(1),top(2)-1];
        if (top(1) < size*2+2)
          current(end+1,:) = [top(1)+1,top(2)-1];
        end
      end

      if (top(1) > 0)
        current(end+1,:) = [top(1)-1,top(2)];
      end
      if (top(1) < size*2+2)
        current(end+1,:) = [top(1)+1,top(2)];
      end

      if (top(2) < size*2+2)
        if (top(1) > 0)
          current(end+1,:) = [top(1)-1,top(2)+1];
        end
        current(end+1,:) = [top(1),top(2)+1];
        if (top(1) < size*2+2)
          current(end+1,:) = [top(1)+1,top(2)+1];
        end
      end

    else
      # This field is empty
      map(top(1),top(2)) = 0;
    end

  end

end

loops
s = map;
