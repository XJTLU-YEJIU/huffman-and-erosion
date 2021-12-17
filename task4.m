I = imread("TI_NEW.bmp");
SE = imread('SE_I_NEW.bmp');
SE_O = imread("SE_I.bmp");
J = imerode(I,SE);
%subplot(1,2,1),imshow(J);
%title('First Erosion');
inver_I = imcomplement(I);
inver_SE = imcomplement(SE);
J_sec = imerode(inver_I,inver_SE);
%subplot(1,2,2),imshow(J_sec);
%title('Second Erosion');
%figure,imshow(RRE);
new_SE = imerode(SE,SE_O);
subplot(1,2,1),imshow(new_SE);
title('First Erosion');
new_SSEE = imerode(SE,new_SE);
subplot(1,2,2),imshow(new_SSEE);
title('Second Erosion');
a = imerode(I,new_SSEE);
figure,subplot(1,2,1),imshow(a);
subplot(1,2,2),imshow(J_sec);
b = a & J_sec;
figure,imshow(b);


