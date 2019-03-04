clc ; clear ;close all;
%Negative Transform
% I = imread('glass.png');
% y = 255:-1:0;
% I_neg = uint8(y(I+1))
% figure ;subplot(1,3,1);plot(y);title('Transformation Function');xlim([0 255]);ylim([0 255]);
% subplot(1,3,2);imshow(I);title('Original Image');
% subplot(1,3,3);imshow(I_neg);title('Negative Image');
% % 

% %Logarithmic Transform 
% x=0:255; c=255/log(256);%Q(i,j)=c log(1+|P(i,j)|) 
% y=c*log(x+1);
% title('Log Mapping Function') , axis tight , axis square
% I = imread('cameraman.tif');
% I_log = uint8(y(I+1));
% figure ,subplot(1,3,1),plot(y),title('Logarithmic Transformation Function');xlim([0,255]),ylim([0,255]);
% subplot(1,3,2),imshow(I),title('Original Image');
% subplot(1,3,3),imshow(I_log),title('Adjusted Image');

% %Gamma adjust or Power Law Transformation
% I = imread('cameraman.tif');
% imd= double(I);
% [m,n] = size(imd);
% gamma = 1.7;
% out = abs(1*(imd).^gamma);
% maxm = max(out(:));
% minm = min(out(:));
% for i=1:m
%     for j=1:n
%         out(i,j)= (255*out(i,j))/(maxm-minm) ;
%     end
% end
% out = uint8(out);
% figure(1);
% set(gcf , 'Position' ,get(0,'Screensize'));
% subplot(121),imshow(I),title('Original Img');
% subplot(122),imshow(out),title('Power Law trasnform Gamma=1.7 ');

%Fourier Transform of 2-D signal
% I= imread('cameraman.tif');
% [r,c] = size(I);
% for i = 1:r;
%     X(i,:)=fft(I(i,:));%calculate fourier analysis of each column
% end
% for j = 1:c;
%     Y(:,j)=fft(X(:,j));%calculate fourier analysis of each row
% end
% M=Y;
% M = fftshift(M);%shift low frequency to centre
% Ab = abs(M);%Magnitude 
% Ab = ( Ab - min(min(Ab)))./(max(max(Ab))).*255;%Normalized to display magnitude
% subplot(1,3,2),imshow(I),title('Original Image');
% subplot(1,3,3),imshow(Ab),title('Fourier Transform');
% subplot(1,3,1),plot(Ab);,title('Fourier Transformation Function');xlim([0,255]),ylim([0,255]);



