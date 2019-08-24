function snode_list1=merge_number(snode_list,list)
%解决数字合并的问题
if isempty(list)
    snode_list1=snode_list;
    return;
end

letter=0:9;
pos=find(ismember([snode_list(list).content],letter));%list中是数字的元素的位置
temp= diff(find(diff([nan pos nan])~=1));
len=length(temp);
s=1;
number_list=cell(1,len);
str=[];
for i=1:len
    str=[];
    number_list{i}=list(pos(s):pos(s+temp(i)-1));
    s=s+temp(i);
    for k=1:length(number_list{i})
        str=[str num2str(snode_list(number_list{i}(k)).content)];
        if ~isempty(snode_list(number_list{i}(k)).child.subsc.children) && ...
            snode_list(snode_list(number_list{i}(k)).child.subsc.children).content==49
            snode_list(snode_list(number_list{i}(k)).child.subsc.children).NO=snode_list(number_list{i}(1)).NO;
            str=[str '.'];            
        end
        snode_list(number_list{i}(k)).content=72;
    end
    num=str2num(str);
    for k=1:length(number_list{i})
        snode_list(number_list{i}(k)).number=num;
        snode_list(number_list{i}(k)).NO=snode_list(number_list{i}(1)).NO;
        snode_list(number_list{i}(k)).child=snode_list(number_list{i}(length(number_list{i}))).child;
    end   
end
snode_list1=snode_list;

