%%---the scenario of one crossroad------%%

close all;
clear all;

v0=22.352;  %50英里每小时22.352，40英里每小时17.8816，25英里每小时11.176
T0=1.5;
ve=11.176; %平衡速度
s0=3;
se=(s0+ve*T0)/(1-(ve/v0)^4)^0.5;
a0=2;
b0=-3;
P=2*3*4;  %初始状态前进方向的3*4个车道上每个车道2个车队
Mv=3;   %每个车队3辆车
L0=3;   %车身长3m
d1=3.5*3+6;
d2=3.5;
R1=6+3.5/2;
N=300;
T=N;
t0=0.1;
N1=300;

%%---初始化------%%

V=zeros(P,Mv,T);  %对P个车队，每个车队Mv辆车的速度赋初值0
Vx=zeros(P,Mv,T);
Vy=zeros(P,Mv,T);
a=zeros(P,Mv,T);
x=zeros(P,Mv,T);   %每个车的横坐标初始值0
y=zeros(P,Mv,T);  %每个车的纵坐标初始值0
s=zeros(P,Mv,T); 
o=zeros(P,Mv,T); 
kt=ones(P,Mv,T);
kt0=ones(P,Mv,T);
ht=zeros(P*Mv,P*Mv,T);
X=zeros(P*Mv,T);
Y=zeros(P*Mv,T);

for i=1:1:P;   %每个车的位置赋初始值
    for j=1:1:Mv;
        k=1;
        V(i,j,k)=ve;   %对P个车队，每个车队Mv辆车的速度赋初值
        if(i==1)   %第1个车队，lane1左
            if(j==1)
                x(i,j,k)=-d1-se-10*rand();
                y(i,j,k)=2.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=-se-L0+x(i,j-1,k);
                y(i,j,k)=2.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==2)   %第2个车队，lane1左
            if(j==1)
                x(i,j,k)=x(i-1,Mv,k)-se-L0-10*rand();
                y(i,j,k)=2.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=-se-L0+x(i,j-1,k);
                y(i,j,k)=2.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==3)   %第3个车队，lane2左
            if(j==1)
                x(i,j,k)=-d1-se-10*rand();
                y(i,j,k)=1.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=-se-L0+x(i,j-1,k);
                y(i,j,k)=1.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==4)   %第4个车队，lane2左
            if(j==1)
                x(i,j,k)=x(i-1,Mv,k)-se-L0-10*rand();
                y(i,j,k)=1.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=-se-L0+x(i,j-1,k);
                y(i,j,k)=1.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==5)   %第5个车队，lane3左
            if(j==1)
                x(i,j,k)=-d1-se-10*rand();
                y(i,j,k)=0.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=-se-L0+x(i,j-1,k);
                y(i,j,k)=0.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==6)   %第6个车队，lane3左
            if(j==1)
                x(i,j,k)=x(i-1,Mv,k)-se-L0-10*rand();
                y(i,j,k)=0.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=-se-L0+x(i,j-1,k);
                y(i,j,k)=0.5*d2;
                Vx(i,j,k)=ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==7)   %第7个车队，lane4右
            if(j==1)
                x(i,j,k)=d1+se+10*rand();
                y(i,j,k)=-0.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=se+L0+x(i,j-1,k);
                y(i,j,k)=-0.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==8)   %第8个车队，lane4右
            if(j==1)
                x(i,j,k)=x(i-1,Mv,k)+se+L0+10*rand();
                y(i,j,k)=-0.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=se+L0+x(i,j-1,k);
                y(i,j,k)=-0.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==9)   %第9个车队，lane5右
            if(j==1)
                x(i,j,k)=d1+se+10*rand();
                y(i,j,k)=-1.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=se+L0+x(i,j-1,k);
                y(i,j,k)=-1.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==10)   %第10个车队，lane5右
            if(j==1)
                x(i,j,k)=x(i-1,Mv,k)+se+L0+10*rand();
                y(i,j,k)=-1.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=se+L0+x(i,j-1,k);
                y(i,j,k)=-1.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==11)   %第11个车队，lane6右
            if(j==1)
                x(i,j,k)=d1+se+10*rand();
                y(i,j,k)=-2.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=se+L0+x(i,j-1,k);
                y(i,j,k)=-2.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==12)   %第12个车队，lane6右
            if(j==1)
                x(i,j,k)=x(i-1,Mv,k)+se+L0+10*rand();
                y(i,j,k)=-2.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            else
                x(i,j,k)=se+L0+x(i,j-1,k);
                y(i,j,k)=-2.5*d2;
                Vx(i,j,k)=-ve;
                Vy(i,j,k)=0;
            end
        end
        if(i==13)   %第13个车队，lane7下
            if(j==1)
                y(i,j,k)=-d1-se-10*rand();
                x(i,j,k)=-2.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            else
                y(i,j,k)=-se-L0+y(i,j-1,k);
                x(i,j,k)=-2.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            end
        end
        if(i==14)   %第14个车队，lane7下
            if(j==1)
                y(i,j,k)=y(i-1,Mv,k)-se-L0-10*rand();
                x(i,j,k)=-2.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            else
                y(i,j,k)=-se-L0+y(i,j-1,k);
                x(i,j,k)=-2.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            end
        end
        if(i==15)   %第15个车队，lane8下
            if(j==1)
                y(i,j,k)=-d1-se-10*rand();
                x(i,j,k)=-1.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            else
                y(i,j,k)=-se-L0+y(i,j-1,k);
                x(i,j,k)=-1.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            end
        end
        if(i==16)   %第16个车队，lane8下
            if(j==1)
                y(i,j)=y(i-1,Mv,k)-se-L0-10*rand();
                x(i,j,k)=-1.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            else
                y(i,j,k)=-se-L0+y(i,j-1,k);
                x(i,j,k)=-1.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            end
        end
        if(i==17)   %第17个车队，lane9下
            if(j==1)
                y(i,j,k)=-d1-se-10*rand();
                x(i,j,k)=-0.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            else
                y(i,j,k)=-se-L0+y(i,j-1,k);
                x(i,j,k)=-0.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            end
        end
        if(i==18)   %第18个车队，lane9下
            if(j==1)
                y(i,j,k)=y(i-1,Mv,k)-se-L0-10*rand();
                x(i,j,k)=-0.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            else
                y(i,j,k)=-se-L0+y(i,j-1,k);
                x(i,j,k)=-0.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=ve;
            end
        end
        if(i==19)   %第19个车队，lane10上
            if(j==1)
                y(i,j,k)=d1+se+10*rand();
                x(i,j,k)=0.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            else
                y(i,j,k)=se+L0+y(i,j-1,k);
                x(i,j,k)=0.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            end
        end
        if(i==20)   %第20个车队，lane10上
            if(j==1)
                y(i,j,k)=y(i-1,Mv,k)+se+L0+10*rand();
                x(i,j,k)=0.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            else
                y(i,j,k)=se+L0+y(i,j-1,k);
                x(i,j,k)=0.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            end
        end
        if(i==21)   %第21个车队，lane11上
            if(j==1)
                y(i,j,k)=d1+se+10*rand();
                x(i,j,k)=1.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            else
                y(i,j,k)=se+L0+y(i,j-1,k);
                x(i,j,k)=1.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            end
        end
        if(i==22)   %第22个车队，lane11上
            if(j==1)
                y(i,j,k)=y(i-1,Mv,k)+se+L0+10*rand();
                x(i,j,k)=1.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            else
                y(i,j,k)=se+L0+y(i,j-1,k);
                x(i,j,k)=1.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            end
        end
        if(i==23)   %第23个车队，lane12上
            if(j==1)
                y(i,j,k)=d1+se+10*rand();
                x(i,j,k)=2.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            else
                y(i,j,k)=se+L0+y(i,j-1,k);
                x(i,j,k)=2.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            end
        end
        if(i==24)   %第24个车队，lane12上
            if(j==1)
                y(i,j,k)=y(i-1,Mv,k)+se+L0+10*rand();
                x(i,j,k)=2.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            else
                y(i,j,k)=se+L0+y(i,j-1,k);
                x(i,j,k)=2.5*d2;
                Vx(i,j,k)=0;
                Vy(i,j,k)=-ve;
            end
        end
    end
end


for i=1:1:P;   
    for j=1:1:Mv;
        k=1;
        a(i,j,k)=0;
        if(i<=6)
            o(i,j,k)=0;
        elseif((i>6)&&(i<=12))
            o(i,j,k)=pi;
        elseif((i>12)&&(i<=18))
            o(i,j,k)=0.5*pi;
        else
            o(i,j,k)=1.5*pi;
        end
        if(i<=12)
            s(i,j,k)=x(i,j,k);
            V(i,j,k)=Vx(i,j,k);
        else
            s(i,j,k)=y(i,j,k);
            V(i,j,k)=Vy(i,j,k);
        end
    end
end

% csvwrite('V.txt',V);
% csvwrite('Vx.txt',Vx);
% csvwrite('Vy.txt',Vy);
% csvwrite('x.txt',x);
% csvwrite('y.txt',y);

% plot(x,y,'*')
% xlabel('x'),ylabel('y')



%%---左转------%%

for k=2:1:N;
    t=0.1*k;
    for i=1:1:P;
        for j=1:1:Mv;
           if(i==3||i==4||i==9||i==10)
            if(i==3)   %第一阶段P1,P2可能左转，P1
                if(j==1)   %头车
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                     if(V(i,j,k)<ve)
                         a(i,j,k)=a0;
                     elseif(V(i,j,k)==ve)
                         a(i,j,k)=0;
                     else
                         a(i,j,k)=b0;
                     end
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                else        %成员车辆跟随模型
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    a(i,j,k)=a0*(1-(V(i,j,k)/v0)^4-((s0+V(i,j,k)*T0+V(i,j,k)*(V(i,j,k)-V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)+L0))^2);
                end
                if(s(i,j,k)>=(-d1))
                    kt0(i,j,k)=k;
                    if((kt0(i,j,k)~=1)&&(kt0(i,j,k-1)~=1))
                        kt0(i,j,k)=kt0(i,j,k-1);
                    end
                end
                Vx(i,j,k)=V(i,j,k);
                Vy(i,j,k)=0;
                o(i,j,k)=0;
                x(i,j,k)=s(i,j,k);
                y(i,j,k)=y(i,j,k-1);
            elseif(i==4)   %P4
                if(j==1)   %头车
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    if(s(i-1,Mv,k)>=(-d1))  %前车队末车已转弯
                        if((s(i,j,k)-Mv*(se+L0)+(ve+V(i,j,k))*(ve-V(i,j,k))/a0/2+ve*(t0*N1-kt0(i-1,Mv,k)*t0-(ve-V(i,j,k))/a0))>=(-d1))
                            a(i,j,k)=0;
                        else
                            if(V(i,j,k)>0)
                                a(i,j,k)=0.5*V(i,j,k)^2/(d1+s(i,j,k));
                            else
                                a(i,j,k)=0;
                                V(i,j,k)=0;
                            end
                        end
                    else
                        if(abs(s(i,j,k)-s(i-1,Mv,k))>=se)  %车队外间距大于等于se时，与ve比较决定加速度
                            if(V(i,j,k)<ve)
                                a(i,j,k)=a0;
                            elseif(V(i,j,k)==ve)
                                a(i,j,k)=0;
                            else
                                a(i,j,k)=b0;
                            end
                        else  %车队外间距小于se时，根据IDM减速
                             a(i,j,k)=a0*(1-(V(i,j,k)/v0)^4-((s0+V(i,j,k)*T0+V(i,j,k)*(V(i,j,k)-V(i-1,Mv,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i-1,Mv,k)+L0))^2);
                        end
                    end
                else    %成员车辆
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    a(i,j,k)=a0*(1-(V(i,j,k)/v0)^4-((s0+V(i,j,k)*T0+V(i,j,k)*(V(i,j,k)-V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)+L0))^2);
                end
                if(s(i,j,k)>=(-d1))
                    kt0(i,j,k)=k;
                    if((kt0(i,j,k)~=1)&&(kt0(i,j,k-1)~=1))
                        kt0(i,j,k)=kt0(i,j,k-1);
                    end
                end
                    Vx(i,j,k)=V(i,j,k);
                    Vy(i,j,k)=0;
                    o(i,j,k)=0;
                    x(i,j,k)=s(i,j,k);
                    y(i,j,k)=y(i,j,k-1);
            elseif(i==9)   %第一阶段P1,P2可能左转，P1
                if(j==1)   %头车
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                     if(V(i,j,k)>(-ve))
                         a(i,j,k)=(-a0);
                     elseif(V(i,j,k)==(-ve))
                         a(i,j,k)=0;
                     else
                         a(i,j,k)=(-b0);
                     end
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                else        %成员车辆跟随模型
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)-L0))^2);
                end
                if(s(i,j,k)<=d1)   %转弯前
                    kt0(i,j,k)=k;
                    if((kt0(i,j,k)~=1)&&(kt0(i,j,k-1)~=1))
                        kt0(i,j,k)=kt0(i,j,k-1);
                    end
                end
                Vx(i,j,k)=V(i,j,k);
                Vy(i,j,k)=0;
                o(i,j,k)=pi;
                x(i,j,k)=s(i,j,k);
                y(i,j,k)=y(i,j,k-1);
            elseif(i==10)   %P10
                if(j==1)   %头车
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    if(s(i-1,Mv,k)<=(d1))  %前车队末车已转弯
                        if((s(i,j,k)+Mv*(se+L0)+(-ve+V(i,j,k))*(-ve-V(i,j,k))/(-a0)/2-ve*(t0*N1-kt0(i-1,Mv,k)*t0-(-ve-V(i,j,k))/(-a0)))<=(d1))
                            a(i,j,k)=0;
                        else
                            if(V(i,j,k)<0)
                                a(i,j,k)=0.5*V(i,j,k)^2/(-d1+s(i,j,k));
                            else
                                a(i,j,k)=0;
                                V(i,j,k)=0;
                            end
                        end
                    else
                        if(abs(s(i,j,k)-s(i-1,Mv,k))>=se)  %车队外间距大于等于se时，与ve比较决定加速度
                            if(abs(V(i,j,k))<ve)
                                a(i,j,k)=(-a0);
                            elseif(abs(V(i,j,k))==ve)
                                a(i,j,k)=0;
                            else
                                a(i,j,k)=(-b0);
                            end
                        else  %车队外间距小于se时，根据IDM减速
                             a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i-1,Mv,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i-1,Mv,k)-L0))^2);
                        end
                    end
                else    %成员车辆
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)-L0))^2);
                end
                if(s(i,j,k)<=d1)   %转弯前
                    kt0(i,j,k)=k;
                    if((kt0(i,j,k)~=1)&&(kt0(i,j,k-1)~=1))
                        kt0(i,j,k)=kt0(i,j,k-1);
                    end
                end
                Vx(i,j,k)=V(i,j,k);
                Vy(i,j,k)=0;
                o(i,j,k)=pi;
                x(i,j,k)=s(i,j,k);
                y(i,j,k)=y(i,j,k-1);
            end
           else     %其他车道情况
               if(i==1||i==5||i==13||i==15||i==17)  %其他车道的第一个车队
                   V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                   s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                   if(j==1)   %头车
                       if(V(i,j,k)>0)
                           a(i,j,k)=0.5*V(i,j,k)^2/(d1+s(i,j,k));
                       else
                           V(i,j,k)=0;
                           a(i,j,k)=0;
                       end
                   else
                       a(i,j,k)=a0*(1-(V(i,j,k)/v0)^4-((s0+V(i,j,k)*T0+V(i,j,k)*(V(i,j,k)-V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)+L0))^2);
                       if(V(i,j,k)<=0)
                           V(i,j,k)=0;
                           a(i,j,k)=0;
                       end
                   end
                   o(i,j,k)=o(i,j,k-1);
                   Vx(i,j,k)=abs(V(i,j,k))*cos(o(i,j,k));
                   Vy(i,j,k)=abs(V(i,j,k))*sin(o(i,j,k));                   
                   x(i,j,k)=x(i,j,k-1)+abs(s(i,j,k)-s(i,j,k-1))*cos(o(i,j,k));
                   y(i,j,k)=y(i,j,k-1)+abs(s(i,j,k)-s(i,j,k-1))*sin(o(i,j,k));
               elseif(i==2||i==6||i==14||i==16||i==18)   %其他车道第二个车队
                   if(j==1)
                       V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                       s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                       if(abs(s(i,j,k)-s(i-1,Mv,k)+L0)>=se)  %车队外间距大于等于se时，与ve比较决定加速度
                           a(i,j,k)=0;
                       else  %车队外间距小于se时，根据IDM减速
                           a(i,j,k)=a0*(1-(V(i,j,k)/v0)^4-((s0+V(i,j,k)*T0+V(i,j,k)*(V(i,j,k)-V(i-1,Mv,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i-1,Mv,k)+L0))^2);
                       end
                   else
                       V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                       s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                       a(i,j,k)=a0*(1-(V(i,j,k)/v0)^4-((s0+V(i,j,k)*T0+V(i,j,k)*(V(i,j,k)-V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)+L0))^2);
                       if(V(i,j,k)<=0)
                           V(i,j,k)=0;
                           a(i,j,k)=0;
                       end
                   end
                   o(i,j,k)=o(i,j,k-1);
                   Vx(i,j,k)=abs(V(i,j,k))*cos(o(i,j,k));
                   Vy(i,j,k)=abs(V(i,j,k))*sin(o(i,j,k));                   
                   x(i,j,k)=x(i,j,k-1)+abs(s(i,j,k)-s(i,j,k-1))*cos(o(i,j,k));
                   y(i,j,k)=y(i,j,k-1)+abs(s(i,j,k)-s(i,j,k-1))*sin(o(i,j,k));
               elseif(i==7||i==11||i==19||i==21||i==23)  %其他车道的第一个车队
                   V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                   s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                   if(j==1)   %头车
                       if(V(i,j,k)<0)
                           a(i,j,k)=0.5*V(i,j,k)^2/(-d1+s(i,j,k));
                       else
                           V(i,j,k)=0;
                           a(i,j,k)=0;
                       end
                   else
                       a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)-L0))^2);
                       if(V(i,j,k)>=0)
                           V(i,j,k)=0;
                           a(i,j,k)=0;
                       end
                   end
                   o(i,j,k)=o(i,j,k-1);
                   Vx(i,j,k)=abs(V(i,j,k))*cos(o(i,j,k));
                   Vy(i,j,k)=abs(V(i,j,k))*sin(o(i,j,k));                   
                   x(i,j,k)=x(i,j,k-1)+abs(s(i,j,k)-s(i,j,k-1))*cos(o(i,j,k));
                   y(i,j,k)=y(i,j,k-1)+abs(s(i,j,k)-s(i,j,k-1))*sin(o(i,j,k));
               elseif(i==8||i==12||i==20||i==22||i==24)   %其他车道第二个车队
                   if(j==1)
                       V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                       s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                       if(abs(s(i,j,k)-s(i-1,Mv,k)-L0)>=se)  %车队外间距大于等于se时，与ve比较决定加速度
                           a(i,j,k)=0;
                       else  %车队外间距小于se时，根据IDM减速
                           a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i-1,Mv,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i-1,Mv,k)-L0))^2);
                       end
                   else
                       V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                       s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                       a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)-L0))^2);
                       if(V(i,j,k)>=0)
                           V(i,j,k)=0;
                           a(i,j,k)=0;
                       end
                   end
                   o(i,j,k)=o(i,j,k-1);
                   Vx(i,j,k)=abs(V(i,j,k))*cos(o(i,j,k));
                   Vy(i,j,k)=abs(V(i,j,k))*sin(o(i,j,k));                   
                   x(i,j,k)=x(i,j,k-1)+abs(s(i,j,k)-s(i,j,k-1))*cos(o(i,j,k));
                   y(i,j,k)=y(i,j,k-1)+abs(s(i,j,k)-s(i,j,k-1))*sin(o(i,j,k));
               end              
           end
        end
    end
end

%%---算H（t）------%%

for n=1:1:(P*Mv);
    for k=1:1:N;
        if(mod(n,Mv)~=0)
            X(n,k)=x(floor(n/Mv)+1,mod(n,Mv),k);
            Y(n,k)=y(floor(n/Mv)+1,mod(n,Mv),k);
        else
            X(n,k)=x(floor(n/Mv),Mv,k);
            Y(n,k)=y(floor(n/Mv),Mv,k);
        end
    end
end

C=100;
Ncs=zeros((P*Mv),N);

for k=1:1:N;
    for i=1:1:(P*Mv);
        for j=1:1:(P*Mv);
            if(sqrt((X(i,k)-X(j,k))^2+(Y(i,k)-Y(j,k))^2)<=C && i~=j)
                ht(i,j,k)=1;
            else
                ht(i,j,k)=0;
            end
        end
    end
end

for k=1:1:N;
    for r=1:1:(P*Mv);
    for j=1:1:(P*Mv);
        if(sqrt((X(r,k)-X(j,k))^2+(Y(r,k)-Y(j,k))^2)<=C)
            Ncs(r,k)=Ncs(r,k)+1;
        end
    end
    end
end


%%---算均值、方差------%%

lambda0=5;lambda1=10;%%%AC0的到达率，5pks/s %AC1
lambda2=15;lambda3=20;
slot_time=13*(10^(-6));%时隙大小，转换成秒

PHYh=48;MACh=112;Pl=200;%全是以bits为单位
Rd=3*10^6;Rb=10^6;tran_time=10^(-6);
Ttr=(PHYh/Rb)+((MACh+Pl)/Rd)+2*tran_time;%传输时间恒定

Pa0=1-exp(-lambda0*slot_time); %AC0到达概率
Pa1=1-exp(-lambda1*slot_time);      %AC1到达概率，（到达率不变，它不变）,%取决于数据产生，服从什么规律，决定了服从什么系统；周期：daodalv*sltot_time;泊松：1-exp(-daodalv*slot_time)
Pa2=1-exp(-lambda2*slot_time);
Pa3=1-exp(-lambda3*slot_time);
%**********************802.11p性能参数************%
W0_0=4;%AC0初始竞争窗口大小
W1_0=4;W1_1=8;
W2_0=8;W2_1=16;
W3_0=16;W3_1=32;W3_2=64;W3_3=128;W3_4=256;W3_5=512;W3_6=1024;
% W1_0=16;W1_1=32;



AIFSN0=2;
AIFSN1=3;
AIFSN2=6;
AIFSN3=9;

SIFS=32*(10^(-6));
AIFS0=SIFS+AIFSN0*slot_time;
AIFS1=SIFS+AIFSN1*slot_time;
AIFS2=SIFS+AIFSN2*slot_time;
AIFS3=SIFS+AIFSN3*slot_time;

M1=1;%AC1可翻倍的最大次数
M2=1;
M3=6;

L_limit=1;
L1=L_limit+M1;
L2=L_limit+M2;
L3=L_limit+M3;

A0=0;
A1=AIFSN1-AIFSN0;
A2=AIFSN2-AIFSN0;
A3=AIFSN3-AIFSN0;




 
 h_ir=zeros((P*Mv),N);
 h_ij=zeros((P*Mv),N);
 p_exposed=zeros((P*Mv),N);
 h_rj=zeros((P*Mv),(P*Mv),N);
 liancheng=ones((P*Mv),(P*Mv),N);
 p_hidden=zeros((P*Mv),N);
 p_c=zeros((P*Mv),N);
 f_in0=zeros(1,N);
 f_out0=zeros(1,N);
 PDR0s=zeros((P*Mv),N);
 PDR0x=zeros((P*Mv),N);
 PDR0=zeros(1,N);
  f_in1=zeros(1,N);
 f_out1=zeros(1,N);
 PDR1s=zeros((P*Mv),N);
 PDR1x=zeros((P*Mv),N);
 PDR1=zeros(1,N);
   f_in2=zeros(1,N);
 f_out2=zeros(1,N);
 PDR2s=zeros((P*Mv),N);
 PDR2x=zeros((P*Mv),N);
 PDR2=zeros(1,N);
   f_in3=zeros(1,N);
 f_out3=zeros(1,N);
 PDR3s=zeros((P*Mv),N);
 PDR3x=zeros((P*Mv),N);
 PDR3=zeros(1,N);
 
 load('p0.mat');
 load('p1.mat');
 load('p2.mat');
 load('p3.mat'); 
 load('u_0.mat');
 load('u_1.mat');
 load('u_2.mat');
 load('u_3.mat');
 load('tao.mat');
 
 for k=1:1:N;
     f_in0(1,k)=lambda0;
      f_out0(1,k)=u_0(1,k)*p0(1,k);
      f_in1(1,k)=lambda1;
      f_out1(1,k)=u_1(1,k)*p1(1,k);
      f_in2(1,k)=lambda2;
      f_out2(1,k)=u_2(1,k)*p2(1,k);
      f_in3(1,k)=lambda3;
      f_out3(1,k)=u_3(1,k)*p3(1,k);
%      f_out0(1,k)=f_in0(1,k);
     for r=1:1:(P*Mv);
         if(sqrt((X(1,k)-X(r,k))^2+(Y(1,k)-Y(r,k))^2)<=C&&r~=1)
             h_ir(r,k)=1;
         else
             h_ir(r,k)=0;
         end
         p_exposed(r,k)=tao(1,k)*h_ir(r,k);
     end
     for j=1:1:(P*Mv);
         if(sqrt((X(1,k)-X(j,k))^2+(Y(1,k)-Y(j,k))^2)<=C&&j~=1)
             h_ij(j,k)=1;
         else
             h_ij(j,k)=0;
         end
     end
     for r=1:1:(P*Mv);
         for j=1:1:(P*Mv);
             if(sqrt((X(r,k)-X(j,k))^2+(Y(r,k)-Y(j,k))^2)<=C&&r~=j)
                 h_rj(r,j,k)=1;
             else
                 h_rj(r,j,k)=0;
             end
         end
     end
     for r=1:1:(P*Mv);
         for j=1:1:(P*Mv);
             if(j~=1)
                 liancheng(r,j,k)=liancheng(r,j-1,k)*((1-tao(1,k))^(30*(1-h_ij(j,k))*h_rj(r,j,k)));
%              else
%                  liancheng(j,k)=liancheng(j-1,k);
             end
         end
         p_hidden(r,k)=h_ir(r,k)*(1-liancheng(r,(P*Mv),k));
         p_c(r,k)=1-(1-p_exposed(r,k))*(1-p_hidden(r,k));
     end
     for r=1:1:(P*Mv);
         if(r==1)
             PDR0s(r,k)=f_out0(1,k)*h_ir(r,k)*(1-p_c(r,k));
             PDR0x(r,k)=f_in0(1,k)*h_ir(r,k);
         else
             if(h_ir(r,k)==1)
                 PDR0s(r,k)=PDR0s(r-1,k)+f_out0(1,k)*h_ir(r,k)*(1-p_c(r,k));
                 PDR0x(r,k)=PDR0x(r-1,k)+f_in0(1,k)*h_ir(r,k);
             else
                 PDR0x(r,k)=PDR0x(r-1,k);
                 PDR0s(r,k)=PDR0s(r-1,k);
             end
         end
     end
     PDR0(1,k)=PDR0s((P*Mv),k)/PDR0x((P*Mv),k);
     
     for r=1:1:(P*Mv);
         if(r==1)
             PDR1s(r,k)=f_out1(1,k)*h_ir(r,k)*(1-p_c(r,k));
             PDR1x(r,k)=f_in1(1,k)*h_ir(r,k);
         else
             if(h_ir(r,k)==1)
                 PDR1s(r,k)=PDR1s(r-1,k)+f_out1(1,k)*h_ir(r,k)*(1-p_c(r,k));
                 PDR1x(r,k)=PDR1x(r-1,k)+f_in1(1,k)*h_ir(r,k);
             else
                 PDR1x(r,k)=PDR1x(r-1,k);
                 PDR1s(r,k)=PDR1s(r-1,k);
             end
         end
     end
     PDR1(1,k)=PDR1s((P*Mv),k)/PDR1x((P*Mv),k);
     
     for r=1:1:(P*Mv);
         if(r==1)
             PDR2s(r,k)=f_out2(1,k)*h_ir(r,k)*(1-p_c(r,k));
             PDR2x(r,k)=f_in2(1,k)*h_ir(r,k);
         else
             if(h_ir(r,k)==1)
                 PDR2s(r,k)=PDR2s(r-1,k)+f_out2(1,k)*h_ir(r,k)*(1-p_c(r,k));
                 PDR2x(r,k)=PDR2x(r-1,k)+f_in2(1,k)*h_ir(r,k);
             else
                 PDR2x(r,k)=PDR2x(r-1,k);
                 PDR2s(r,k)=PDR2s(r-1,k);
             end
         end
     end
     PDR2(1,k)=PDR2s((P*Mv),k)/PDR2x((P*Mv),k);
     
     
     for r=1:1:(P*Mv);
         if(r==1)
             PDR3s(r,k)=f_out3(1,k)*h_ir(r,k)*(1-p_c(r,k));
             PDR3x(r,k)=f_in3(1,k)*h_ir(r,k);
         else
             if(h_ir(r,k)==1)
                 PDR3s(r,k)=PDR3s(r-1,k)+f_out3(1,k)*h_ir(r,k)*(1-p_c(r,k));
                 PDR3x(r,k)=PDR3x(r-1,k)+f_in3(1,k)*h_ir(r,k);
             else
                 PDR3x(r,k)=PDR3x(r-1,k);
                 PDR3s(r,k)=PDR3s(r-1,k);
             end
         end
     end
     PDR3(1,k)=PDR3s((P*Mv),k)/PDR3x((P*Mv),k);
     
     
 end
 
%  guodu=ones((P*Mv),N);
%  Pc=zeros(1,N);
% for k=1:1:N;
%     for j=1:1:(P*Mv);
%         if(j~=1)
% %             if(h_ir(j,k)==1)
%                 guodu(j,k)=guodu(j-1,k)*(1-tao(j,k));
% %             else
% %                 guodu(j,k)=guodu(j-1,k)*(1-tao(j,k));
% %             end
%         end
%     end
%     Pc(1,k)=1-guodu((P*Mv),k);
% end
%  
 
 p_c_total=zeros((P*Mv),N);
 p_c_avg=zeros(1,N);
 p_exposed_total=zeros((P*Mv),N);
 p_exposed_avg=zeros(1,N);
 p_hidden_total=zeros((P*Mv),N);
 p_hidden_avg=zeros(1,N);
 for k=1:1:N;
     for j=1:1:(P*Mv);
         if(j~=1)
             p_c_total(j,k)=p_c_total(j-1,k)+p_c(j,k);
             p_exposed_total(j,k)=p_exposed_total(j-1,k)+p_exposed(j,k);
             p_hidden_total(j,k)=p_hidden_total(j-1,k)+p_hidden(j,k);
         else
             p_c_total(j,k)=p_c(j,k);
             p_exposed_total(j,k)=p_exposed(j,k);
             p_hidden_total(j,k)=p_hidden(j,k);
         end
     end
     p_c_avg(1,k)=p_c_total((P*Mv),k)/(P*Mv);
     p_exposed_avg(1,k)=p_exposed_total((P*Mv),k)/(P*Mv);
     p_hidden_avg(1,k)=p_hidden_total((P*Mv),k)/(P*Mv);
 end
 

 
 
 
 
PDR0(:,1)=[];
PDR1(:,1)=[]; 
PDR2(:,1)=[];
PDR3(:,1)=[]; 



 save('PDR0.mat','PDR0'); 
 save('PDR1.mat','PDR1'); 
 save('PDR2.mat','PDR2'); 
 save('PDR3.mat','PDR3'); 
 
load('Dt0.mat');
load('Dt1.mat');
load('Dt2.mat');
load('Dt3.mat');

load('Ts0.mat');
load('Ts1.mat');
load('Ts2.mat');
load('Ts3.mat');



figure(1)
 x=1:1:N;
 plot(0.1*x,p_c_avg,'r');
 title('p_c_{avg}');
 hold on;
 
 
 figure(2)
 x=1:1:N;
 plot(0.1*x,Ncs(1,:),'r');
 title('Ncs');
 hold on;
 
figure(3)
x1=1:1:N;  
plot(0.1*x1,Ts0*1000);
hold on;
x2=1:1:N;
plot(0.1*x2,Ts1*1000);
hold on;
x3=1:1:N;  
plot(0.1*x3,Ts2*1000);
hold on;
x4=1:1:N;
plot(0.1*x4,Ts3*1000);
title('Ts')
hold on;

figure(4)
x1=2:1:N;  
plot(0.1*x1,PDR0);
hold on;
x2=2:1:N;  
plot(0.1*x2,PDR1);
hold on;
x3=2:1:N;  
plot(0.1*x3,PDR2);
hold on;
x4=2:1:N;  
plot(0.1*x4,PDR3);
hold on;
title('PDR')
hold on;

figure(5)
x1=1:1:N;  
plot(0.1*x1,Dt0);
hold on;
x2=1:1:N;  
plot(0.1*x2,Dt1*1000);
hold on;
x3=1:1:N;  
plot(0.1*x3,Dt2*1000);
hold on;
x4=1:1:N;  
plot(0.1*x4,Dt3*1000);
hold on;
title('Dt')
hold on; 
 
figure(6)
x1=2:1:N;  
plot(0.1*x1,PDR0);
hold on;

figure(7)
x1=2:1:N;  
plot(0.1*x1,PDR1);
hold on;
figure(8)
x1=2:1:N;  
plot(0.1*x1,PDR2);
hold on;
figure(9)
x1=2:1:N;  
plot(0.1*x1,PDR3);
hold on;