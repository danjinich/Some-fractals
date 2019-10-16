function retval = cantorSet (n)
  plot([0,1],[1,1], 'lineWidth', 30)
  hold on
  cantorSetAux(0, 1/3, 2, n-1)
  cantorSetAux(2/3, 1, 2, n-1)
  hold off
  print -djpg "Cantor.jpg"
endfunction

function retvaal = cantorSetAux(a, b, y, n)
  if y<=n
    plot([a,b], [y,y], 'lineWidth', 30)
    d=(b-a)/3;
    cantorSetAux(a, a+d, y+1, n)
    cantorSetAux(b-d, b, y+1, n)
  endif
endfunction
