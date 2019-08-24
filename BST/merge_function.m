function snode_list1=merge_function(snode_list,list)
%解决cos，sin的问题
if isempty(list)
    snode_list1=snode_list;
    return;
end
letter=[11 13 15 17 19 22 24 25 28 29 30];
letters='acegilnorst';
str=[];
pos=find(ismember([snode_list(list).content],letter));
for i=1:length(pos)
    temp=letters(letter==snode_list(list(pos(i))).content);
    str=[str temp];
end
len=size(str,2);
fun={'lg','ln','log','sin','tan','cos','arcsin','arctan','arccos','sec','cot','csc'};
number=[63 64 65 60 61 62 69 70 71 67 66 68];
for i=1:size(fun,2)
    a=strfind(str,fun{i}); 
    len=size(fun{i},2);
    if ~isempty(a)
        for j=1:length(a)                   
            for k=1:len
                snode_list(list(pos(a(j)+k-1))).content=number(i);
                snode_list(list(pos(a(j)+k-1))).NO=snode_list(list(pos(a(j)))).NO;
                snode_list(list(pos(a(j)+k-1))).child=snode_list(list(pos(a(j)+len-1))).child;
            end
        end
    end
end
snode_list1=snode_list;