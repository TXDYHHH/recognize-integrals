function snode_list3=Hor(snode_list1,snode_list2)
if size(snode_list2,2)==0
    snode_list3=snode_list1;
    return;
end
len=size(snode_list1,2);
current_symbol=snode_list1(len);
[remaining_symbols,current_symbol]=Partition(snode_list2,current_symbol);
snode_list1(find([snode_list1.NO]==current_symbol.NO))=current_symbol;
if size(remaining_symbols,2)==0
    snode_list3=snode_list1;
    return;
end
if strcmp(current_symbol.class,'non_scripted')
    snode_list3=Hor(ConcatLists(snode_list1,(Start(remaining_symbols))),remaining_symbols);
    return;
end
SL=[remaining_symbols.NO];
while size(SL,2)~=0
    l1=SL(1);
    L1=remaining_symbols([remaining_symbols.NO]==l1);
    
    if isRegularHor(current_symbol,L1)
        snode_list3=Hor(ConcatLists(snode_list1,(CheckOverlap(L1,remaining_symbols))),remaining_symbols);
        return;
    end
    SL(1)=[];
end

current_symbol=PartitionFinal(remaining_symbols,current_symbol);
snode_list3=ConcatLists(snode_list1,(current_symbol));










