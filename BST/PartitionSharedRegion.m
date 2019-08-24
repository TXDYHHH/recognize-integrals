function [snode_list1,snode_list2]=PartitionSharedRegion(label,snode1,snode2)
if strcmp(label,'tleft')
    rnode=snode2.child.tleft.children;
    SL=Symbols(rnode);
    if strcmp(snode1.class,'non_scripted')
        snode_list1=[];
    elseif strcmp(snode2.class,'variable_range') || ...
            strcmp(snode2.class,'variable_range') && ~HasNonEmptyRegion(snode2,'above')
        snode_list1=SL;
    elseif strcmp(snode2.class,'variable_range') && HasNonEmptyRegions(snode2,'above')
        snode_list1(1)=SL(1);
        i=2;
        while IsAdjacent(SL(i),snode2)
            snode_list1(i)=SL(i);
            i=i+1;
        end
    end
    len=size(snode_list1,2);
    for i=1:len
        SL([SL.NO]==snode_list1(i).NO)=[];
    end
    snode_list2=SL;
    return;
end
if strcmp(label,'bleft')
    rnode=snode2.child.bleft.children;
    SL=Symbols(rnode);
    if strcmp(snode1.class,'non_scripted')
        snode_list1=[];
    elseif strcmp(snode2.class,'variable_range') || ...
            strcmp(snode2.class,'variable_range') && ~HasNonEmptyRegion(snode2,'below')
        snode_list1=SL;
    elseif strcmp(snode2.class,'variable_range') && HasNonEmptyRegions(snode2,'below')
        snode_list1(1)=SL(1);
        i=2;
        while IsAdjacent(SL(i),snode2)
            snode_list1(i)=SL(i);
            i=i+1;
        end
    end
    len=size(snode_list1,2);
    for i=1:len
        SL([SL.NO]==snode_list1(i).NO)=[];
    end
    snode_list2=SL;
    return;
end
    
    