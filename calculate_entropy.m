function[entropy,Ps] = calculate_entropy(metric)
figure;
imshow(metric);
[C,R] = size(metric);     
Img_size = C * R;      
P_N = unique(metric);       
L = length(P_N);
H_img = 0;
nk = zeros(L,1);  %[6,1]
for i = 1 : C
    for j = 1 : R
        for k = 1 : L
            temp = P_N(k,1);
            if metric(i,j) == temp
                nk(k,1) = nk(k,1) + 1;
            end
        end
    end
end
for k = 1 : L;
    Ps(k) = nk(k)/Img_size;
    
    if Ps(k) ~= 0;
        H_img = -Ps(k)*log2(Ps(k))+H_img;
    end
end
entropy = H_img;
end
