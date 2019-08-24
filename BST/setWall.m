function snodelist=setWall(snode_list1,snode_list2,rnode1)
snode_list3=Hor(snode_list1,snode_list2);
NO=[snode_list3.NO];
NO1=sort(NO);
if size(NO,2)==1
    snode_list3.leftwall=rnode1.RminX;
    snode_list3.rightwall=rnode1.RmaxX;
    snode_list3.topwall=rnode1.RmaxY;
    snode_list3.bottonwall=rnode1.RminY;
else
    snode_list3(NO==NO1(1)).leftwall=rnode1.RminX;
    snode_list3(NO==NO1(1)).rightwall=snode_list3(NO==NO1(2)).minX;
    snode_list3(NO==NO1(1)).bottonwall=rnode1.RminY;
    snode_list3(NO==NO1(1)).topwall=rnode1.RmaxY;
    
    for i=2:size(NO,2)-1
        snode_list3(NO==NO1(i)).leftwall=snode_list3(NO==NO1(i)).minX;
        snode_list3(NO==NO1(i)).rightwall=snode_list3(NO==NO1(i+1)).minX;
        snode_list3(NO==NO1(i)).bottonwall=rnode1.RminY;
        snode_list3(NO==NO1(i)).topwall=rnode1.RmaxY;    
    end

    snode_list3(NO==NO1(end)).leftwall=snode_list3(NO==NO1(end)).minX;
    snode_list3(NO==NO1(end)).rightwall=rnode1.RmaxX;
    snode_list3(NO==NO1(end)).bottonwall=rnode1.RminY;
    snode_list3(NO==NO1(end)).topwall=rnode1.RmaxY;
    
end


snodelist=snode_list2;
for i=1:size(NO,2)
    snodelist([snodelist.NO]==snode_list3(i).NO).leftwall=snode_list3(i).leftwall;
    snodelist([snodelist.NO]==snode_list3(i).NO).rightwall=snode_list3(i).rightwall;
    snodelist([snodelist.NO]==snode_list3(i).NO).topwall=snode_list3(i).topwall;
    snodelist([snodelist.NO]==snode_list3(i).NO).bottonwall=snode_list3(i).bottonwall;
end