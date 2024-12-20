%Exemplo 15.4 - Metodo Iterativo

clc
clear
v1=10;
v2=100;
v3=40;
v4=0;
ni=500;
N=20;       %No de divisoes em y
nx=1.5*N+1; %No de nos em x
ny=N+1;     %No de nos em y

%ESTABELE�A OS VALORES INICIAIS IGUAIS A ZERO
v=37.5.*ones(ny,nx);





%POTENCIAIS FIXOS ESTÃO EM NÓS FIXOS
for i=2:ny-1
    v(i,1)=v4;
    v(i,nx)=v2;
end
for j=2:nx-1
    v(1,j)=v1;
    v(ny,j)=v3;
end
v(1,1)=0.5*(v1+v4);
v(ny,1)=0.5*(v4+v3);
v(1,nx)=0.5*(v1+v2);
v(ny,nx)=0.5*(v2+v3);

%ENCONTRE v(i,j) USANDO A EQUA�AO (15.15) AP�S ni ITERA�OES
i_con=(N/2)+1;
j_con=(N)/2+1;
for k=1:ni
    k
    for i=2:ny-1
        for j=2:nx-1
            v(i,j)=0.25*(v(i+1,j)+v(i-1,j)+v(i,j+1)+v(i,j-1));
        end
    end
    vv(k)=v(i_con,j_con);
    if k>1
        e(k)=abs((vv(k)-vv(k-1))./vv(k));
    end
end
vv(k)
e(1)=e(2);
figure(1),surf(v),xlabel('j'),ylabel('i'),zlabel('v(i,j)')
hold on,contour(v,20)
figure(2),subplot(2,1,1),plot(vv),grid,xlabel('ni (Numero de iteracoes)'),ylabel('V(6,6)')
subplot(2,1,2),semilogy(e),grid,xlabel('ni (Numero de iteracoes)'),ylabel('Erro')
[Ex,Ey] = gradient(v);
figure(3),quiver(-1.*Ex,-1.*Ey,2),hold on,contour(v,20)


