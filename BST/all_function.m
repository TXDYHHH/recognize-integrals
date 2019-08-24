im=imread('testbst.bmp');
im=cut_small(im);
im=add_frame(im);
connectarea=findinter(im);
list=part(connectarea);
list(:,6)=list(:,1);
list(:,6)=list(:,6)+ones(size(list,1),1);
list(:,1)=[14;41;44;34;43;34;34;2;37];

global listout;
listout=preparelist(list,connectarea);
bst=buildBST;