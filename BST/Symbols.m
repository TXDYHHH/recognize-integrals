function snode_list=Symbols(rnode)
global listout;
for i=1:size(rnode.children,2)
    a=find([listout.NO]==rnode.children(i));
    snode_list(i)=listout(a);
end