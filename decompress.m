function[new_img] = decompress(im)

lenna = imread('lenna512.bmp');
[img_dct,~] = compress(lenna);
[row,col] = size(lenna);

new_img = zeros(row,col);
for i=1:8:row-7
    for j=1:8:col-7
        dct_block = img_dct(i:i+7, j:j+7);
        img_block = idct2(dct_block); % 
        new_img(i:i+7, j:j+7) = img_block;
    end
end

