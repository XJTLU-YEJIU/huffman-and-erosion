function [result,QP] = quantize(img_dct,QP)
Qmat = [16 11 10 16 24 40 51 61;
        12 12 14 19 26 58 60 55;
        14 13 16 24 40 57 69 56;
        14 17 22 29 51 87 80 62;
        18 22 37 56 68 109 103 77;
        24 35 55 64 81 104 113 92;
        49 64 78 87 103 121 120 101;
        72 92 95 98 112 100 103 99]

QP = 50; % 
if QP > 50
    S = (100 - QP)/50;
elseif (QP>0)&&(QP<=50)
    S = 50 / QP;
end
re_qmat = repmat(Qmat,64,64);
term = img_dct ./ re_qmat;
result = round((1/S) * term);
end
