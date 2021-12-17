im = imread('lenna512.bmp');
[row,col] = size(im);
img_dct = zeros(row, col); % 存放转换后的dct系数
for i=1:8:row-7
    for j=1:8:col-7
        img_block = im(i:i+7, j:j+7);
        dct_block = dct2(img_block); % 也可用刚才实现的(定义成一个函数即可)
        % imshow(dct_block); % 显示dct块
        img_dct(i:i+7, j:j+7) = dct_block;
    end
end
%figure, imshow(img_dct); % 显示生成的dct系数
img_dct_merge = zeros(row/8,col/8);
% img_dct = round(img_dct);

% 压缩成64 64
for i = 1:8:row
    for j = 1:8:col
        img_dct_merge((i+7)/8,(j+7)/8) = img_dct(i,j);
    end
end
%figure,imshow(img_dct_merge,[]);
% 3，dct反变换
new_img = zeros(row,col);
for i=1:8:row-7
    for j=1:8:col-7
        dct_block = img_dct(i:i+7, j:j+7);
        img_block = idct2(dct_block); % 也可用刚才实现的(定义成一个函数即可)
        new_img(i:i+7, j:j+7) = img_block;
    end
end

%figure,  imshow(mat2gray(new_img)); % 显示反变换回来的图像

QP = 1 ; % 需要自己手动设置 S 的值

if QP > 50
    S = (100 - QP)/50;
elseif (QP>0)&&(QP<=50)
    S = 50 / QP;
end


Qmat = [16 11 10 16 24 40 51 61;
        12 12 14 19 26 58 60 55;
        14 13 16 24 40 57 69 56;
        14 17 22 29 51 87 80 62;
        18 22 37 56 68 109 103 77;
        24 35 55 64 81 104 113 92;
        49 64 78 87 103 121 120 101;
        72 92 95 98 112 100 103 99]
  

re_qmat = repmat(Qmat,64,64);
term = img_dct ./ re_qmat;
result = round((1/S) * term);
figure,imshow(result);

% 3，dct反变换
new_img = zeros(row,col);
for i=1:8:row-7
    for j=1:8:col-7
        dct_block = result(i:i+7, j:j+7);
        img_block = idct2(dct_block); % 也可用刚才实现的(定义成一个函数即可)
        new_img(i:i+7, j:j+7) = img_block;
    end
end
figure,  imshow(mat2gray(new_img)); % 显示反变换回来的图像
title('When QP = 2')
