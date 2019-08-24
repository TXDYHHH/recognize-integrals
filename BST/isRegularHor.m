function boollean=isRegularHor(snode1,snode2)

if (snode1.content==43 || snode1.content==44 ) && ...
        snode2.minY<=snode1.y_centroid && ...
        snode1.y_centroid<snode2.maxY
    boollean=1;
    return;
end
if snode1.maxY<=snode2.maxY && snode1.minY>=snode2.minY
    boollean=1;
    return;
end
if IsAdjacent(snode2,snode1)
    boollean=1;
    return;
end


boollean=0;