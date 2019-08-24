function [boollean,label]=Cover(snode1,snode2)
%snode1是分数线
if snode1.minX<=snode2.x_centroid && ...
        snode2.x_centroid<=snode1.maxX 
    boollean=1;
    if snode2.y_centroid>snode1.maxY
        label='above';
    elseif snode2.y_centroid<snode1.minY
        label='below';
    else
        label='null';
    end
else
    boollean=0;
    label='null';
end
        