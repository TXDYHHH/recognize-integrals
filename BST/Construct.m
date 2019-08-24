function BST=Construct(rnode)
global listout;
listout1=Symbols(rnode);
if size(listout1,2)<=1
    return;
end
snode=listout1(1);
BST=snode.NO;
flag=0;
for i=2:length(listout1) 
    flag=0;
    snode1=listout1(i);   
    if strcmp(snode.class,'non_scripted')
        [boollean,label]=Cover(snode,snode1);
        if boollean 
            snode=AddToRegion(label,snode1,snode);
        else
            flag=1;
            BST=[BST snode1.NO];
            snode.rightwall=snode1.minX;
            snode.child.above=struct('children',snode.child.above.children,'RmaxY',snode.topwall,'RminY',snode.above,'RminX',snode.minX,'RmaxX',snode.maxX);
            snode.child.below=struct('children',snode.child.below.children,'RmaxY',snode.below,'RminY',snode.bottonwall,'RminX',snode.minX,'RmaxX',snode.maxX);
            
        end       
    elseif strcmp(snode.class,'open_bracket') 
        BST=[BST snode1.NO];            
        snode.rightwall=snode1.minX;
        snode.child.above=struct('children',snode.child.above.children,'RmaxY',snode.topwall,'RminY',snode.above,'RminX',snode.minX,'RmaxX',snode.maxX);
        snode.child.below=struct('children',snode.child.below.children,'RmaxY',snode.below,'RminY',snode.bottonwall,'RminX',snode.minX,'RmaxX',snode.maxX);
        flag=1;
    elseif strcmp(snode.class,'root') 
        boollean=includes(snode,snode1);
        if boollean
            snode=AddToRegion('contains',snode1,snode);
        else
            [boollean,label]=IsNext(snode1,snode);
            if boollean
                flag=1;
                BST=[BST snode1.NO];            
                snode.rightwall=snode1.minX;
                snode.child.above=struct('children',snode.child.above.children,'RmaxY',snode.topwall,'RminY',snode.above,'RminX',snode.minX,'RmaxX',snode.maxX);
                snode.child.below=struct('children',snode.child.below.children,'RmaxY',snode.below,'RminY',snode.bottonwall,'RminX',snode.minX,'RmaxX',snode.maxX);
                snode.child.super=struct('children',snode.child.super.children,'RmaxY',snode.topwall,'RminY',snode.super,'RminX',snode.maxX,'RmaxX',snode.rightwall);
                snode.child.subsc=struct('children',snode.child.subsc.children,'RmaxY',snode.subsc,'RminY',snode.bottonwall,'RminX',snode.maxX,'RmaxX',snode.rightwall);
            else
                snode=AddToRegion(label,snode1,snode);
            end   
        end
    elseif strcmp(snode.class,'ascender') || ...
            strcmp(snode.class,'descender') || ...
            strcmp(snode.class,'centerd') || ...
            strcmp(snode.class,'variable_range') 
        [boollean,label]=IsNext(snode1,snode);
        if boollean 
            flag=1;
            BST=[BST snode1.NO];            
            snode.rightwall=snode1.minX;
            snode.child.above=struct('children',snode.child.above.children,'RmaxY',snode.topwall,'RminY',snode.above,'RminX',snode.minX,'RmaxX',snode.maxX);
            snode.child.below=struct('children',snode.child.below.children,'RmaxY',snode.below,'RminY',snode.bottonwall,'RminX',snode.minX,'RmaxX',snode.maxX);
            snode.child.super=struct('children',snode.child.super.children,'RmaxY',snode.topwall,'RminY',snode.super,'RminX',snode.maxX,'RmaxX',snode.rightwall);
            snode.child.subsc=struct('children',snode.child.subsc.children,'RmaxY',snode.subsc,'RminY',snode.bottonwall,'RminX',snode.maxX,'RmaxX',snode.rightwall);
        else
            snode=AddToRegion(label,snode1,snode);
        end        
    end
    listout(find([listout.NO]==snode.NO))=snode;
    if flag==1
        snode=snode1;
    end    
end
for i=1:length(BST)
    if isfield(listout([listout.NO]==BST(i)).child,'above') 
        if ~isempty(listout([listout.NO]==BST(i)).child.above.children)
            Construct(listout([listout.NO]==BST(i)).child.above);
        end
    end
    if isfield(listout([listout.NO]==BST(i)).child,'below') 
        if  ~isempty(listout([listout.NO]==BST(i)).child.below.children)
            Construct(listout([listout.NO]==BST(i)).child.below);
        end
    end
    if isfield(listout([listout.NO]==BST(i)).child,'super') 
        if ~isempty(listout([listout.NO]==BST(i)).child.super.children)
            Construct(listout([listout.NO]==BST(i)).child.super);
        end
    end
    if isfield(listout([listout.NO]==BST(i)).child,'subsc') 
        if ~isempty(listout([listout.NO]==BST(i)).child.subsc.children)
            Construct(listout([listout.NO]==BST(i)).child.subsc);
        end
    end
    if isfield(listout([listout.NO]==BST(i)).child,'contains') 
        if  ~isempty(listout([listout.NO]==BST(i)).child.contains.children)        
            Construct(listout([listout.NO]==BST(i)).child.contains);
        end
    end
end
