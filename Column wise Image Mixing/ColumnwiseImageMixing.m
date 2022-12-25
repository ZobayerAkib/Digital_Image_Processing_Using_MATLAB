img1 = imread('input1.png');
img2 = imread('input2.jpeg');

No_of_Column = 5; %odd id
newsize = No_of_Column * 100;
img1 = imresize(img1, [newsize newsize]);
img2 = imresize(img2, [newsize newsize]);

%% Display the two input Images
figure;
imshow(img1);
figure;
imshow(img2);

%% Display the New Image
outputImg = img1;
for i = 2 : 2 : No_of_Column
    outputImg(:, 100 * (i - 1) + 1 : 100 * i, :) = img2(:, 100 * (i - 1) + 1 : 100 * i, :);
end

figure;
imshow(outputImg);
%% Save the New Image
imwrite(outputImg, 'output.jpg');