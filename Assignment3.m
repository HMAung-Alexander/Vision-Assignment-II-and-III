clc ; clear;close all;
%%%%Image Sharpening with Laplacian Filter
y = imread('cameraman.tif');
lab = [0 1 0;1 -4 1;0 1 0];
result= uint8(filter2(lab,y,'same'));
sharp = imsubtract(y,result);
subplot(1,2,1);
imshow(y);
title('Original Image');
subplot(1,2,2);
imshow(sharp);
title('sharp image');

%%%%Median Filter removing salt and pepper noise
% I = imread('cameraman.tif');
% isp = imnoise(I ,'salt & pepper',0.1);
% a = fspecial('average');
% a1 = filter2(a,isp);
% %%%Image Filtering with 2D-median filter
% med = medfilt2 (isp);
% %%%Image Filtering with mean filter
% I = imread('cameraman.tif');
% mf = ones(3,3)/9;
% mf = imfilter(I,mf);
% subplot(1,4,1) ; imshow(I) ; title('Original Image');
% subplot(1,4,2) ; imshow(isp) ; title('Noisy Image');
% subplot(1,4,3) ; imshow(med) ; title('2D Median Filter Image');
% subplot(1,4,4) ; imshow(mf); title('Mean Filter 3x3 image');

%%%% Image Histogram equalization and Contract Stretching 
% I = imread('cameraman.tif');
% figure ; subplot(1,2,1);imshow(I);
% subplot(1,2,2);imhist(I);
% stretch = imadjust(I,[0.3,0.6],[0.0,1.0]);
% imh= histeq(I);
% figure;
% subplot(2,2,1);imshow(stretch);title('stretched');
% subplot(2,2,2);imhist(stretch);
% subplot(2,2,3);imshow(imh);title('histogram equalization');
% subplot(2,2,4);imhist(imh);
