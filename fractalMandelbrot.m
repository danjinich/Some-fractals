function retval = fractalMandelbrot (xmin, xmax, ymin, ymax)
  f=@(z,tau) z^2-tau;
  colscale=128;
  n=600;
  its=40;
  tol=1.0e2;
  colormap(gray(colscale))
  
  difx=xmax-xmin;
  dify=ymax-ymin;
  
  X=zeros(n,n);
  
  for k=1:n+1
    for l=1:n+1
      x=xmin+difx*(k-1)/n;
      y=ymin+dify*(l-1)/n;
      tau=x+j*y;
      z=f(0,tau);
      m=0;
      while norm(z)<tol && m<its
        z=f(z,tau);
        m=m+1;
      endwhile
      if norm(z)>tol || isinf(z) || isnan(z)
        X(l,k)=round(colscale*m/its);
      endif
    endfor
  endfor
  
  image(X)
  axis off
  colormap('default')
  
  #print -djpg [name ".jpg"]
  
  retval=true;
endfunction
