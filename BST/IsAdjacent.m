function boollean=IsAdjacent(snode1,snode2)
if ~strcmp(snode2.class,'non_scripted') && ...
        snode1.NO~=snode2.NO && ...
        snode2.subsc<=snode1.y_centroid && ...
        snode1.y_centroid <snode2.super
    boollean=1;
    return;
end
boollean=0;
    