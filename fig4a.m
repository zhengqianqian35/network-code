clear
clc
N=50;
K=2;
p=0.3;
A=WS(N,K,p);
B=A;
angle=0:2*pi./N:2*pi-2*pi/N;
angle=0:2*pi/N:2*pi-2*pi/N;
x1=10*sin(angle)+10;
y1=10*cos(angle)-10;
plot(x1,y1,'ro','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',8);
hold on;
for i=1:N
for j=i+1:N
if A(i,j)~=0
plot([x1(i),x1(j)],[y1(i),y1(j)],'g','linewidth',1.2);
hold on;
end
end
end
m=2;
m0=4;
A=BA(m,m0,N);
angle=0:2*pi./N:2*pi-2*pi/N;
angle=0:2*pi/N:2*pi-2*pi/N;
x2=10*sin(angle);
y2=10*cos(angle)+10;
plot(x2,y2,'ro','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',8);
for i=1:N
for j=i+1:N
if A(i,j)~=0
plot([x2(i),x2(j)],[y2(i),y2(j)],'r','linewidth',1.2);
hold on;
end
end
end
C=[B zeros(N);zeros(N) A];
p1=0.001;
for i=1:N
    for j=N+1:2*N
        if(rand<p1)
            C(i,j)=1;
            C(j,i)=1;
        end
    end
end
x=[x1 x2];
y=[y1 y2];
for i=1:N
for j=N+1:2*N
if C(i,j)~=0
plot([x(i),x(j)],[y(i),y(j)],'--k','linewidth',1.2);
hold on;
end
end
end
    