function out=preparelist(list,im)


%建立结构
len=size(list,1);
out(1:len)=struct;
c=1/3;
t=1/6;
%往原来的list里边添加maxX，maxY等属性
non_scripted=[37 38 39 40 48 49];
open_bracket=[43 47];
root=45;
variable_range=41;
ascender=[1 2 3 4 5 6 7 8 9 0 12 14 16 18 19 21 22 30];
desender=[17 26 27 35];
centerd=[11 13 15 20 23 24 25 28 29 31 32 33 34 36 42 44 46];
%添加NO.属性&已有属性的复制
for i=1:len
    out(i).NO=i;
    out(i).content=list(i,1);
    out(i).maxX=list(i,5);
    out(i).minX=list(i,4);
    out(i).maxY=-list(i,2)+1+size(im,1);
    out(i).minY=-list(i,3)+1+size(im,1);    
    out(i).leftwall=-1;
    out(i).rightwall=+inf;
    out(i).bottonwall=-1;
    out(i).topwall=+inf;
end
%一个字符一个字符的处理
for i=1:len
    list_i=list(i,:);
    im1=pickout(im,list_i);
    

    H=size(im1,1);
    W=size(im1,2);
    if ~isempty(find(non_scripted==out(i).content))
        out(i).class='non_scripted';
        out(i).y_centroid=1/2*H+out(i).minY;
        out(i).x_centroid=1/2*W+out(i).minX;
        out(i).below=H/2+out(i).minY;
        out(i).above=H/2+out(i).minY;
        out(i).subsc=[];
        out(i).super=[];
        out(i).child.above=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).above,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.below=struct('children',[],'RmaxY',out(i).below,'RminY',out(i).bottonwall,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.hor=struct('children',[],'RmaxY',out(i).maxY,'RminY',out(i).minY,'RminX',out(i).minX,'RmaxX',out(i).rightwall);
    elseif ~isempty(find(open_bracket==out(i).content))
        out(i).class='open_bracket';
        out(i).y_centroid=c*H+out(i).minY;
        out(i).x_centroid=1/2*W+out(i).minX;
        out(i).below=out(i).minY;
        out(i).above=out(i).maxY;
        out(i).subsc=[];
        out(i).super=[];
        out(i).child.above=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).maxY,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.below=struct('children',[],'RmaxY',out(i).minX,'RminY',out(i).bottonwall,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.hor=struct('children',[],'RmaxY',out(i).maxY,'RminY',out(i).minY,'RminX',out(i).minX,'RmaxX',out(i).rightwall);
    elseif ~isempty(find(root==out(i).content))
        out(i).class='root';
        out(i).y_centroid=c*H+out(i).minY;
        out(i).x_centroid=1/2*W+out(i).minX;
        out(i).below=out(i).minY;
        out(i).above=out(i).maxY;
        out(i).subsc=t*H+out(i).minY;
        out(i).super=H-t*H+out(i).minY;
        out(i).child.above=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).maxY,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.below=struct('children',[],'RmaxY',out(i).minY,'RminY',out(i).bottonwall,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.hor=struct('children',[],'RmaxY',out(i).super,'RminY',out(i).subsc,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
        out(i).child.super=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).super,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
        out(i).child.subsc=struct('children',[],'RmaxY',out(i).subsc,'RminY',out(i).bottonwall,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
        out(i).child.contains=struct('children',[],'RmaxY',out(i).maxY,'RminY',out(i).minY,'RminX',out(i).minX,'RmaxX',out(i).maxX);
   
    
    elseif ~isempty(find(variable_range==out(i).content))
        out(i).class='variable_range';
        out(i).y_centroid=1/2*H+out(i).minY;
        out(i).x_centroid=1/2*W+out(i).minX;
        out(i).below=t*H+out(i).minY;
        out(i).above=H-t*H+out(i).minY;
        out(i).subsc=t*H+out(i).minY;
        out(i).super=H-t*H+out(i).minY;
        out(i).child.above=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).above,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.below=struct('children',[],'RmaxY',out(i).below,'RminY',out(i).bottonwall,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.hor=struct('children',[],'RmaxY',out(i).above,'RminY',out(i).below,'RminX',out(i).minX,'RmaxX',out(i).rightwall);
        out(i).child.super=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).super,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
        out(i).child.subsc=struct('children',[],'RmaxY',out(i).subsc,'RminY',out(i).bottonwall,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
        out(i).child.tleft=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).above,'RminX',out(i).leftwall,'RmaxX',out(i).minX);
        out(i).child.bleft=struct('children',[],'RmaxY',out(i).below,'RminY',out(i).bottonwall,'RminX',out(i).leftwall,'RmaxX',out(i).minX);
        
    elseif ~isempty(find(ascender==out(i).content))
        out(i).class='ascender';
        out(i).y_centroid=c*H+out(i).minY;
        out(i).x_centroid=1/2*W+out(i).minX;
        out(i).below=t*H+out(i).minY;
        out(i).above=H-t*H+out(i).minY;
        out(i).subsc=t*H+out(i).minY;
        out(i).super=H-t*H+out(i).minY;
        out(i).child.above=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).above,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.below=struct('children',[],'RmaxY',out(i).below,'RminY',out(i).bottonwall,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.hor=struct('children',[],'RmaxY',out(i).above,'RminY',out(i).below,'RminX',out(i).minX,'RmaxX',out(i).rightwall);
        out(i).child.super=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).super,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
        out(i).child.subsc=struct('children',[],'RmaxY',out(i).subsc,'RminY',out(i).bottonwall,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
    elseif ~isempty(find(desender==out(i).content))
        out(i).class='desender';
        out(i).y_centroid=H-c*H+out(i).minY;
        out(i).x_centroid=1/2*W+out(i).minX;
        out(i).below=H/2+t*H/2+out(i).minY;
        out(i).above=H-t*H/2+out(i).minY;
        out(i).subsc=H/2+t*H/2+out(i).minY;
        out(i).super=H-t*H/2+out(i).minY;
        out(i).child.above=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).above,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.below=struct('children',[],'RmaxY',out(i).below,'RminY',out(i).bottonwall,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.hor=struct('children',[],'RmaxY',out(i).above,'RminY',out(i).below,'RminX',out(i).minX,'RmaxX',out(i).rightwall);
        out(i).child.super=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).super,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
        out(i).child.subsc=struct('children',[],'RmaxY',out(i).subsc,'RminY',out(i).bottonwall,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
    elseif ~isempty(find(centerd==out(i).content))
        out(i).class='centerd';
        out(i).y_centroid=1/2*H+out(i).minY;
        out(i).x_centroid=1/2*W+out(i).minX;
        out(i).below=t*H+out(i).minY;
        out(i).above=H-t*H+out(i).minY;
        out(i).subsc=t*H+out(i).minY;
        out(i).super=H-t*H+out(i).minY;
        out(i).child.above=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).above,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.below=struct('children',[],'RmaxY',out(i).below,'RminY',out(i).bottonwall,'RminX',out(i).minX,'RmaxX',out(i).maxX);
        out(i).child.hor=struct('children',[],'RmaxY',out(i).above,'RminY',out(i).below,'RminX',out(i).minX,'RmaxX',out(i).rightwall);
        out(i).child.super=struct('children',[],'RmaxY',out(i).topwall,'RminY',out(i).super,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
        out(i).child.subsc=struct('children',[],'RmaxY',out(i).subsc,'RminY',out(i).bottonwall,'RminX',out(i).maxX,'RmaxX',out(i).rightwall);
    end
end
