function [boollean,label]=IsNext(snode1,snode2)
%snode1是snode2 的下一个
if  snode1.NO~=snode2.NO && ...
    snode2.subsc<=snode1.y_centroid && ...
    snode1.y_centroid <=snode2.super 
    boollean=1;
    label=[];
else
    boollean=0;
end
if  snode2.subsc>snode1.y_centroid
    label='subsc';
end
if snode1.y_centroid > snode2.super
    label='super';
end