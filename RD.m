function C=RD(n,p)
C=zeros(n);
for i=1:n
    for j=i+1:n
if rand <p
    C(i,j)=1;
    C(j,i)=1;
end
    end
end
end