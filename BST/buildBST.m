function bst=buildBST
global listout;
snode_list1=SortSymbolByMinX(listout);
for i=1:size(snode_list1,2)
    snode_list1(i).NO=i;
end
listout=snode_list1;
expression.children=[snode_list1.NO];
expression.RmaxY=+inf;
expression.RminY=-1;
expression.RmaxX=+inf;
expression.RminX=-1;
% bst=ExtractBaseline(expression);
 bst=Construct(expression);