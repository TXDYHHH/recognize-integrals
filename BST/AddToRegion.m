function snode1=AddToRegion(label,snode_list,snode)
list=[snode_list.NO];
snode.child.(label).children=[snode.child.(label).children list];
snode1=snode;







