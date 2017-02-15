function j = averaging_filter(I)
    J = I;
    y = size(I,1);
    x = size(I,2);
    
    for i = 2:y-1
        for j = 2:x-1
            
            J(i,j) = sum(sum(I(i-1:i+1,j-1:j+1)))/9;
        end
    end
    
    J = uint8(J);
    I = uint8(I);
   % imshow(J)
  %  figure,imshow(I) 
 %   figure,imshow(I-J)
    S = I-J+I-J+I;
    j = S;
%    figure,imshow(S)
   