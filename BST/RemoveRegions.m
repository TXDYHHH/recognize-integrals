function snode1=RemoveRegions(label_list,snode)
len=size(label_list);
for i=1:len
    label=label_list{i};
    snode.child.(label).children=[];
end
snode1=snode;