I=im2double(imread('flower.jpg'));
I=rgb2gray(I);

figure;
imshow(I);

figure
subplot(2,3,2), imshow(I), title('Original Image');
subplot(2,3,5), imhist(I), title('Histogram of Original Image');
imwrite(I,'Original_Image.jpg');
saveas(gcf,'Histogram_of_Original_Image.jpg');

%Power Law Transformation
Y=input('Enter the value of GAMMA: ');%user input Y = 2.5
c = 1.56; %Given
S = c * (I .^Y); %Power Law Transformation
figure
subplot(2,3,2), imshow(S), title('Original Image after Power Law Transformation');
subplot(2,3,5), imhist(S), title('Histogram of Original Image after Power Law Transformation');
imwrite(S,'Original_Image_after_Power_Law_Transformation.jpg');
saveas(gcf,'Histogram_of_Original_Image_after_Power_Law_Transformation.jpg');

%Thresholding

image_thresholded = zeros(size(I));
A=200; %Given
for i=1:size(I,1)
    for j=1:size(I,2)
        % get pixel value
        pixel=I(i,j);
          % check pixel value and assign new value
          if pixel<A
              new_pixel=I(i,j)+(I(i,j)*0.50);
          else 
              new_pixel=I(i,j)-(I(i,j)*0.25);
          end
          % save new pixel value in thresholded image
          image_thresholded(i,j)=new_pixel;
     end
end
figure()
subplot(2,3,2)
imshow(image_thresholded)
title('thresholded image after thresholding')
subplot(2,3,5), imhist(image_thresholded), title('Histogram of thresholded image after thresholding');
imwrite(image_thresholded,'thresholded_image_after_thresholding.jpg');
saveas(gcf,'Histogram_of_thresholded_image_after_thresholding.jpg');

%Log Transformation

C=1.9; %given
s=C * log(1 + I);
figure()
subplot(2,3,2)
imshow(s)
title(' Image after log transformation')
subplot(2,3,5), imhist(s), title('Histogram of Image after log transformation');
imwrite(s,'Image_after_log_transformation.jpg');
saveas(gcf,'Histogram_of-Image_after_log_transformation.jpg');

%Negative Transformation

L=2^8;
negImg=(L-1)-I;
figure()
subplot(2,3,2)
imshow(s)
title(' Image after Negative transformation')
subplot(2,3,5), imhist(s), title('Histogram of Original Image after Negative transformation');
imwrite(s,'Image_after_Negative_transformation.jpg');
saveas(gcf,'Histogram_of_Image_after_Negative_transformation.jpg');



