function [snode_list1,snode1]=Partition(snode_list,snode)
snode1=snode;
list=[snode_list.NO];
pos=find([snode_list.NO]==snode.NO);
if ~isempty(pos)
    snode_list(pos)=[];
    list(pos)=[];
end

for i=1:size(list,2) 
    if snode_list(i).x_centroid>snode.child.above.RminX && ...
            snode_list(i).x_centroid<snode.child.above.RmaxX && ...
            snode_list(i).y_centroid>snode.child.above.RminY  && ...
            snode_list(i).y_centroid<snode.child.above.RmaxY 
        snode1.child.above.children=[snode1.child.above.children snode_list(i).NO];
        list(list==snode_list(i).NO)=[];
    
    elseif ~strcmp(snode.class,'non_scripted' ) && ...
            ~strcmp(snode.class,'open_bracket') && ...
         snode_list(i).x_centroid>snode.child.subsc.RminX && ...
            snode_list(i).x_centroid<snode.child.subsc.RmaxX && ...
            snode_list(i).y_centroid>snode.child.subsc.RminY  && ...
            snode_list(i).y_centroid<snode.child.subsc.RmaxY          
        snode1.child.subsc.children=[snode1.child.subsc.children snode_list(i).NO];
        list(list==snode_list(i).NO)=[];     
        
    elseif  snode_list(i).x_centroid>snode.child.below.RminX && ...
            snode_list(i).x_centroid<snode.child.below.RmaxX && ...
            snode_list(i).y_centroid>snode.child.below.RminY  && ...
            snode_list(i).y_centroid<snode.child.below.RmaxY 
        
            snode1.child.below.children=[snode1.child.below.children snode_list(i).NO];
            list(list==snode_list(i).NO)=[];
       
        
     elseif strcmp(snode.class,'root' )
         if snode_list(i).x_centroid>snode.child.contains.RminX  && ...
            snode_list(i).x_centroid<snode.child.contains.RmaxX  && ...
            snode_list(i).y_centroid>snode.child.contains.RminY  && ...
            snode_list(i).y_centroid<snode.child.contains.RmaxY     
        snode1.child.contains.children=[snode1.child.contains.children snode_list(i).NO];    
        list(list==snode_list(i).NO)=[];
         end
                  
    elseif strcmp(snode.class,'variable_range') && ...
          snode_list(i).x_centroid>snode.child.tleft.RminX && ...
            snode_list(i).x_centroid<snode.child.tleft.RmaxX && ...
            snode_list(i).y_centroid>snode.child.tleft.RminY  && ...
            snode_list(i).y_centroid<snode.child.tleft.RmaxY          
        snode1.child.tleft.children=[snode1.child.tleft.children snode_list(i).NO];    
        list(list==snode_list(i).NO)=[];
        
     elseif strcmp(snode.class,'variable_range') && ...
          snode_list(i).x_centroid>snode.child.bleft.RminX && ...
            snode_list(i).x_centroid<snode.child.bleft.RmaxX && ...
            snode_list(i).y_centroid>snode.child.bleft.RminY  && ...
            snode_list(i).y_centroid<snode.child.bleft.RmaxY         
           
        snode1.child.bleft.children=[snode1.child.bleft.children snode_list(i).NO];    
        list(list==snode_list(i).NO)=[];
         
     elseif  ~strcmp(snode.class,'non_scripted')  && ...
            ~strcmp(snode.class,'open_bracket') && ...
         snode_list(i).x_centroid>snode.child.super.RminX  && ...                
                snode_list(i).x_centroid<snode.child.super.RmaxX  && ...
                snode_list(i).y_centroid>snode.child.super.RminY   &&  ...
                snode_list(i).y_centroid<snode.child.super.RmaxY             
            snode1.child.super.children=[snode1.child.super.children snode_list(i).NO];
            list(list==snode_list(i).NO)=[];
        
    end
end
len=size(list,2);
list=sort(list);
if len==0
    snode_list1=[];
else
    for i=1:len
        pos=find([snode_list.NO]==list(i));
        snode_list1(i)=snode_list(pos);
    end
end