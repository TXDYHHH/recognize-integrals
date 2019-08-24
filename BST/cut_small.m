function p_out=cut_small(p_in)
[hang,lie]=size(p_in);
while isempty(find(p_in(hang,:)==0))
    p_in(hang,:)=[];
    hang=hang-1;
end
while isempty(find(p_in(:,lie)==0))
    p_in(:,lie)=[];
    lie=lie-1;
end  
while isempty(find(p_in(1,:)==0))
    p_in(1,:)=[];
end
while isempty(find(p_in(:,1)==0))
    p_in(:,1)=[];
end
p_out=p_in;