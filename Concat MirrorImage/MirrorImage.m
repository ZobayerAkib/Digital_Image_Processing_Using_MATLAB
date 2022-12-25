img = imread('new.jpg');
figure;
imshow(img);

img2 = flip(img, 2); %mirror image logic
[row, col, dim] = size(img);
img2 = img;
for i = 1 : col
    img2(:, i, :) = img(:, end - i + 1, :);
end 

figure;
imshow(img2);

%%  Display the Required New Image
 outputImg = [img img2];
 
 figure;
 imshow(outputImg)
 %% Save the New Image
 imwrite(outputImg, 'outputImg.jpg');
