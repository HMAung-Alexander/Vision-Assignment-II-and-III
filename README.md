











 
# Assignment 2
## Image Enhancement
Image Enhancement is a method of transforming each pixel value of an image to desired values, for example the image can be darker, noisy, badly damaged. To regain its nearest originality, image transformation methods like Linear Transformation such as Negative Transformation, Logarithmic Transformation or Power Law Transformation can be applied to enhance the image quality. By mathematical equation, it can be described as

## s=T(r)  or g(x,y)=T[f(x,y)]  

Where ‘s’ or ‘g(x, y)’ means output value of image, ‘r’ or f(x, y) means input value of image and ‘T’ stands for transformation function that maps each of input pixel value [f(x, y)] to each of output pixel value g[(x, y)].	In this case, g depends on values of f at (x, y) and T becomes the gray-level transformation (intensity or mapping) function.

## Negative Transformation
Negative Transformation is one of the Linear Transformation method of which transforming each value of input image’s pixel by inverting with identity transformation. In negative transform, each input pixel value is subtracted [0, L-1] {where L means image-bits value} and mapped onto output image. For some cases like an image where darker area is needed to enhance as lighter area in order to detect dominant part of image, reversing an image intensity values will be the best choice. By mathematical expression
## s=(L-1)-r
According to Matlab Code, it can be written as below;
### I = imread('glass.png');
### y = 255: -1 :0;
### I_neg = uint8(y(I+1));%%Turning image into unit 8bits integer
### figure ;subplot(1,3,1);plot(y);title('Transformation Function');xlim([0 255]);ylim([0 255]);
### subplot(1,3,2);imshow(I);title('Original Image');
### subplot(1,3,3);imshow(I_neg);title('Negative Image');




## Logarithmic Transformation
Logarithmic transform plays as important role of image enhancement in which image pixel values which are higher than in a range of 0 to 1.5x106 Fourier spectrum(which are dominant in 8bit pixel value image with incorrect pixel values) must be compressed down so that image can be displayed with right pixel values. In mathematical explanation 
## s=c log⁡(1+r)
Where ‘c’ is a constant, and it is assumed as ‘r≥0’.
With Matlab code:
### x=0:255; c=255/log(256);%Q(i,j)=c log(1+|P(i,j)|) 
### y=c*log(x+1);
### title('Log Mapping Function') , axis tight , axis square
### I = imread('cameraman.tif');
### I_log = uint8(y(I+1));
### figure ,subplot(1,3,1),plot(y),title('Logarithmic Transformation Function');xlim([0,255]),ylim([0,255]);
### subplot(1,3,2),imshow(I),title('Original Image');
### subplot(1,3,3),imshow(I_log),title('Adjusted Image');






## Power-Law Transformation
Power-Law Transformation is one of the most important image enhancement methods after digital images for commercial purposes are used on internet. In this method, gamma correction (γ) is the main key role that plays the image’s brightness and darkness. Gamma correction(γ) is so important that if an image is needed to display accurately onto digital screen, it is needed to be corrected so that it won’t happen bleached-out images or too-dark images. Trying to re-arrange the color correction also requires the knowledge of gamma correction (γ) because varying the gamma value (γ) increases not only brightness but also the ratios of RGB values. Gamma of less than 1(much brighter) will result the opposite effect of Gamma which is greater than 1(much darker).But if gamma is less than 0, it turns out the image turned into negative effect. Power-Law equation can be represented as
## s=c r^γ
Where ‘c’ and ‘γ’ are constant values.
With Matlab code,
### I = imread('cameraman.tif');
### imd= double(I);
### [m,n] = size(imd);
### gamma = 0.7;
### out = abs(1*(imd).^gamma);
### maxm = max(out(:));
### minm = min(out(:));
### for i=1:m
###     for j=1:n
###         out(i,j)= (255*out(i,j))/(maxm-minm) ;
###     end
### end
### out = uint8(out);
### figure(1);
### set(gcf , 'Position' ,get(0,'Screensize'));
### subplot(121),imshow(I),title('Original Img');
### subplot(122),imshow(out),title('Power Law transform');




## Fourier Transform
Fourier Transform is an important in image processing which decomposes an image from its spatial domain into sine and cosine of its frequency domain. Each pixel points from Fourier Frequency Domain also represent a particular frequency inside spatial domain. It is applied in applications like reconstructing a damaged images or filtering a noisy images, analyzing images or compressing etc,. In digital method, discrete Fourier Transform (DFT) is mostly focused for above applications. 
In Matlab application, Fourier Transform can be applied by using fft( ) function which means Fast Fourier Transform as follow :
### I= imread('cameraman.tif');
### [r,c] = size(I);
### for i = 1:r;
###     X(i,:)=fft(I(i,:));%calculate fourier analysis of each column
### end
### for j = 1:c;
###     Y(:,j)=fft(X(:,j));%calculate fourier analysis of each row
### end
### M=Y;
### M = fftshift(M);%shift low frequency to centre
### Ab = abs(M);%Magnitude 
### Ab = ( Ab - min(min(Ab)))./(max(max(Ab))).*255;%Normalized to display magnitude
### subplot(1,3,2),imshow(I),title('Original Image');
### subplot(1,3,3),imshow(Ab),title('Fourier Transform');
### subplot(1,3,1),plot(Ab);,title('Fourier Transformation Function');xlim([0,255]),ylim([0,255]);


 
……………………………………………The End……………………………………………


# Assignment 3
## Difference between Histogram Equalization & Contrast Stretching
Contrast Stretching: It is based on Piecewise linear function which can improve image quality that is being damaged or making wrong setting of lens aperture during image acquisition or lack of dynamic range in image sensor. The idea is to increase gray level of an image being damaged and to measure ‘range’ of an image i.e. how spread its intensities are.
Histogram Equalization:  It is a method that enhances image quality through its histogram which is a usable data type of an image. By adjusting, intensity can be better distributed through image histogram. For example, an image can be very bright or very dark to see its objective, it is needed to do histogram equalization and adjust its image intensity to regain the objective. Such technique is very useful in X-ray reading or photography. In theory, if histogram equalization function is known, the original histogram can be recovered. The objective of this technique is to give a linear trend to the cumulative probability function associated to the image (source: sci.utah.edu). 
## Main Difference: 
Contrast stretching is working like a mapping. It maps the intensity of minimum value and maximum value with respect to image bit quality, the rest of pixel values are also taken as nearest max and min values. While Histogram Equalization works like deriving an image value through transformation function from Probability Density Function (PDF) of given image. However if histogram equalization is performed, the original image will not be getting back.
In Matlab, we can see the difference of Histogram Equalization and Contrast Stretching 
  
## Removing Salt and Pepper Noise using Median Filter
Noises on images can be happened according to its Film Grain noise if it is taken with physical Film, digital noises because of CCD detector, and electronic transmission of an image data. To filter these noises, Linear Filter, Median & Mean Filter and Adaptive Filter can be applied to maintain its original image. However, in this section, Median Filter and Mean Filter will be mainly focused for removing noises. 
## Median Filter:
It is a non-linear digital filtering method which is used to remove noise from an image signal (source: Wiki). The idea is not only to remove noises; also it can filter and improve the image quality for edge detection. However, the value of the output pixel is depended on its neighboring pixels. That’s why it is better to remove outlines of image without reducing image sharpness. In this progress, 2D-Median Filter method will be mainly focused.
## Mean Filter: 
It is a simple sliding-window spatial filter that replaces center values by dividing the sum of all pixel values in nth dimension. The purpose is to get smoothing image i.e. reducing the amount of intensity variation between one pixel and next and also to remove noises from image.
In Matlab, Image Noises can be filtered through 2D-Median filter and mean filter through;
### I = imread('cameraman.tif');
### isp = imnoise(I ,'salt & pepper',0.1);
### a = fspecial('average');
### a1 = filter2(a,isp);
### %%%Image Filtering with 2D-median filter
### med = medfilt2 (isp);
### %%%Image Filtering with mean filter
### I = imread('cameraman.tif');
### mf = ones(3,3)/9;
### mf = imfilter(I,mf);
### subplot(1,4,1) ; imshow(I) ; title('Original Image');
### subplot(1,4,2) ; imshow(isp) ; title('Noisy Image');
### subplot(1,4,3) ; imshow(med) ; title('2D Median Filter Image');
### subplot(1,4,4) ; imshow(mf); title('Mean Filter 3x3 image');


 
## Image Sharpening With Laplacian Filter
Laplacian filter is mostly applied in image which has 2D dimensional matrix, a second-order derivatives for image enhancement. In practical, it applies the image highlights regions of rapid color intensity changes corner so that it is mostly used in edge detection (zero crossing image detection).
In Matlab:
### y = imread('cameraman.tif');
### lab = [0 1 0;1 -4 1;0 1 0];
### result= uint8(filter2(lab,y,'same'));
### sharp = imsubtract(y,result);
### subplot(1,2,1);
### imshow(y);
### title('Original Image');
### subplot(1,2,2);
### imshow(sharp);
### title('sharp image');

 
……………………………………………The End……………………………………………
