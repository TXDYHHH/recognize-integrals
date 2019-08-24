function snode_list2=SortSymbolByMinX(snode_list1)
temp=sort([snode_list1.minX]);
len=size(snode_list1,2);
i=1;
while i<len+1
    pos=find([snode_list1.minX]==temp(i));
    s=length(pos);
    for j=1:s
        snode_list2(i)=snode_list1(pos(j));
        i=i+1;
    end
end