function total = weistrasFractal (xmin, xmax, its)
  
  x=linspace(xmin, xmax, its);
  y=zeros(its);
  a=rand;
  b=(1+3/2*pi)/a+rand;
  for i=1:its
    y(i)=F(x(i), a, b);
  endfor
  plot(x,y)
endfunction

function total = F (x, a, b)
  its=100;
  total=0;
  for n=0:its
    c=cos(b^n * pi *x);
    if abs(c)>1
      c=0;
    endif
    total=total+(a^n)*c;
   endfor
endfunction
