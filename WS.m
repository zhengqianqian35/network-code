
function A=WS(N,K,p)
% N=10;%input('�������������������нڵ������N:');
% 
% K=4;%input('��������������������ÿ���ڵ���ھ���K:');

if K>floor(N-1)|mod(K,2)~=0;
disp('�����������Kֵ������С������ڵ�������Ϊż��������');
return ;
end
A=zeros(N);
for i=1:N
for j=i+1:i+K/2
jj=j;
if j>N
jj=mod(j,N);
end
A(i,jj)=1;
A(jj,i)=1;
end
end
%WSС��������Ĵ���
p=0.3;%input('����������������ĸ���p:');
for i=1:N
    for j=i+1:i+K/2
        jj=j;
        if j>N
            jj=mod(j,N);
        end
        p1=rand(1,1);
        if p1<p
            A(i,jj)=0;A(jj,i)=0;A(i,i)=inf;a=find(A(i,:)==0);
            rand_data=randi([1,length(a)],1,1);
            jjj=a(rand_data);A(i,jjj)=1;A(jjj,i)=1;A(i,i)=0;
        end
    end
end

