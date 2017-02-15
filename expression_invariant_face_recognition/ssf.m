% f(x) = 0.5||x - Az||_2^2 + lambda||z||_1 
% here a = A, x = x, l = lambda
% the solution is given by
% S_lambda/c(A'/c(x - Az_o)+z_o) , where S is shrinkage function

function z_opt = ssf(a,x,l)
    
    z_opt = a'*x ;          % starting solution for iterative process
   % disp 'finding c'
  % c = max(eigs(a'*a)) ;     % eig of a'*a for dct matrix are all 1
   c = 35;
   % pause(4);
  %  disp 'found c'
  %  c = c + 2;              % c should be greater than max(eig(a'*a))
    l = l/c;                % lambda/c is captured by l/c
    i = 0;                  % for number of iteration
    while true
        v = (a'*(x - a*z_opt))/c + z_opt;
        old_val = evaluateFunc(a,x,z_opt,l);
      %  disp 'calling shrinkage'
        z_opt = shrinkage(v,l);
        i = i+1;
        if(i > 1)
            val = evaluateFunc(a,x,z_opt,l);
            if(old_val - val < 0)
               % disp 'algorithm is diverging';
                break;
            else if((old_val - val < 0.001 ) & (old_val - val >= 0))
                %    disp 'algorithm has converged sufficiently';
                    break;
                end
            end
        end
    end
end
        
        
        
        