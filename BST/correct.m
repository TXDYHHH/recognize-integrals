function listout1=correct(listout)
c=1/3;
t=1/6;
num=find([listout.content]==19);
flag=0;
dot=find([listout.content]==49);
del=[];

if ~isempty(num)
    for j=1:length(num)  
        i=1;
        for i=1:length(dot)
            if listout(dot(i)).y_centroid<listout(num(j)).maxY+(listout(num(j)).maxY-listout(num(j)).minY) && ...
                    listout(dot(i)).y_centroid>listout(num(j)).maxY && ...
                    listout(dot(i)).x_centroid<listout(num(j)).maxX && ...
                    listout(dot(i)).x_centroid>listout(num(j)).minX
                flag=1;
                listout(num(j)).maxY=listout(dot(i)).maxY;
                h=listout(num(j)).maxY-listout(num(j)).minY;
                listout(num(j)).y_centroid=c*h+listout(num(j)).minY;
                listout(num(j)).super=h-t*h+listout(num(j)).minY;
                listout(num(j)).subsc=t*h+listout(num(j)).minY;
                listout(num(j)).below=t*h+listout(num(j)).minY;
                listout(num(j)).above=h-t*h+listout(num(j)).minY;
                listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
                listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                del=[del dot(i)];
                break;
            end
        end
        if flag==0
            listout(num(j)).content = 2;
        end
        flag=0;
    end
end
listout(del)=[];
del=[];
flag=0;
num=find([listout.content]==2);
num1=find([listout.content]==1);
num2=find([listout.content]==22);
num=[num num1 num2];

kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)        
    for i=1:length(dot)
        if listout(dot(i)).y_centroid<listout(num(j)).maxY+(listout(num(j)).maxY-listout(num(j)).minY) && ...
                listout(dot(i)).y_centroid>listout(num(j)).maxY && ...
                listout(dot(i)).x_centroid<listout(num(j)).maxX +1.5*kuan(j) && ...
                listout(dot(i)).x_centroid>listout(num(j)).minX -1.5*kuan(j)
            flag=1;
            listout(num(j)).maxY=listout(dot(i)).maxY;
            h=listout(num(j)).maxY-listout(num(j)).minY;
            listout(num(j)).y_centroid=c*h+listout(num(j)).minY;
            listout(num(j)).super=h-t*h+listout(num(j)).minY;
            listout(num(j)).subsc=t*h+listout(num(j)).minY;
            listout(num(j)).below=t*h+listout(num(j)).minY;
            listout(num(j)).above=h-t*h+listout(num(j)).minY;
            listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
            listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
            listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
            del=[del dot(i)];
            listout(num(j)).content=19;   
            break;
        end
    end
end
listout(del)=[];

%ÐÞ¸Ä¼õºÅºÍ·ÖÊýÏß

gao=[listout.maxY]-[listout.minY];
kuan=[listout.maxX]-[listout.minX];
num=find((kuan./gao)>=3);
flag=0;
for j=1:length(num)
    flag=0;
    if listout(num(j)).content==45 
        continue;
    end
    for i=1:size(listout,2)       
        if listout(i).minY< kuan(num(j))/2+listout(num(j)).minY && ...
                listout(i).minY> listout(num(j)).minY && ...
                listout(i).x_centroid> listout(num(j)).minX && ...
                listout(i).x_centroid< listout(num(j)).maxX
            listout(num(j)).content=40;        
            flag=1;            
            break;
        end
    end
    if flag==0
        listout(num(j)).content=38;
    end
    
end
%¾À´í1-¡·L
num=find([listout.content]==1);
for j=1:length(num)
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                (listout(i).content ==24 )                
            listout(num(j)).content=22;                  
            break;
        end
    end    
end
%¾À´ío
flag=0;
num=find([listout.content]==0);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    flag=0;
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                (listout(i).content ==29 || listout(i).content ==30 || listout(i).content ==17) || ...
                listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX  && ...
                listout(i).maxX > listout(num(j)).minX -kuan(j) && ...
                (listout(i).content ==22 || listout(i).content ==13 )
            listout(num(j)).class='centerd';
            listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
            listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
            listout(num(j)).below=t*H+listout(num(j)).minY;
            listout(num(j)).above=H-t*H+listout(num(j)).minY;
            listout(num(j)).subsc=t*H+listout(num(j)).minY;
            listout(num(j)).super=H-t*H+listout(num(j)).minY;
            listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
            listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
            listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).content=25;    
            flag=1;
            break;               
        end
        if flag==1
            break;
        end
    end    
end
%¾À´íc
num=find([listout.content]==43);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    flag=0;
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX && ...
                listout(i).maxX > listout(num(j)).minX-kuan(j) && ...
                (listout(i).content ==15 || listout(i).content ==29 || listout(i).content ==28) || ...
                listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                (listout(i).content ==25 || listout(i).content ==29 || listout(i).content ==13 || listout(i).content ==30)   
            listout(num(j)).class='centerd';
            listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
            listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
            listout(num(j)).below=t*H+listout(num(j)).minY;
            listout(num(j)).above=H-t*H+listout(num(j)).minY;
            listout(num(j)).subsc=t*H+listout(num(j)).minY;
            listout(num(j)).super=H-t*H+listout(num(j)).minY;
            listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
            listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
            listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).content=13;                
            break;        
        end       
    end                 
end

%¾À´íL->c
num=find([listout.content]==22);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                (listout(i).content ==30 || listout(i).content ==29 || listout(i).content ==25 || listout(i).content ==13 )   || ...
                listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX && ...
                listout(i).maxX > listout(num(j)).minX-kuan(j) && ...
                (listout(i).content ==15 || listout(i).content ==29 || listout(i).content ==13 || listout(i).content ==28)    
            listout(num(j)).class='centerd';
            listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;            
            listout(num(j)).content=13;    
            break;        
        end       
    end          
   
               
end
%¾À´í£¨
    
flag=0;
num=find([listout.content]==13);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)      
    flag=0;
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX && ...
                listout(i).maxX > listout(num(j)).minX-kuan(j) && ...
                (listout(i).content ==13 ||listout(i).content ==15 || listout(i).content ==29 || listout(i).content ==28)                
            flag=1;
            break;        
        end       
    end
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                (listout(i).content ==25 || listout(i).content ==29 || listout(i).content ==30)               
            flag=1;
            break;        
        end       
    end  
    if flag==0
        listout(num(j)).class='open_bracket';
        listout(num(j)).y_centroid=c*H+listout(num(j)).minY;
        listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
        listout(num(j)).below=listout(num(j)).minY;
        listout(num(j)).above=listout(num(j)).maxY;
        listout(num(j)).subsc=[];
        listout(num(j)).super=[];
        listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).maxY,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
        listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).minX,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
        listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).maxY,'RminY',listout(num(j)).minY,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
        listout(num(j)).content=43;    
    end
end
       
    %¾À´í3£¬5-¡·s
flag=0;
num=find([listout.content]==3);
num1=find([listout.content]==5);
num=[num num1];
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    flag=0;
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                (listout(i).content ==19 || listout(i).content ==13 || listout(i).content ==15)  || ...
                listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX  && ...
                listout(i).maxX > listout(num(j)).minX -kuan(j) && ...
                (listout(i).content ==13 || listout(i).content ==25 )
            listout(num(j)).class='centerd';
            listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
            listout(num(j)).content=29;    
            flag=1;
            break;               
        end
    end    
end


num=find([listout.content]==8);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    listout(num(j)).class='centerd';
    listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
    listout(num(j)).content=34;    
    flag=1;
         
end
%¾À´íh,m->n
num=find([listout.content]==23);
num1=find([listout.content]==18);
num=[num num1];
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX  && ...
                listout(i).maxX > listout(num(j)).minX -kuan(j) && ...
                (listout(i).content ==11 || listout(i).content ==19 || listout(i).content ==20 )
            listout(num(j)).content=24;    
            break;               
        end   
    end         
end
%¾À´íu->a
num=find([listout.content]==31);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX  && ...
                listout(i).maxX > listout(num(j)).minX -kuan(j) && ...
                (listout(i).content ==30  ) || ...
                listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                listout(i).content ==24
            listout(num(j)).content=11;    
            break;               
        end   
    end         
end


%¾À´íL->t
num=find([listout.content]==22);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                (listout(i).content ==11 )   || ...
                listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX && ...
                listout(i).maxX > listout(num(j)).minX-kuan(j) && ...
                (listout(i).content ==25 || listout(i).content ==13)    
            listout(num(j)).class='centerd';
            listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;            
            listout(num(j)).content=30;    
            break;        
        end       
    end                   
end
%sec
num=find([listout.content]==29);
num1=find([listout.content]==5);
num2=find([listout.content]==3);
num=[num num1 num2];
E=find([listout.content]==15);
E1=find([listout.content]==0);
E2=find([listout.content]==25);
E=[E E1 E2];
C=find([listout.content]==13);
C1=find([listout.content]==43);
C2=find([listout.content]==22);
C=[C C1 C2];
flag=0;
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    flag=0;
    for i=1:length(E)
        H1=listout(E(i)).maxY- listout(E(i)).minY;
        W1=listout(E(i)).maxX-listout(E(i)).minX;
        if listout(E(i)).y_centroid> listout(num(j)).minY && ...
                listout(E(i)).y_centroid< listout(num(j)).maxY && ...
                listout(E(i)).minX < listout(num(j)).maxX +1.5*W && ...
                listout(E(i)).minX > listout(num(j)).maxX 
            for k=1:length(C)
                H2=listout(C(k)).maxY- listout(C(k)).minY;
                W2=listout(C(k)).maxX-listout(C(k)).minX;
                if listout(C(k)).y_centroid> listout(E(i)).minY && ...
                    listout(C(k)).y_centroid< listout(E(i)).maxY && ...
                    listout(C(k)).minX < listout(E(i)).maxX +1.5*W1 && ...
                    listout(C(k)).minX > listout(E(i)).maxX 
                    if listout(num(j)).content~=29
                        listout(num(j)).class='centerd';
                        listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
                        listout(num(j)).content=29;   
                    end
                    if listout(E(i)).content~=15
                        listout(E(i)).class='centerd';
                        listout(E(i)).y_centroid=1/2*H1+listout(E(i)).minY;
                        listout(E(i)).content=15;   
                    end
                    if listout(C(k)).content~=13
                        listout(C(k)).class='centerd';
                        listout(C(k)).y_centroid=1/2*H2+listout(C(k)).minY;
                        listout(C(k)).x_centroid=1/2*W2+listout(C(k)).minX;
                        listout(C(k)).below=t*H2+listout(C(k)).minY;
                        listout(C(k)).above=H2-t*H2+listout(C(k)).minY;
                        listout(C(k)).subsc=t*H2+listout(C(k)).minY;
                        listout(C(k)).super=H2-t*H2+listout(C(k)).minY;
                        listout(C(k)).child.above=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).above,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.below=struct('children',[],'RmaxY',listout(C(k)).below,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.hor=struct('children',[],'RmaxY',listout(C(k)).above,'RminY',listout(C(k)).below,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.super=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).super,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.subsc=struct('children',[],'RmaxY',listout(C(k)).subsc,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).content=13;                  
                    end
                    flag=1;
                    break
                end                
            end
            if flag==1
                break;
            end
        end       
    end                   
end
%cos
num=find([listout.content]==22);
num1=find([listout.content]==13);
num2=find([listout.content]==43);
num=[num num1 num2];
E=find([listout.content]==25);
E1=find([listout.content]==0);
E=[E E1];
C=find([listout.content]==29);
C1=find([listout.content]==5);
C2=find([listout.content]==3);
C3=find([listout.content]==13);
C=[C C1 C2 C3];
flag=0;
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    flag=0;
    for i=1:length(E)
        H1=listout(E(i)).maxY- listout(E(i)).minY;
        W1=listout(E(i)).maxX-listout(E(i)).minX;
        if listout(E(i)).y_centroid> listout(num(j)).minY && ...
                listout(E(i)).y_centroid< listout(num(j)).maxY && ...
                listout(E(i)).minX < listout(num(j)).maxX +1.5*W && ...
                listout(E(i)).minX >= listout(num(j)).maxX 
            for k=1:length(C)
                H2=listout(C(k)).maxY- listout(C(k)).minY;
                W2=listout(C(k)).maxX-listout(C(k)).minX;
                if listout(C(k)).y_centroid> listout(E(i)).minY && ...
                    listout(C(k)).y_centroid< listout(E(i)).maxY && ...
                    listout(C(k)).minX < listout(E(i)).maxX +1.5*W1 && ...
                    listout(C(k)).minX > listout(E(i)).maxX 
                    if listout(num(j)).content~=13
                        listout(num(j)).class='centerd';
                        listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
                        listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
                        listout(num(j)).below=t*H+listout(num(j)).minY;
                        listout(num(j)).above=H-t*H+listout(num(j)).minY;
                        listout(num(j)).subsc=t*H+listout(num(j)).minY;
                        listout(num(j)).super=H-t*H+listout(num(j)).minY;
                        listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                        listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                        listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).content=13;             
                    end
                    if listout(E(i)).content~=25
                        listout(E(i)).class='centerd';
                        listout(E(i)).y_centroid=1/2*H1+listout(E(i)).minY;
                        listout(E(i)).content=25;   
                    end
                    if listout(C(k)).content~=29
                        listout(C(k)).class='centerd';
                        listout(C(k)).y_centroid=1/2*H2+listout(C(k)).minY;
                        listout(C(k)).x_centroid=1/2*W2+listout(C(k)).minX;
                        listout(C(k)).below=t*H2+listout(C(k)).minY;
                        listout(C(k)).above=H2-t*H2+listout(C(k)).minY;
                        listout(C(k)).subsc=t*H2+listout(C(k)).minY;
                        listout(C(k)).super=H2-t*H2+listout(C(k)).minY;
                        listout(C(k)).child.above=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).above,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.below=struct('children',[],'RmaxY',listout(C(k)).below,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.hor=struct('children',[],'RmaxY',listout(C(k)).above,'RminY',listout(C(k)).below,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.super=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).super,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.subsc=struct('children',[],'RmaxY',listout(C(k)).subsc,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).content=29;                  
                    end
                    flag=1;
                    break
                end                
            end
            if flag==1
                break;
            end
        end       
    end                   
end
%csc
num=find([listout.content]==22);
num1=find([listout.content]==13);
num2=find([listout.content]==43);
num=[num num1 num2];
E=find([listout.content]==29);
E1=find([listout.content]==5);
E2=find([listout.content]==3);
E=[E E1 E2];
C=find([listout.content]==22);
C1=find([listout.content]==13);
C2=find([listout.content]==43);
C=[C C1 C2];
flag=0;
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    flag=0;
    for i=1:length(E)
        H1=listout(E(i)).maxY- listout(E(i)).minY;
        W1=listout(E(i)).maxX-listout(E(i)).minX;
        if listout(E(i)).y_centroid> listout(num(j)).minY && ...
                listout(E(i)).y_centroid< listout(num(j)).maxY && ...
                listout(E(i)).minX < listout(num(j)).maxX +W && ...
                listout(E(i)).x_centroid > listout(num(j)).maxX 
            for k=1:length(C)
                H2=listout(C(k)).maxY- listout(C(k)).minY;
                W2=listout(C(k)).maxX-listout(C(k)).minX;
                if listout(C(k)).y_centroid> listout(E(i)).minY && ...
                    listout(C(k)).y_centroid< listout(E(i)).maxY && ...
                    listout(C(k)).minX < listout(E(i)).maxX +1.5*W1 && ...
                    listout(C(k)).minX > listout(E(i)).maxX 
                    if listout(num(j)).content~=13
                        listout(num(j)).class='centerd';
                        listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
                        listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
                        listout(num(j)).below=t*H+listout(num(j)).minY;
                        listout(num(j)).above=H-t*H+listout(num(j)).minY;
                        listout(num(j)).subsc=t*H+listout(num(j)).minY;
                        listout(num(j)).super=H-t*H+listout(num(j)).minY;
                        listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                        listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                        listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).content=13;             
                    end
                    if listout(E(i)).content~=29
                        listout(E(i)).class='centerd';
                        listout(E(i)).y_centroid=1/2*H1+listout(E(i)).minY;
                        listout(E(i)).content=29;   
                    end
                    if listout(C(k)).content~=13
                        listout(C(k)).class='centerd';
                        listout(C(k)).y_centroid=1/2*H+listout(C(k)).minY;
                        listout(C(k)).x_centroid=1/2*W+listout(C(k)).minX;
                        listout(C(k)).below=t*H+listout(C(k)).minY;
                        listout(C(k)).above=H-t*H+listout(C(k)).minY;
                        listout(C(k)).subsc=t*H+listout(C(k)).minY;
                        listout(C(k)).super=H-t*H+listout(C(k)).minY;
                        listout(C(k)).child.above=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).above,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.below=struct('children',[],'RmaxY',listout(C(k)).below,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.hor=struct('children',[],'RmaxY',listout(C(k)).above,'RminY',listout(C(k)).below,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.super=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).super,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.subsc=struct('children',[],'RmaxY',listout(C(k)).subsc,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).content=13;                             
                    end
                    flag=1;
                    break
                end                
            end
            if flag==1
                break;
            end
        end       
    end                   
end
%cot
num=find([listout.content]==22);
num1=find([listout.content]==13);
num2=find([listout.content]==43);
num=[num num1 num2];
E=find([listout.content]==0);
E1=find([listout.content]==25);
E=[E E1];
C=find([listout.content]==30);
C1=find([listout.content]==22);
C2=find([listout.content]==16);
C=[C C1 C2];
flag=0;
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    flag=0;
    for i=1:length(E)
        H1=listout(E(i)).maxY- listout(E(i)).minY;
        W1=listout(E(i)).maxX-listout(E(i)).minX;
        if listout(E(i)).y_centroid> listout(num(j)).minY && ...
                listout(E(i)).y_centroid< listout(num(j)).maxY && ...
                listout(E(i)).minX < listout(num(j)).maxX +1.5*W && ...
                listout(E(i)).minX > listout(num(j)).maxX 
            for k=1:length(C)
                H2=listout(C(k)).maxY- listout(C(k)).minY;
                W2=listout(C(k)).maxX-listout(C(k)).minX;
                if listout(C(k)).y_centroid> listout(E(i)).minY && ...
                    listout(C(k)).y_centroid< listout(E(i)).maxY && ...
                    listout(C(k)).minX < listout(E(i)).maxX +1.5*W1 && ...
                    listout(C(k)).minX > listout(E(i)).maxX 
                    if listout(num(j)).content~=13
                        listout(num(j)).class='centerd';
                        listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
                        listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
                        listout(num(j)).below=t*H+listout(num(j)).minY;
                        listout(num(j)).above=H-t*H+listout(num(j)).minY;
                        listout(num(j)).subsc=t*H+listout(num(j)).minY;
                        listout(num(j)).super=H-t*H+listout(num(j)).minY;
                        listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                        listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                        listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).content=13;             
                    end
                    if listout(E(i)).content~=25
                        listout(E(i)).class='centerd';
                        listout(E(i)).y_centroid=1/2*H1+listout(E(i)).minY;
                        listout(E(i)).content=25;   
                    end
                    if listout(C(k)).content~=30
                        listout(C(k)).class='ascender';
                        listout(C(k)).y_centroid=c*H2+listout(C(k)).minY;
                        listout(C(k)).content=30;                  
                    end
                    flag=1;
                    break
                end                
            end
            if flag==1
                break;
            end
        end       
    end                   
end
%tan
num=find([listout.content]==30);
num1=find([listout.content]==16);
num2=find([listout.content]==37);
num=[num num1 num2];
E=find([listout.content]==11);
E1=find([listout.content]==0);
E=[E E1];
C=find([listout.content]==24);
C1=find([listout.content]==23);
C3=find([listout.content]==46);
C=[C C1 C3];
flag=0;
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    flag=0;
    for i=1:length(E)
        H1=listout(E(i)).maxY- listout(E(i)).minY;
        W1=listout(E(i)).maxX-listout(E(i)).minX;
        if listout(E(i)).y_centroid> listout(num(j)).minY && ...
                listout(E(i)).y_centroid< listout(num(j)).maxY && ...
                listout(E(i)).minX < listout(num(j)).maxX +1.5*W && ...
                listout(E(i)).minX > listout(num(j)).maxX 
            for k=1:length(C)
                H2=listout(C(k)).maxY- listout(C(k)).minY;
                W2=listout(C(k)).maxX-listout(C(k)).minX;
                if listout(C(k)).y_centroid> listout(E(i)).minY && ...
                    listout(C(k)).y_centroid< listout(E(i)).maxY && ...
                    listout(C(k)).minX < listout(E(i)).maxX +1.5*W1 && ...
                    listout(C(k)).minX > listout(E(i)).maxX 
                    if listout(num(j)).content~=30
                        listout(num(j)).class='ascender';
                        listout(num(j)).y_centroid=c*H+listout(num(j)).minY;
                        listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
                        listout(num(j)).below=t*H+listout(num(j)).minY;
                        listout(num(j)).above=H-t*H+listout(num(j)).minY;
                        listout(num(j)).subsc=t*H+listout(num(j)).minY;
                        listout(num(j)).super=H-t*H+listout(num(j)).minY;
                        listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                        listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                        listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
                        listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);       
                        listout(num(j)).content=30;
                    end
                    if listout(E(i)).content~=11
                        listout(E(i)).class='centerd';
                        listout(E(i)).y_centroid=1/2*H1+listout(E(i)).minY;
                        listout(E(i)).content=11;   
                    end
                    if listout(C(k)).content~=24
                        listout(C(k)).class='centerd';
                        listout(C(k)).y_centroid=1/2*H2+listout(C(k)).minY;
                        listout(C(k)).x_centroid=1/2*W2+listout(C(k)).minX;
                        listout(C(k)).below=t*H2+listout(C(k)).minY;
                        listout(C(k)).above=H2-t*H2+listout(C(k)).minY;
                        listout(C(k)).subsc=t*H2+listout(C(k)).minY;
                        listout(C(k)).super=H2-t*H2+listout(C(k)).minY;
                        listout(C(k)).child.above=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).above,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.below=struct('children',[],'RmaxY',listout(C(k)).below,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.hor=struct('children',[],'RmaxY',listout(C(k)).above,'RminY',listout(C(k)).below,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.super=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).super,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.subsc=struct('children',[],'RmaxY',listout(C(k)).subsc,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).content=24;                         
                    end
                    flag=1;
                    break
                end                
            end
            if flag==1
                break;
            end
        end       
    end                   
end
%ln
num=find([listout.content]==22);
num1=find([listout.content]==43);
num=[num num1 ];
E=find([listout.content]==24);
flag=0;
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    flag=0;
    for i=1:length(E)
        H1=listout(E(i)).maxY- listout(E(i)).minY;
        W1=listout(E(i)).maxX-listout(E(i)).minX;
        if listout(num(j)).content~=22
            listout(num(j)).class='ascender';
            listout(num(j)).y_centroid=c*H+listout(num(j)).minY;
            listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
            listout(num(j)).below=t*H+listout(num(j)).minY;
            listout(num(j)).above=H-t*H+listout(num(j)).minY;
            listout(num(j)).subsc=t*H+listout(num(j)).minY;
            listout(num(j)).super=H-t*H+listout(num(j)).minY;
            listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
            listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
            listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
            listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);       
            listout(num(j)).content=22;
        end
        if listout(E(i)).content~=24
            listout(E(i)).class='centerd';
            listout(E(i)).y_centroid=1/2*H1+listout(E(i)).minY;
            listout(E(i)).content=24;   
        end
        if   flag==1;
            break   
        end
    end                   
end
%arc
num=find([listout.content]==11);
num1=find([listout.content]==0);
num=[num num1 ];
E=find([listout.content]==26);
E1=find([listout.content]==28);
E=[E E1];
C=find([listout.content]==22);
C1=find([listout.content]==13);
C2=find([listout.content]==43);
C=[C C1 C2];
flag=0;
for j=1:length(num)   
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    flag=0;
    for i=1:length(E)
        H1=listout(E(i)).maxY- listout(E(i)).minY;
        W1=listout(E(i)).maxX-listout(E(i)).minX;
        if listout(E(i)).y_centroid> listout(num(j)).minY && ...
                listout(E(i)).y_centroid< listout(num(j)).maxY && ...
                listout(E(i)).minX < listout(num(j)).maxX +1.5*W && ...
                listout(E(i)).minX > listout(num(j)).maxX 
            for k=1:length(C)
                H2=listout(C(k)).maxY- listout(C(k)).minY;
                W2=listout(C(k)).maxX-listout(C(k)).minX;
                if listout(C(k)).y_centroid> listout(E(i)).minY && ...
                    listout(C(k)).y_centroid< listout(E(i)).maxY && ...
                    listout(C(k)).minX < listout(E(i)).maxX +1.5*W1 && ...
                    listout(C(k)).minX > listout(E(i)).maxX 
                    if listout(num(j)).content~=11
                        listout(num(j)).class='centerd';
                        listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
                       listout(num(j)).content=11;
                    end
                    if listout(E(i)).content~=28
                        listout(E(i)).class='centerd';
                        listout(E(i)).y_centroid=1/2*H+listout(E(i)).minY;
                        listout(E(i)).x_centroid=1/2*W+listout(E(i)).minX;
                        listout(E(i)).below=t*H+listout(E(i)).minY;
                        listout(E(i)).above=H-t*H+listout(E(i)).minY;
                        listout(E(i)).subsc=t*H+listout(E(i)).minY;
                        listout(E(i)).super=H-t*H+listout(E(i)).minY;
                        listout(E(i)).child.above=struct('children',[],'RmaxY',listout(E(i)).topwall,'RminY',listout(E(i)).above,'RminX',listout(E(i)).minX,'RmaxX',listout(E(i)).maxX);
                        listout(E(i)).child.below=struct('children',[],'RmaxY',listout(E(i)).below,'RminY',listout(E(i)).bottonwall,'RminX',listout(E(i)).minX,'RmaxX',listout(E(i)).maxX);
                        listout(E(i)).child.hor=struct('children',[],'RmaxY',listout(E(i)).above,'RminY',listout(E(i)).below,'RminX',listout(E(i)).minX,'RmaxX',listout(E(i)).rightwall);
                        listout(E(i)).child.super=struct('children',[],'RmaxY',listout(E(i)).topwall,'RminY',listout(E(i)).super,'RminX',listout(E(i)).maxX,'RmaxX',listout(E(i)).rightwall);
                        listout(E(i)).child.subsc=struct('children',[],'RmaxY',listout(E(i)).subsc,'RminY',listout(E(i)).bottonwall,'RminX',listout(E(i)).maxX,'RmaxX',listout(E(i)).rightwall);
                        listout(E(i)).content=28;  
                    end
                    if listout(C(k)).content~=13
                        listout(C(k)).class='centerd';
                        listout(C(k)).y_centroid=1/2*H+listout(C(k)).minY;
                        listout(C(k)).x_centroid=1/2*W+listout(C(k)).minX;
                        listout(C(k)).below=t*H+listout(C(k)).minY;
                        listout(C(k)).above=H-t*H+listout(C(k)).minY;
                        listout(C(k)).subsc=t*H+listout(C(k)).minY;
                        listout(C(k)).super=H-t*H+listout(C(k)).minY;
                        listout(C(k)).child.above=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).above,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.below=struct('children',[],'RmaxY',listout(C(k)).below,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).maxX);
                        listout(C(k)).child.hor=struct('children',[],'RmaxY',listout(C(k)).above,'RminY',listout(C(k)).below,'RminX',listout(C(k)).minX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.super=struct('children',[],'RmaxY',listout(C(k)).topwall,'RminY',listout(C(k)).super,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).child.subsc=struct('children',[],'RmaxY',listout(C(k)).subsc,'RminY',listout(C(k)).bottonwall,'RminX',listout(C(k)).maxX,'RmaxX',listout(C(k)).rightwall);
                        listout(C(k)).content=13;                           
                    end
                    flag=1;
                    break
                end                
            end
            if flag==1
                break;
            end
        end       
    end                   
end
%)->2
num=find([listout.content]==44);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    if isempty(find([listout.content]==43))
        listout(num(j)).content=2;
        listout(num(j)).class='ascender';
        listout(num(j)).y_centroid=c*H+listout(num(j)).minY;
        listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
        listout(num(j)).below=t*H+listout(num(j)).minY;
        listout(num(j)).above=H-t*H+listout(num(j)).minY;
        listout(num(j)).subsc=t*H+listout(num(j)).minY;
        listout(num(j)).super=H-t*H+listout(num(j)).minY;
        listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
        listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
        listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).above,'RminY',listout(num(j)).below,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
        listout(num(j)).child.super=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).super,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
        listout(num(j)).child.subsc=struct('children',[],'RmaxY',listout(num(j)).subsc,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).maxX,'RmaxX',listout(num(j)).rightwall);
    end                 
end
num=find([listout.content]==29);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    flag=0;
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX +2*kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX && ...
                (listout(i).content ==19 || listout(i).content ==13 || listout(i).content ==15)  || ...
                listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX  && ...
                listout(i).maxX > listout(num(j)).minX -kuan(j) && ...
                (listout(i).content ==13 || listout(i).content ==25 )             
            flag=1;
            break;               
        end
    end
    if flag==0
        listout(num(j)).class='ascender';
        listout(num(j)).y_centroid=c*H+listout(num(j)).minY;
        listout(num(j)).content=5;
    end
    
end

 %¾À´í4->+
flag=0;
num=find([listout.content]==4);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    flag=0;
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX && ...
                listout(i).maxX > listout(num(j)).minX -2*kuan(j) && ...
                listout(i).content <37    && ...
                listout(i).content >10
                listout(num(j)).class='non_scripted';
                listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
                listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
                listout(num(j)).below=H/2+listout(num(j)).minY;
                listout(num(j)).above=H/2+listout(num(j)).minY;
                listout(num(j)).subsc=[];
                listout(num(j)).super=[];
                listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
                listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).maxY,'RminY',listout(num(j)).minY,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
                listout(num(j)).content=37;          
                break;               
        end
        
    end    
end
%t->+
flag=0;
num=find([listout.content]==30);
kuan=[listout(num).maxX]-[listout(num).minX];
for j=1:length(num)   
    flag=0;
    H=listout(num(j)).maxY- listout(num(j)).minY;
    W=listout(num(j)).maxX-listout(num(j)).minX;
    for i=1:size(listout,2)       
        if listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).maxX < listout(num(j)).minX && ...
                listout(i).maxX > listout(num(j)).minX -2*kuan(j) && ...
                listout(i).content == 25    ||  ...
                listout(i).y_centroid> listout(num(j)).minY && ...
                listout(i).y_centroid< listout(num(j)).maxY && ...
                listout(i).minX < listout(num(j)).maxX + 2*kuan(j) && ...
                listout(i).minX > listout(num(j)).maxX  && ...
                listout(i).content == 11
            flag=1;
            break;
        end
    end
    if flag==0
        listout(num(j)).class='non_scripted';
        listout(num(j)).y_centroid=1/2*H+listout(num(j)).minY;
        listout(num(j)).x_centroid=1/2*W+listout(num(j)).minX;
        listout(num(j)).below=H/2+listout(num(j)).minY;
        listout(num(j)).above=H/2+listout(num(j)).minY;
        listout(num(j)).subsc=[];
        listout(num(j)).super=[];
        listout(num(j)).child.above=struct('children',[],'RmaxY',listout(num(j)).topwall,'RminY',listout(num(j)).above,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
        listout(num(j)).child.below=struct('children',[],'RmaxY',listout(num(j)).below,'RminY',listout(num(j)).bottonwall,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).maxX);
        listout(num(j)).child.hor=struct('children',[],'RmaxY',listout(num(j)).maxY,'RminY',listout(num(j)).minY,'RminX',listout(num(j)).minX,'RmaxX',listout(num(j)).rightwall);
        listout(num(j)).content=37;                  
    end  
end
listout1=listout;