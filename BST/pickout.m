function out=pickout(im,list)
    out=im(list(2):list(3),list(4):list(5));
    out(find(out~=list(6)))=0;
    out(find(out))=1;