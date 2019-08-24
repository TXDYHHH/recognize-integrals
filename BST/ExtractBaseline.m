function rnode2=ExtractBaseline(rnode1)
global listout;
snode_list=Symbols(rnode1);
if size(snode_list,2)<=1
    rnode2=rnode1;
    return 
end
S_start=Start(snode_list);
snode_list=setWall(S_start,snode_list,rnode1);

snode_list=renew_childwall(snode_list);
S_start=snode_list([snode_list.NO]==S_start.NO);
renew_listout(snode_list);
baseline_symbols=Hor(S_start,snode_list);
%updated_baseline=CollectRegions_tleft(baseline_symbols);
%updated_baseline=CollectRegions_bleft(updated_baseline);
updated_baseline=baseline_symbols;
rnode2=[updated_baseline.NO];
rnode1.children=[];
rnode1.children=[updated_baseline.NO];
len=size(updated_baseline,2);
for i=1:len
    listout([listout.NO]==updated_baseline(i).NO)=updated_baseline(i);
end

for i=1:len
    if isfield(updated_baseline(i).child,'above') 
        if ~isempty(updated_baseline(i).child.above.children)
            ExtractBaseline(updated_baseline(i).child.above);
        end
    end
    if isfield(updated_baseline(i).child,'below') 
        if  ~isempty(updated_baseline(i).child.below.children)
            ExtractBaseline(updated_baseline(i).child.below);
        end
    end
    if isfield(updated_baseline(i).child,'super') 
        if ~isempty(updated_baseline(i).child.super.children)
            ExtractBaseline(updated_baseline(i).child.super);
        end
    end
    if isfield(updated_baseline(i).child,'subsc') 
        if ~isempty(updated_baseline(i).child.subsc.children)
            ExtractBaseline(updated_baseline(i).child.subsc);
        end
    end
    if isfield(updated_baseline(i).child,'contains') 
        if  ~isempty(updated_baseline(i).child.contains.children)        
            ExtractBaseline(updated_baseline(i).child.contains);
        end
    end
end
    



