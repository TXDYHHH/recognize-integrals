function boollean=HasNonEmptyRegion(snode,region_label)
region=region_label;
if isfield(snode.child,region) 
    if size(snode.child.(region),2)>0
        boollean=1;
        return;
    end
end
boollean=0;
