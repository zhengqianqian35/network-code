function A=BA(m,m0,N)
% m = 2;    %ÿ�μ���ı߸���
% m0 = 3    %��ʼ�Ķ������
% N = 10;   %���մﵽ�Ķ������
%�����ڽӾ���    ȫ0���ޱ�
A = sparse(N,N);
%�������  1��ʾ�б�
for i=1:m0
    for j= (i+1):m0
        A(i,j)= round(rand());
        A(j,i) =  A(i,j);
    end
end   %��ʼ���

%����Ľڵ�Ϊ A(new) , �������ӵĵ�Ϊold     ���� A(new �� old)
for new = m0+1:N
    %old vertice ��Խ�������ϵĸ���Խ��
    Degree = sum(A(1:new-1,1:new-1));  %ÿ������Ķ�
    %�����һ���ȵķֲ����䣬ģ�����
    DegreeInterval(1) = Degree(1);
    for i=2:new-1
        DegreeInterval(i) = Degree(i)+DegreeInterval(i-1);
    end 
    %���� �½ڵ� �� m��old�ڵ�
    AllDegree = sum(sum(A(1:new-1,1:new-1))); %����ͼ���ܶ�
    for i = 1:m 
        while 1
         %�Ը��ʴ�old�ڵ����ҵ����ʵĶ�������
         RandDegree  = fix(AllDegree*rand()+1); %Ҫ����������RandDegree�Ķ�������
         %�ҵ� ���� Ҫ���������������
         Ans = find(RandDegree <= DegreeInterval(1:new-1));
         old = Ans(1);
         if A(new,old) == 0
            A(new,old) = 1;
            A(old,new) = 1;
            break;         %�ɹ�����
         end
        end
    end
end


