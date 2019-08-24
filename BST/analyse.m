function s=analyse(list)
global listout;
global snode_x;
global attr;
s=[];
if isempty(list)
    s=num2str(1);
    return;
end
for i=1:length(listout)
    listout(i).flag=0;
end
snode_x=[];
fun={'sin','tan','cos','lg','log','log10','cot','sec','csc','asin','atan','acos'};
snode_list1=listout(list);
num=length(find([snode_list1.content]==14));
for i=1:num
    snode_x=[snode_x snode_list1(end).content];
    snode_list1(end)=[];
    snode_list1(end)=[];
    snode_list1(1)=[];
end
    
alphabet='abcdefghijklmnopqrstuvwxyz';
letter=11:36;
letter(ismember(letter,snode_x))=[];
letter(letter==15)=[];
flag_abs=1;
% x=snode_x;
% add_minor=[37 38];
% hor_line=40;
% pai=42;
% bracket=43;
% root=45;
% abs=47;
% tri_fun=60:71;
% number=72;
attr=cell(1,10);
attr{1}=letter;
attr{2}=snode_x;
attr{3}=[37 38 49];
attr{4}=40;
attr{5}=42;
attr{6}=43;
attr{7}=45;
attr{8}=47;
attr{9}=60:71;
attr{10}=72;
attr{11}=15;
attr{12}=44;
%syms x;
%先处理第一个元素
global sym_return;
sym_return=[];
content1=snode_list1(1).content;
if ismember(content1,attr{1})    
    symbol=alphabet(snode_list1(1).content-10);
    sym_return=[sym_return symbol];
    s1=analyse1(snode_list1(1).child.super.children);
    s=[symbol '^(' s1 ')'];
elseif ismember(content1,attr{2})
    s1=analyse1(snode_list1(1).child.super.children);
    s=[alphabet(content1-10) '^(' s1 ')'];
elseif ismember(content1,attr{3})
    if content1==37
        s='+';
    elseif content1==38
        s='-';
    end
elseif ismember(content1,attr{4})
    s1=analyse1(snode_list1(1).child.above.children);
    s2=analyse1(snode_list1(1).child.below.children);
    s=['(' s1 ')' '/' '(' s2 ')'];
elseif ismember(content1,attr{5})
    s='pi';
elseif ismember(content1,attr{6})
    list1=[snode_list1(2:length(snode_list1)).NO];
    s1=analyse1(list1);            
    s=[s '(' s1];
elseif ismember(content1,attr{7})
    s1=analyse1(snode_list1(1).child.contains.children);
    s=['sqrt(' s1 ')'];
elseif ismember(content1,attr{8})
    list1=[snode_list1(2:length(snode_list1)).NO];
    s1=analyse1(list1);
    s=['abs(' s1 ')'];
    flag_abs=flag_abs*(-1);
elseif ismember(content1,attr{9})
    s1=analyse1(snode_list1(1).child.super.children);
    pos=find([snode_list1.NO]==snode_list1(1).NO);
    for k=1:length(pos)
        snode_list1(pos(k)).flag=1;
    end  
    i=2;
    record=[];
    count9=0;
   while i<=size(snode_list1,2) 
        if snode_list1(i).flag==1
            i=i+1;
            continue;
        end
        if ismember(snode_list1(i).content,attr{2}) && ...
                count9==0
            record=[record snode_list1(i).NO];
            break;  
        elseif snode_list1(i).content==40  && ...               
                i+1<=size(snode_list1,2)   && ...
                count9==0
            record=[record snode_list1(i).NO];   
            if ismember(snode_list1(i+1).content,attr{2})
                record=[record snode_list1(i+1).NO];  
            end
            break;
        elseif snode_list1(i).content==43  
            count9=count9+1;
        elseif snode_list1(i).content==44  
            count9=count9-1; 
            if count9==0
                record=[record snode_list1(i).NO];  
                break;
            end
        elseif snode_list1(i).content==40  && ...               
                i+1<=size(snode_list1,2)   && ...
                count9==0 
            record=[record snode_list1(i).NO];
            if ismember(snode_list1(i+1).content,attr{2})
                record=[record snode_list1(i+1).NO];  
            end
            break;
        end           
        record=[record snode_list1(i).NO];
        i=i+1;
    end
    s2=analyse1(record);
    s=['(' fun{content1-59} '(' s2 '))^(' s1 ')'];
elseif ismember(content1,attr{10})
    s=num2str(snode_list1(1).number);
    s1=analyse1(snode_list1(1).child.super.children);
    s=[s '^(' s1 ')'];
elseif ismember(content1,attr{11})
    s1=analyse1(snode_list1(1).child.super.children);
    s=['exp(' s1 ')'];
end


%处理剩下的元素
for i=2:length(snode_list1)
    content1=snode_list1(i).content;
    content2=snode_list1(i-1).content;
    if listout(snode_list1(i).NO).flag==1
        continue;
    end
    listout(snode_list1(i).NO).flag=1;
    if ismember(content1,attr{1})
        symbol=alphabet(snode_list1(i).content-10);
        sym_return=[sym_return symbol];
        s1=analyse1(snode_list1(i).child.super.children);
        s2=[symbol '^(' s1 ')'];
        if ismember(content2,attr{3})
            s=[s s2];
        elseif ismember(content2,attr{1})
            s=[s '*' s2];
        elseif ismember(content2,attr{2})
            s=[s '*' s2];
        elseif ismember(content2,attr{4})
            s=[s '*' s2];
        elseif ismember(content2,attr{5})
            s=[s '*' s2];
        elseif ismember(content2,attr{12})
            s=[s '*' s2];
        elseif ismember(content2,attr{8})
            s=[s '*' s2];        
        elseif ismember(content2,attr{10})
            s=[s '*' s2]; 
        end
    elseif ismember(content1,attr{2})
        s1=analyse1(snode_list1(i).child.super.children);
        s1=[alphabet(content1-10) '^(' s1 ')'];
        if ismember(content2,attr{1})
            s=[s '*' s1];
        elseif ismember(content2,attr{2})
            s=[s '*' s1];
        elseif ismember(content2,attr{3})
            s=[s s1];
        elseif ismember(content2,attr{4})
            s=[s '*' s1];
        elseif ismember(content2,attr{5})
            s=[s '*' s1];
        elseif ismember(content2,attr{12})
            s=[s '*' s1];
        elseif ismember(content2,attr{7})
            s=[s '*' s1];
        elseif ismember(content2,attr{8})
            s=[s '*' s1];
                  
        elseif ismember(content2,attr{10})
            s=[s '*' s1];
        elseif ismember(content2,attr{11})
            s=[s '*' s1];
        end
    elseif ismember(content1,attr{3})
        if content1==37
                s=[s '+'];
        elseif content1==38
                s=[s '-'];
        elseif content1==49
            s=[s '*'];
        end
    elseif ismember(content1,attr{4})
        s1=analyse1(snode_list1(i).child.above.children);
        s1=['(' s1 ')'];
        s2=analyse1(snode_list1(i).child.below.children);
        s2=['(' s2 ')'];
        s3=[s1 '/' s2];
        if ismember(content2,attr{1})
            s=[s '*' s3];
        elseif ismember(content2,attr{2})
            s=[s '*' s3];
        elseif ismember(content2,attr{3})
            s=[s s3];
        elseif ismember(content2,attr{4})
            s=[s '*' s3];
        elseif ismember(content2,attr{5})
            s=[s '*' s3];
        elseif ismember(content2,attr{12})
            s=[s '*' s3];
        elseif ismember(content2,attr{7})
            s=[s '*' s3];
        elseif ismember(content2,attr{8})
            s=[s '*' s3];           
        elseif ismember(content2,attr{10})
            s=[s '*' 'x'];
        elseif ismember(content2,attr{11})
            s=[s '*' s3];
        end
    elseif ismember(content1,attr{5})        
        if ismember(content2,attr{1})
            s=[s '*' 'pi'];
        elseif ismember(content2,attr{2})
            s=[s '*' 'pi'];
        elseif ismember(content2,attr{3})
            s=[s 'pi'];
        elseif ismember(content2,attr{4})
            s=[s '*pi'];
        elseif ismember(content2,attr{5})
            s=[s '*pi'];
        elseif ismember(content2,attr{12})
            s=[s '*pi'];
        elseif ismember(content2,attr{7})
            s=[s '*' 'pi'];
        elseif ismember(content2,attr{8})
            s=[s '*pi'];                       
        elseif ismember(content2,attr{10})
            s=[s '*' 'pi'];
        elseif ismember(content2,attr{11})
            s=[s '*' 'pi'];
        end
    elseif ismember(content1,attr{6})
        list1=[snode_list1(i:length(snode_list1)).NO];
        s1=analyse1(list1);
        if ismember(content2,attr{1})
            s=[s '*' s1];
        elseif ismember(content2,attr{2})
            s=[s '*' s1];
        elseif ismember(content2,attr{3})
            s=[s  s1];
        elseif ismember(content2,attr{4})
            s=[s '*' s1];
        elseif ismember(content2,attr{5})
            s=[s '*' s1];
        elseif ismember(content2,attr{12})
            s=[s '*'  s1];
        elseif ismember(content2,attr{7})
            s=[s '*' s1];
        elseif ismember(content2,attr{8})
            s=[s  '*' s1];                       
        elseif ismember(content2,attr{10})
            s=[s '*' s1];
        elseif ismember(content2,attr{11})
            s=[s '*' s1];
        end
    elseif ismember(content1,attr{7})
        s1=analyse1(snode_list1(i).child.contains.children);
        s2=['sqrt(' s1 ')'];
        if ismember(content2,attr{1})
            s=[s '*' s2];
        elseif ismember(content2,attr{2})
            s=[s '*' s2];
        elseif ismember(content2,attr{3})
            s=[s s2];
        elseif ismember(content2,attr{4})
            s=[s '*' s2];
        elseif ismember(content2,attr{5})
            s=[s '*' s2];
        elseif ismember(content2,attr{12})
            s=[s '*' s2];
        elseif ismember(content2,attr{8})
            s=[s '*' s2];                       
        elseif ismember(content2,attr{10})
            s=[s '*' s2];
        elseif ismember(content2,attr{11})
            s=[s '*' s2];
        end
    elseif ismember(content1,attr{8})
        if flag_abs== -1
            return;
        else
            list1=[snode_list1(i:length(snode_list1)).NO];
            s1=analyse1(list1);
            s=['abs(' s1 ')'];
            flag_abs=flag_abs*(-1);
        end
    elseif ismember(content1,attr{9})
        s1=analyse1(snode_list1(i).child.super.children);
        pos1=find([snode_list1.NO]==snode_list1(i).NO);
        for k=1:length(pos1)
            snode_list1(pos1(k)).flag=1;
        end  
        j=i+1;
        record=[];
        count9=0;
        while j<=size(snode_list1,2) 
            if snode_list1(j).flag==1
                j=j+1;
                continue;
            end
            if ismember(snode_list1(j).content,attr{2}) && ...
                    count9==0
                record=[record snode_list1(j).NO];
                break;  
            elseif snode_list1(j).content==40  && ...               
                    j+1<=size(snode_list1,2)   && ...
                    count9==0
                record=[record snode_list1(j).NO];   
                if ismember(snode_list1(j+1).content,attr{2})
                    record=[record snode_list1(j+1).NO];  
                end
                break;
            elseif snode_list1(j).content==43  
                count9=count9+1;
                
            elseif snode_list1(j).content==44  
                count9=count9-1;
                
                if count9==0
                    record=[record snode_list1(j).NO];  
                    break;
                end
                
            elseif snode_list1(j).content==40  && ...               
                    j+1<=size(snode_list1,2)   && ...
                    count9==0 
                record=[record snode_list1(j).NO];
                if ismember(snode_list1(j+1).content,attr{2})
                    record=[record snode_list1(j+1).NO];  
                end
                break;
            end      
            record=[record snode_list1(j).NO];
            j=j+1;
        end
        s2=analyse1(record);        
        s3=['(' fun{content1-59} '(' s2 '))^(' s1 ')'];
        if ismember(content2,attr{1})
            s=[s '*' s3];
        elseif ismember(content2,attr{2})
            s=[s '*' s3];
        elseif ismember(content2,attr{3})
            s=[s s3];
        elseif ismember(content2,attr{4})
            s=[s '*' s3];
        elseif ismember(content2,attr{5})
            s=[s '*' s3];   
        elseif ismember(content2,attr{12})
            s=[s '*' s3];
        elseif ismember(content2,attr{8})
            s=[s '*' s3];                       
        elseif ismember(content2,attr{10})
            s=[s '*' s3];
        elseif ismember(content2,attr{11})
            s=[s '*' s3];
        end
    elseif ismember(content1,attr{10})
        s2=num2str(snode_list1(i).number);
        s1=analyse1(snode_list1(1).child.super.children);
        s2=[s2 '^(' s1 ')'];
        if ismember(content2,attr{3})
            s=[s s2];
        elseif ismember(content2,attr{4})
            s=[s '*' s2];
        elseif ismember(content2,attr{5})
            s=[s '*' s2];
        elseif ismember(content2,attr{12})
            s=[s '*' s2];
        elseif ismember(content2,attr{8})
            s=[s '*' s2];        
        end
    elseif ismember(content1,attr{11})
        s1=analyse1(snode_list1(i).child.super.children);
        s2=['exp(' s1 ')'];
        if ismember(content2,attr{1})
            s=[s '*' s2];
        elseif ismember(content2,attr{2})
            s=[s '*' s2];
        elseif ismember(content2,attr{3})
            s=[s s2];
        elseif ismember(content2,attr{4})
            s=[s '*' s2];
        elseif ismember(content2,attr{5})
            s=[s '*' s2];
        elseif ismember(content2,attr{12})
            s=[s '*' s2];
        elseif ismember(content2,attr{7})
            s=[s '*' s2];
        elseif ismember(content2,attr{8})
            s=[s '*' s2];
        elseif ismember(content2,attr{10})
            s=[s '*' s2];
        elseif ismember(content2,attr{11})
            s=[s '*' s2];
        end
    elseif ismember(content1,attr{12})
        s1=analyse1(snode_list1(i).child.super.children);
        s=[s ')^' '(' s1 ')'];
        return; 
    end
end

