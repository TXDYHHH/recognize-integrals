function [snode_list1,list]=refineBST(list,snode_list)
snode_list1=clear_toomuch_children(snode_list);
%解决cos，sin的问题

snode_list1=merge_function(snode_list1,list);
for i=1:size(snode_list1,2)
    if ~([snode_list1(i).NO]==i)
        continue;
    end
    name=fieldnames(snode_list1(i).child);
    for j=1:length(name)
        snode_list1=merge_function(snode_list1,snode_list1(i).child.(name{j}).children);            
    end
end
pos=find((ismember(list,[snode_list1.NO]))==0);
list(pos)=[];

%解决数字问题
snode_list1=merge_number(snode_list1,list);
for i=1:length(snode_list1)
    if snode_list1(i).NO~=i
        continue;
    end
    name=fieldnames(snode_list1(i).child);
    for j=1:length(name)
        snode_list1=merge_number(snode_list1,snode_list1(i).child.(name{j}).children);            
    end
end
pos=find((ismember(list,[snode_list1.NO]))==0);
list(pos)=[];



        
