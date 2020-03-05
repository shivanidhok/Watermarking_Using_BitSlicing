clc;clear;close all;
% Shivani Dhok
% Date: January 30, 2020
% Digital Image Processing
% Program for: Watermarking.
I = rgb2gray(imread('lena2.png'));

DispAll = 0;
[ICompressed_main I_bit_Compressed_main] = CompressBitSlicing_SGD(I,DispAll);

[numrows numcols] = size(I);
I_in_waterMark = rgb2gray(imread('fruit1.jpg'));

I_resized = imresize(I_in_waterMark,[numrows numcols]);
[ICompressed_water I_bit_Compressed_water] = CompressBitSlicing_SGD(I_resized,DispAll);

I_watermarked_binary = I_bit_Compressed_main;
I_watermarked_binary(:,:,end) = I_bit_Compressed_water(:,:,1);

I_watermarked = zeros(numrows,numcols);
for ii = 1:numrows
    for jj = 1:numcols
        I_watermarked(ii,jj) = Bin2Dec_SGD(reshape(I_watermarked_binary(ii,jj,:),[1 8]));
    end
end

I_watermarked = uint8(I_watermarked);
imshow(I_watermarked);
title('Watermarked Image');
[ICompressed I_bit_Compressed] = CompressBitSlicing_SGD(I_watermarked,1);
figure;
imshow(ICompressed)