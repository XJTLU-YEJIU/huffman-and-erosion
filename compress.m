function[img_dct,img_dct_merge] = compress(im)
[row,col] = size(im);
img_dct = zeros(row, col); 
for i=1:8:row-7
    for j=1:8:col-7
        img_block = im(i:i+7, j:j+7);
        dct_block = dct2(img_block); 
        % imshow(dct_block); 
        img_dct(i:i+7, j:j+7) = dct_block;
    end
end
%figure, imshow(img_dct); %
img_dct_merge = zeros(row/8,col/8);
% img_dct = round(img_dct);
% 
for i = 1:8:row
    for j = 1:8:col
        img_dct_merge((i+7)/8,(j+7)/8) = img_dct(i,j);
    end
end
%figure,imshow(img_dct_merge,[]);

