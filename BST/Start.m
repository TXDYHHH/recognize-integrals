function s=Start(snode_list)
len=size(snode_list,2);
temp=snode_list(len);
for i=1:len-1
    if Overlaps(temp,snode_list(len-i)) || ...
            Contains(temp,snode_list(len-i)) || ...
            (strcmp(temp.class,'variable_range') && ~IsAdjacent(snode_list(len-i),temp))        
    else
        temp=snode_list(len-i);
    end
end
s=temp;