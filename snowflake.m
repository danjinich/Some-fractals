function retval = snowflake (its)
  length=1;
  theta=pi/3;
  p1=[0,0];
  p2=[length/2, length*sin(theta)];
  p3=[length, 0];
  
  fp=[p1;p2;p3];
  
  for index=1:its
    np=size(fp, 1);
    newp=zeros(np*3,2);
    for i=1:np;
      p=fp(i,:);
      if i==np
        v=fp(1,:)-fp(i,:);
      else
        v=fp(i+1,:)-fp(i,:);
      endif
      b1=p+1/3*v;
      b2=p+2/3*v;
      top=p+1/2*v+pVec(v)*length/3*sin(theta);
      newp(3*i-2:3*i,:)=[b1;top;b2];
    endfor
    fp(end+1:end+9,:)=zeros(9,2);
    newfp=zeros(np*3+np, 2);
    n=1;
    for i=1:np
      newfp(n,:)=fp(i,:);
      ind=3*i-2;
      newfp(n+1:n+3,:)=newp(ind:ind+2,:);
      n=n+4;
    endfor
    fp=newfp;
    length=length/3;;
  endfor
  
  plot(fp(:,1), fp(:,2),'k')
  hold on;
  plot([fp(1,1),fp(end,1)],[fp(1,2),fp(end,2)],'k')
  hold off;
  print -djpg "snowflake4.jpg"
endfunction


function retval = pVec (v)
  #regresa el vector perpendicular en 2 dimensiones
  retval(1)=-v(2);
  retval(2)=v(1);
  retval=retval/norm(retval);
endfunction
