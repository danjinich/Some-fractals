function [x1, y1] = dragonFractal (x, y, r)
  if r!=1
    v=[x;y];
    x_center=x(1);
    y_center=y(1);
    center = repmat([x_center; y_center], 1, length(x));
    theta=pi/2;
    R= [cos(theta) -sin(theta); sin(theta) cos(theta)];
    vo = R*(v - center) + center;

    x1=zeros(1,length(x)*2);
    y1=zeros(1,length(y)*2);
    
    for k=1:length(x)
      x1(k)=vo(1,length(x)+1-k);
      y1(k)=vo(2,length(x)+1-k);
    endfor
    for k=1+length(x):2*length(x)
      x1(k)=x(k-length(x));
      y1(k)=y(k-length(x));
    endfor
    [x1,y1]=dragonFractal(x1, y1, r-1);
  else
    plot(x,y);
    x1=x;
    y1=y;
    print -djpg "dragonFractal4.jpg"
  endif
endfunction
