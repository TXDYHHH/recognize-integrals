function snode_list3=ConcatLists(snode_list1,snode_list2)
list1=[snode_list1.NO];
list2=[snode_list2.NO];
list=unique([list1 list2]);
list=sort(list);
len=size(list,2);
for i=1:len
    pos=find([snode_list1.NO]==list(i));
    if isempty(pos)
        pos=find([snode_list2.NO]==list(i));
        snode_list3(i)=snode_list2(pos);
        continue;
    end
    snode_list3(i)=snode_list1(pos);
end