function renew_listout(list)
global listout;
len=size(list,2);
for i=1:len
    listout([listout.NO]==list(i).NO)=list(i);
end