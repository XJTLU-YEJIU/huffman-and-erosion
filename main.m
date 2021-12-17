%*************************************************************************%
%                               PRESENTATION

%Xi'An Jiaotong - Liverpool University
%Lecture :INT404 Assignment 3 
%Author: YE JIU
%*************************************************************************%
%%%%%Task 1
lenna = imread('lenna512.bmp');
sobel_horizontal = [-1 -2 -1;0 0 0;1 2 1];
sobel_vertical = [-1 0 1;-2 0 2;-1 0 1];
img_hor = conv2(lenna,sobel_horizontal,"full");
img_hor = uint8(abs(img_hor));
img_ver = conv2(lenna,sobel_vertical,'full');
img_ver = uint8(abs(img_ver));
subplot(1,3,1),imshow(img_hor);
title('sobel horizontal')
subplot(1,3,2),imshow(img_ver);
title('sobel vertical')
img_all = img_hor + img_ver;
subplot(1,3,3),imshow(img_all);
title('all edge')
%%%%%Task 2
% calculate entropy
f = [7 1 1 1 1 1 1 7;7 1 1 1 1 1 1 7;7 1 1 1 1 1 1 7;7 1 1 1 1 1 1 7
    7 1 1 1 1 1 1 7;7 2 2 1 1 0 0 7;7 4 4 5 5 0 0 7;7 4 4 4 4 4 4 7];
%%%%%%Huffman coding%%%%%%%%%%%%
[entropy,Ps] = calculate_entropy(f);
[h,t,len] = huffman(f);
Ps_sorted=sort(Ps,'descend');%
average_length = Ps_sorted * len';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Task 3 (1)%%%%
[img_dct,img_dct_merge] = compress(lenna);
figure,imshow(img_dct);
figure,imshow(img_dct_merge,[]);
figure,subplot(1,2,1),imshow(lenna);
title('Original Picture');
subplot(1,2,2),imshow(img_dct_merge,[]);
title('After merging Picture');
%%%%Task 3 (2)%%%%
[result] = quantize(img_dct);
figure,imshow(result);
title('After quantize');
%%%%%Task 3 (3)%%%
[new_img] = decompress(result);
figure,subplot(1,2,1),imshow(lenna);
title('Original Picture');
subplot(1,2,2),imshow(mat2gray(new_img));
title('After Decompress Picture');
%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task 4 please run task4.m
