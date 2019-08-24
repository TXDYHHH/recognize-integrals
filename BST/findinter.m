function connectarea=findinter(a)
[hang,lie]=size(a);
connectarea=zeros(hang,lie);
connectarea=double(~a);
stack=zeros(1,floor(hang*lie/5));
label=1;
for row1=2:hang-1
    for colomn1=2:lie-1
        if connectarea(row1,colomn1)==1
            label=label+1;
            len=size(find(stack),2)+1;
            pos=(colomn1-1)*hang+row1;
            connectarea(pos)=label;
            pos1=[pos-hang-1,pos-hang,pos-hang+1,pos-1,pos+1,pos+hang-1,pos+hang,pos+hang+1];
            for i=1:8
                if connectarea(pos1(i))==1
                    stack(len)=pos1(i);
                    len=len+1;
                end
            end
            while  ~isempty(find(stack))
                b=stack(size(find(stack),2));
                stack(size(find(stack),2))=0;
                connectarea(b)=label;
                len=size(find(stack),2)+1;
                pos=b;
                pos1=[pos-hang-1,pos-hang,pos-hang+1,pos-1,pos+1,pos+hang-1,pos+hang,pos+hang+1];
                for i=1:8
                    if connectarea(pos1(i))==1 && isempty(find(stack==pos1(i)))
                        stack(len)=pos1(i);
                        len=len+1;
                    end
                end                
            end
        end
    end
end