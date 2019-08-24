function snode1=MergeRegions(region_label_list,region_label,snode)
list=[];
len=size(region_label_list,2);
for i=1:len
    list=[list snode.child.(region_label_list{1}).children];
    snode.child.(region_label_list{1}).children=[];
end
snode.child.(region_label).children=list;
snode1=snode;