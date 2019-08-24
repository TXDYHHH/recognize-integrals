function snode1=renew_childwall(snode)
len=size(snode,2);
for i=1:len
    if strcmp(snode(i).class,'non_scripted')

            snode(i).child.above.RmaxY=snode(i).topwall;
            snode(i).child.below.RminY=snode(i).bottonwall;
            snode(i).child.hor.RmaxX=snode(i).rightwall;
    elseif strcmp(snode(i).class,'open_bracket')

            snode(i).child.above.RmaxY=snode(i).topwall;
            snode(i).child.below.RminY=snode(i).bottonwall;
            snode(i).child.hor.RmaxX=snode(i).rightwall;
    elseif strcmp(snode(i).class,'root')
            snode(i).child.above.RmaxY=snode(i).topwall;
            snode(i).child.below.RminY=snode(i).bottonwall;
            snode(i).child.hor.RmaxX=snode(i).rightwall;
            snode(i).child.super.RmaxY=snode(i).topwall;
            snode(i).child.super.RmaxX=snode(i).rightwall;
            snode(i).child.subsc.RminY=snode(i).bottonwall;
            snode(i).child.subsc.RmaxX=snode(i).rightwall;    
    elseif strcmp(snode(i).class,'variable_range')
            snode(i).child.above.RmaxY=snode(i).topwall;
            snode(i).child.below.RminY=snode(i).bottonwall;
            snode(i).child.hor.RmaxX=snode(i).rightwall;
            snode(i).child.super.RmaxY=snode(i).topwall;
            snode(i).child.super.RmaxX=snode(i).rightwall;
            snode(i).child.subsc.RminY=snode(i).bottonwall;
            snode(i).child.subsc.RmaxX=snode(i).rightwall;    
            snode(i).child.tleft.RmaxY=snode(i).topwall;
            snode(i).child.tleft.RminX=snode(i).leftwall;        
            snode(i).child.bleft.RminY=snode(i).bottonwall;
            snode(i).child.bleft.RminX=snode(i).leftwall;

    elseif strcmp(snode(i).class,'ascender')        
            snode(i).child.above.RmaxY=snode(i).topwall;
            snode(i).child.below.RminY=snode(i).bottonwall;
            snode(i).child.hor.RmaxX=snode(i).rightwall;
            snode(i).child.super.RmaxY=snode(i).topwall;
            snode(i).child.super.RmaxX=snode(i).rightwall;
            snode(i).child.subsc.RminY=snode(i).bottonwall;
            snode(i).child.subsc.RmaxX=snode(i).rightwall;    


    elseif strcmp(snode(i).class,'desender')       
            snode(i).child.above.RmaxY=snode(i).topwall;
            snode(i).child.below.RminY=snode(i).bottonwall;
            snode(i).child.hor.RmaxX=snode(i).rightwall;
            snode(i).child.super.RmaxY=snode(i).topwall;
            snode(i).child.super.RmaxX=snode(i).rightwall;
            snode(i).child.subsc.RminY=snode(i).bottonwall;
            snode(i).child.subsc.RmaxX=snode(i).rightwall;    
    elseif strcmp(snode(i).class,'centerd')
            snode(i).child.above.RmaxY=snode(i).topwall;
            snode(i).child.below.RminY=snode(i).bottonwall;
            snode(i).child.hor.RmaxX=snode(i).rightwall;
            snode(i).child.super.RmaxY=snode(i).topwall;
            snode(i).child.super.RmaxX=snode(i).rightwall;
            snode(i).child.subsc.RminY=snode(i).bottonwall;
            snode(i).child.subsc.RmaxX=snode(i).rightwall;    
    end
end
snode1=snode;