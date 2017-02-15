for i=1:40000
    if(z(i) > 10)
        z1(i) = 255;
    else
        z1(i) = 0;
    end
end
subplot(2,2,1)
imshow(z)
subplot(2,2,2)
imshow(z1)
for k = 1:199
for i=1:40000
    cnt = 0;
    if(i-10 > 0)
    for tmp = 1:10
        if(z1(i-tmp) > 0)
            cnt = cnt + 1;
            break;
        end
    end
    end
    if(i+10 < 40000 )
    for tmp = 1:10
        if(z1(i+tmp) > 0)
            cnt = cnt + 1;
            break;
        end
    end
    end
    if(i+2000 < 40000)
    for tmp = 1:10
        if(z1(i+tmp*200) > 0)
            cnt = cnt + 1;
            break;
        end
    end
    end
    if(i-2000 > 0 )
    for tmp = 1:10
        if(z1(i-tmp*200) > 0)
            cnt = cnt + 1;
            break;
        end
    end
    end
    if(cnt > 2)
        z1(i) = 255;
    end
    
end
end

for i=1:40000
    if(zc(i) > 5)
        z2(i) = 255;
    else
        z2(i) = 0;
    end
end


subplot(2,2,3)
imshow(s)
subplot(2,2,4)
imshow(z1)

% subplot(2,2,4)
% imshow(z2);
% se = strel('rectangle',[3,3]);
% dilatedI = imdilate(z1,se);
% dilatedI = imdilate(dilatedI,se);
% dilatedI = imdilate(dilatedI,se);
% dilatedI = imdilate(dilatedI,se);
% dilatedI = imerode(dilatedI,se);
% dilatedI = imerode(dilatedI,se);

% subplot(2,2,4)
% imshow(dilatedI);
l = find(z1 > 0);