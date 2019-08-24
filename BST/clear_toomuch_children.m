function snode_list1=clear_toomuch_children(snode_list)
len=size(snode_list,2);
%我附庸的附庸不是我的附庸，清除我附庸的附庸
for i=1:len
    field1=fieldnames(snode_list(i).child);
    for k=1:size(field1,1)
        big_child=snode_list(i).child.(field1{k}).children;%一串NO
        if isempty(big_child)
            continue;
        end
        s=size(big_child,2);
        for j=1:s
            small_child=collectchildren(big_child(j),snode_list);
            if isempty(small_child)
                continue;
            end
            pos=find(ismember(big_child,small_child));
            snode_list(i).child.(field1{k}).children(pos)=0;                 
        end
        snode_list(i).child.(field1{k}).children(snode_list(i).child.(field1{k}).children==0)=[];
    end
end
snode_list1=snode_list;