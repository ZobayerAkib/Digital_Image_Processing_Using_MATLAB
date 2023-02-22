%Step 1:
img = imread('Image1.jpg');
figure
subplot (2,4,1)
imshow(img);
title('Figure(a)');

%Step 2:
img2=im2double(img);
Laplacian=[0 1 0; 1 -4 1; 0 1 0];
img2=conv2(img2, Laplacian, 'same');
subplot (2,4,2);
imshow(img2,[]);
title('Figure(b)');

%Step 3:
img3=im2double(img);
Laplacian=[0 -1 0; -1 4 1; 0 -1 0];
img3=conv2(img3, Laplacian, 'same');
img3 = imadd(uint8(img),uint8(img3));
subplot (2,4,3);
imshow(img3,[]);
title('Figure(c)');

%Step 4:
img4 = double(img);
filtered_image = zeros(size(img4));
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [-1 -2 -1; 0 0 0; 1 2 1];
 
for i = 1:size(img4, 1) - 2
    for j = 1:size(img4, 2) - 2
        Gx = sum(sum(Mx.*img4(i:i+2, j:j+2)));
        Gy = sum(sum(My.*img4(i:i+2, j:j+2)));              
        filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);       
    end
end
img4 = uint8(filtered_image);
subplot (2,4,4);
imshow(img4,[]);
title('Figure(d)');

%Step 5:
[row, col] = size(img4);
img5 = img4;
for i = 1:row-4
   for j = 1:col-4 
       N = img4(i:i+4, j:j+4);
       t = mean(N(:));
       img5(i,j) = t;
   end
end
subplot (2,4,5);
imshow(img5);
title('Figure(e)');

%Step 6:
img6 = immultiply(im2double(img3),im2double(img5));
subplot (2,4,6);
imshow(img6);
title('Figure(f)');

%Step 7:
img7 = imadd(uint8(img),uint8(img6));
subplot (2,4,7);
imshow(img7);
title('Figure(g)');


%Step 8:
img=im2double(img);
[row,col]=size(img);
img8=zeros(row,col);
c=1;
gamma=0.5;
for i=1:row
    for j=1:col
        img8(i,j)=c*(img(i,j).^gamma);
    end
end
subplot (2,4,8);
imshow(img8);
title('Figure(h)');