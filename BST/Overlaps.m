function boollean=Overlaps(snode1,snode2)
if snode1.NO~=snode2.NO && ...
        strcmp(snode1.class,'non_scripted') && ...
        snode1.minX<=snode2.x_centroid && ...
        snode2.x_centroid<=snode1.maxX && ...
        snode1.minY<=snode2.y_centroid && ...
        snode2.y_centroid<snode1.maxY && ...
        ~Contains(snode2,snode1) && ...        
        ~((strcmp(snode2.class,'open_bracket') || snode2.content==44) && ...
        snode2.minY <= snode1.y_centroid && ...
        snode1.y_centroid<snode2.maxY && ...
        snode2.minX<=snode1.minX ) && ...
        ~((strcmp(snode2.class,'non_scripted') || strcmp(snode2.class,'variable_range')) && ...
        (snode2.maxX-snode2.minX>snode1.maxX-snode1.minX))
    boollean=1;
else
    boollean=0;
end
    
        
        
    