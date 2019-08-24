function snode_list2=CollectRegions_bleft(snode_list1)
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
    [superList,tleftList]=PartitionSharedRegion('bleft',s1,s2);
    s1_=AddToRegion('subsc',superList,s1);
    s2_=AddToRegion('bleft',tleftList,RemoveRegions('bleft',s2));
    snode_list2([snode_list2.NO]==s2.NO)=s2_;
end
if strcmp(s1_.class,'variable_range')
    upperList=cell(1,3);
    upperList{1}='bleft';
    upperList{2}='below';
    upperList{3}='subsc';
    s1_=MergeRegions(upperList,'below',s1);
end
snode_list2=ConcatLists(s1_,CollectRegions_bleft(snode_list2));
    