function [w ,time] = generate_psibar(y,cnt,dim,lambda)
    % psi = sparse(dctmtx(dim));             % psi is matrix representation of DCT
     psi = sparse(eye(dim));

    % Now our aim is to make psibar as given in paper , so we need I1 and I2
    %to get I1 = [psi' psi' ... psi']^T
    psi = psi';                     
    I1 = [];
    for i=1:cnt
        I1 = vertcat(I1,psi);
        I1 = sparse(I1);
    end

    % to make diagonal matrix I2
    I2 = psi;
    for i=1:cnt-1
        I2 = sparse(blkdiag(I2,psi));
    end
    I2 = sparse(I2);
    psibar = [I1 I2];
%
 psibar = sparse(psibar);
  %  disp 'calling ssf'
   % pause(4);
   tic;
   W = ssf(psibar,y,lambda);
  time =  toc;
%     length(find(W ~= 0))
%    norm(W)
%    pause;
   % W = l1_l2_optimization(psibar,y,lambda);
%     tic;
%    W = GPSR_BB(y,psibar,lambda);
%    time = toc;
%    length(find(W ~= 0))
%    norm(W)
%    pause;
     I2 = blkdiag(I2,psi);
%    W = ssf(psibar,y,lambda);
%   time =  toc;
    w = I2*W;