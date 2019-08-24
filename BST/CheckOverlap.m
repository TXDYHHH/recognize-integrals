function snode1=CheckOverlap(snode,snode_list)
len=size(snode_list,2);
j=1;
for i=1:len
    if strcmp(snode_list(i).class,'non_scripted')
        if Overlaps(snode_list(i),snode)
            snode_list1(j)=snode_list(i);
            j=j+1;
        end
    end
    
end
if ~exist('snode_list1','var')
    snode1=snode;
    return;
else
    len=size(snode_list1,2);
    if len==1
        snode1=snode_list1;
        return;
    else
        temp=snode_list1(1);
        for i=1:len-1
            if snode_list1(i).maxX-node_list1(i).minX<snode_list1(i+1).maxX-node_list1(i+1).minX
                temp=snode_list1(i+1);
            end
        end
        snode1=temp;
    end
end
    
    

            