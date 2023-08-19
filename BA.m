function A=BA(m,m0,N)
% m = 2;    %每次加入的边个数
% m0 = 3    %初始的顶点个数
% N = 10;   %最终达到的顶点个数
%创建邻接矩阵    全0，无边
A = sparse(N,N);
%随机连边  1表示有边
for i=1:m0
    for j= (i+1):m0
        A(i,j)= round(rand());
        A(j,i) =  A(i,j);
    end
end   %初始完成

%加入的节点为 A(new) , 与其连接的点为old     生成 A(new ， old)
for new = m0+1:N
    %old vertice 度越大连接上的概率越大
    Degree = sum(A(1:new-1,1:new-1));  %每个顶点的度
    %制造出一个度的分布区间，模拟概率
    DegreeInterval(1) = Degree(1);
    for i=2:new-1
        DegreeInterval(i) = Degree(i)+DegreeInterval(i-1);
    end 
    %连接 新节点 与 m个old节点
    AllDegree = sum(sum(A(1:new-1,1:new-1))); %整个图的总度
    for i = 1:m 
        while 1
         %以概率从old节点中找到合适的顶点连接
         RandDegree  = fix(AllDegree*rand()+1); %要与度区间包含RandDegree的顶点相连
         %找到 符合 要求的区间所属顶点
         Ans = find(RandDegree <= DegreeInterval(1:new-1));
         old = Ans(1);
         if A(new,old) == 0
            A(new,old) = 1;
            A(old,new) = 1;
            break;         %成功连接
         end
        end
    end
end


