function value = evaluateFunc(a,x,z,l)
  %  pause(1);  
  %  disp 'evaluating and pausing'
    temp = (x - a*z)/2;
    value = vectorNorm(temp)^2 + norm(z,1)*l;