function list=part(connectarea)

i=2;
[hang,lie]=size(connectarea);
list=zeros(max(max(connectarea))-1,6);
a=find(connectarea==i);
j=1;
while ~isempty(a)
    if length(a)<=7
        i=i+1;
        a=find(connectarea==i);
        continue;
    end
    b=zeros(size(a,1),2);
    b(:,1)=mod(a,hang);
    pos=find(b(:,1)==0);
    b(pos)=hang;
    b(:,2)=ceil(a./hang);
    left=min(b(:,2));
    right=max(b(:,2));
    up=min(b(:,1));
    down=max(b(:,1));
    list(j,:)=[ j up down left right i];
    
    j=j+1;
    i=i+1;
    a=find(connectarea==i);
end
pos=find(list(:,1)==0);
list(pos,:)=[];

    

