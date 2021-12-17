function[t,h,len] = huffman(f)
[entropy,Ps] = calculate_entropy(f);
Ps=sort(Ps,'descend');%
n=length(Ps);  % n=10
q=Ps;      %q=p=
% 
t=zeros(n,n);
t(:,1)=q;
for i=2:n
    t(:,i)=t(:,i-1);
    t(end-i+1,i)=t(end-i+1,i)+t(end-i+2,i);
    t(end-i+2:end,i)=0;
    t(:,i)=sort(t(:,i),'descend');
end

m=zeros(n-1,n); % 9 10
for i=1:n-1
    [q,e]=sort(q); 
    m(i,:)=[e(1:n-i+1),zeros(1,i-1)]; 
    q=[q(1)+q(2),q(3:n),1]; 
end
 
for i=1:n-1
    c(i,1:n*n)=blanks(n*n);  % 创建空白字符组
end
    c(n-1,n)='1';  % 9 10
    c(n-1,2*n)='0'; %9  20

for i=2:n-1
    c(n-i,1:n-1)=c(n-i+1,n*(find(m(n-i+1,:)==1))-(n-2):n*(find(m(n-i+1,:)==1)));  % 8 1:9 8，
    c(n-i,n)='1'; 
    c(n-i,n+1:2*n-1)=c(n-i,1:n-1); 
    c(n-i,2*n)='0'; 
    for j=1:i-1
         c(n-i,(j+1)*n+1:(j+2)*n)=c(n-i+1,n*(find(m(n-i+1,:)==j+1)-1)+1:n*find(m(n-i+1,:)==j+1));
    end
end
for i=1:n
    h(i,1:n)=c(1,n*(find(m(1,:)==i)-1)+1:find(m(1,:)==i)*n);
    len(i)=length(find(abs(h(i,:))~=32));
end

for i=1:n
    for j=1:n
       fprintf('  %f  ',t(i,j));
    end
    fprintf('  %s  ',h(i,:));
    fprintf('  %d  ',len(i));
    fprintf('%s\n','');
end


        
