function snode_list2=CollectRegions_tleft(snode_list1)
if size(snode_list1,2)==0
    snode_list2=snode_list1;
    return;
end
s1=snode_list1(1);
s1_=s1;
snode_list2=snode_list1;
snode_list2(1)=[];
if size(snode_list1,2)>1
    s2=snode_list1(2);
    s2_=s2;
    [superList,tleftList]=PartitionSharedRegion('tleft',s1,s2);
    s1_=AddToRegion('super',superList,s1);
    s2_=AddToRegion('tleft',tleftList,RemoveRegions('tleft',s2));
    snode_list2([snode_list2.NO]==s2.NO)=s2_;
end
if strcmp(s1_.class,'variable_range')
    upperList=cell(1,3);
    upperList{1}='tleft';
    upperList{2}='above';
    upperList{3}='super';
    s1_=MergeRegions(upperList,'above',s1);
end
snode_list2=ConcatLists(s1_,CollectRegions_tleft(snode_list2));
    