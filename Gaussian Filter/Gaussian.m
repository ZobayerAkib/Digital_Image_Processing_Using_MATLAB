I=imread('peppers_color.jpg');
I=rgb2gray(I);
sigma =input('Enter the value of GAMMA: ');

%Kernel Initialization
sum_k = 0;
Kernel = ones(5,5);
for i = 1:5
    for j= 1:5
        dist = (i-3)^2 + (j-3)^2;
        Kernel(i,j) = exp((-1*dist) / (2*sigma*sigma));
        sum_k = sum_k + Kernel(i,j);
    end
end
Kernel = Kernel/sum_k;

[row, col] = size(I);
outputImage = zeros(row,col);
%Add padding
padding= padarray(I, [2,2]);

%Gaussian Filter Applying
for i = 1: row
    for j= 1: col
        temp = double(padding(i:i+4, j:j+4));
        filter  = temp.*Kernel;
        outputImage(i,j) = sum(filter(:));
    end
end

outputImage = uint8(outputImage);

figure;
imwrite(I, 'InputImageBeforeFiltering.jpg');
imwrite(outputImage, 'OutputImageAfterFiltering.jpg');
subplot(1,2,1);
imshow(I);
title('Input Image before filtering');
subplot(1,2,2);
imshow(outputImage);
title('Output Image after filtering');

