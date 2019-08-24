function boollean=includes(snode1,snode2)
%snode1°üº¬snode2
if snode1.minX<=snode2.x_centroid && ...
        snode2.x_centroid<snode1.maxX 
    boollean=1;
else
    boollean=0;
end
    