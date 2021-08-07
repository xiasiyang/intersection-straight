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

load('p0.mat');
load('p1.mat');
load('p2.mat');
load('p3.mat');
load('pv0.mat');
load('pv1.mat');
load('pv2.mat');
load('pv3.mat');
load('tao0.mat');
load('tao1.mat');
load('tao2.mat');
load('tao3.mat');
load('tao.mat');
w0=zeros(1,N);
w1=zeros(1,N);
w2=zeros(1,N);
w3=zeros(1,N);


for k=1:1:N;
    w0(1,k)=tao0(1,k);
    w1(1,k)=tao1(1,k)/(1-pv1(1,k));
    w2(1,k)=tao2(1,k)/(1-pv2(1,k));
    w3(1,k)=tao3(1,k)/(1-pv3(1,k));
end

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
 



 %%---AC0------%%
 
 TransmissionProbability_Sim=zeros(1,N);
 CollisionProbability_Sim=zeros(1,N);

 for tt=1:1:N;
Counter=0;           
TotalTimeInSeconds=1.3;%总仿真时间，单位：秒
Start = 0;      
ArrivalTime = 1:Ncs(1,tt);       %新数据包到无线节点发送缓冲区的时间
PacketLength = 1:Ncs(1,tt);     %到无线节点发送缓冲区的新数据包大小
HasPacket = zeros(1,Ncs(1,tt));
CW = 1:Ncs(1,tt);
BackoffTimer = 1:Ncs(1,tt);
PacketBuff = zeros(Ncs(1,tt),5001); %无线节点发送缓冲区各数据包大小矩阵
CollitionStations = zeros(1,Ncs(1,tt)+1);  %冲突站点号向量
SlotTime = 13*10^(-6);      %时隙间隔=50us
TotalTime = floor(TotalTimeInSeconds/SlotTime);  %总仿真时间，单位：slot
CurBufferSize = zeros(1,Ncs(1,tt)); %当前发送帧长
ChannelBusy=zeros(1,TotalTime);
Transmissionnum=0;
Collisionnum=0;

%初始化
for i = 1:Ncs(1,tt)
    ArrivalTime(i) = 1;  %初始化到达时间  
%    PacketLength(i) = 164;%初始化分组长度
    CW(i) = W0_0; %竞争窗口，CW = 32 slots
    BackoffTimer(i) = W0_0-1; %退避时间用 1200 slots来代表无穷大
end

for t = 1:TotalTime
    for i = 1:Ncs(1,tt)
    %更新发送缓冲区
        if t == ArrivalTime(i)
            %目前不能发送，push分组进PackeBuff，修改退避计数器
            if(rand<=p0(1,tt)) 
                PacketLength(i) = 164;
                PacketBuff = Push(PacketBuff,i,PacketLength(i));
            %Push新数据包
                CurBufferSize(i) = CurBufferSize(i) + PacketLength(i);
                HasPacket(i) = 1;
                BackoffTimer(i) = RandSel(CW(i));%退避计数器达到最大1200时，重置退避计数器               
            else
                BackoffTimer(i) = RandSel(CW(i));
            end
            %ArrivalTime(i) = 1 + PacketLength(i) + t;
            %下一个数据包的到达时间
            Counter=Counter+1;           
        end
    end

    for i = 1:Ncs(1,tt)
        if HasPacket(i) == 1  %PackeBuff中有数据包发送并且信道空闲
            if BackoffTimer(i) == 0 %退避时间=0则发送,P[(0,k)e|(i,0)] P[(0.k)|(i,0)] P[(min(i+1,m),k|(i,0))]
                Transmissionnum=Transmissionnum+1;
                Counter=Counter+1;          
                    CollitionStations = Add(CollitionStations,i);%加入冲突站点序列中            
                    Start = 1; 
            elseif BackoffTimer(i) == 1%退避时间=0则 退避时间-1,P[(i,k-1)|(i,k)]=1
                if(Start==0)
                    BackoffTimer(i) = BackoffTimer(i) - 1;
                    Counter=Counter+1;
                    ChannelBusy(1,t+1)=1;
                else
                    BackoffTimer(i) = BackoffTimer(i);
                    Counter=Counter+1;
                end
            else
                if(Start==0)
                    BackoffTimer(i) = BackoffTimer(i) - 1;
                    Counter=Counter+1;
                else
                    BackoffTimer(i) = BackoffTimer(i);
                    Counter=Counter+1;
                end
            end
        elseif HasPacket(i) == 0 
            if BackoffTimer(i) == 0%退避时间=0则发送
                    if (rand>Pa0)% P[(0,0)e|(0,0)e]
                        BackoffTimer(i) = 0;
                        Counter=Counter+1;
                    else %|P[(0,k)e|(0,0)e] P[(1,k)|(0,0)e]
                        HasPacket(i)=1;
                        PacketLength(i) = 164;                 
                        PacketBuff = Push(PacketBuff,i,PacketLength(i));                  
                        CurBufferSize(i) = CurBufferSize(i) + PacketLength(i);                                                                      
                            BackoffTimer(i) = RandSel(W0_0);
                            Counter=Counter+1;
                    end
            else
                if(Start==0)
                    BackoffTimer(i) = BackoffTimer(i) - 1;%退避时间=0则 退避时间-1 P[(0,k-1)e|(0,k)e] P[(0,k-1)|(0,k)e]
                    Counter=Counter+1;
                else
                    BackoffTimer(i) = BackoffTimer(i);%退避时间=0则 退避时间-1 P[(0,k-1)e|(0,k)e] P[(0,k-1)|(0,k)e]
                    Counter=Counter+1;
                end
            end
        end
    end


  
    if Start == 1%信道改为忙碌
        n_c = CollitionStations(1);
        if n_c == 1%信道中只有一个站点发送数据则为正常发送情况
          %  DeferenceTime = floor(t + 1);
            %PacketBuff(CollitionStations(2),2)数据长度
            %成功发送时间
            n_c = CollitionStations(2);         
            CurBufferSize(n_c) = CurBufferSize(n_c) - PacketBuff(n_c,2);
            PacketBuff = Pop(PacketBuff,n_c);
            CW(n_c) = W0_0;
            k = PacketBuff(n_c,1);
            if k ==0%如果没有数据等待发送，将HasPacke置0，BackoffTimer置Max
                ArrivalTime(n_c) = 1 + t;
                HasPacket(n_c) = 0;
                BackoffTimer(n_c) = RandSel(CW(n_c));
                Counter=Counter+1;
            else%还有数据分发送，修改碰撞计数器
                BackoffTimer(n_c) = RandSel(CW(n_c));
                 Counter=Counter+1;
            end    
        else
            %发生碰撞要加上最大的冲突数据时间段
            n_c = CollitionStations(1);
            for i = 1:n_c
                j = CollitionStations(i+1);
                CW(j) = W0_0;
                BackoffTimer(j) = RandSel(CW(j));
                Counter=Counter+1;
                Collisionnum=Collisionnum+1;
            end    
        end
        Start=0;%信道恢复空闲        
        CollitionStations = zeros(1,Ncs(1,tt)+1);
    end
end
TransmissionProbability_Sim(1,tt)=(Transmissionnum)/Counter;
CollisionProbability_Sim(1,tt)=(Collisionnum)/Transmissionnum;

 end


 tao_sim=zeros(1,N);
 PK_sim=zeros(1,N);
 pb0_sim=zeros(1,N);
 Ts0_sim=zeros(1,N);
 Ds0_sim=zeros(1,N);
for tt=1:1:N;  
    syms z;
TR=z^Ttr;      %式18

tao_sim(1,tt)=TransmissionProbability_Sim(1,tt)+tao1(1,tt)+tao2(1,tt)+tao3(1,tt);


PK_sim(1,tt)=(1-tao_sim(1,tt))^(Ncs(1,tt)-1);
pb0_sim(1,tt)=1-(PK_sim(1,tt)*(1-w1(1,tt))*(1-w2(1,tt))*(1-w3(1,tt)))^(A0+1);


 H0_frozen=z^(Ttr+AIFS0);
H0=(1-pb0_sim(1,tt))*(z^slot_time)/(1-pb0_sim(1,tt)*H0_frozen);%式19,每一个状态的平均时间
 B0_0_sim=0;
 %求B0,0(Z)
  for i=0:W0_0-1;
      B0_0_sim=B0_0_sim+(1/W0_0)*(H0)^i;         %式20
  end
  PTs0_sim=TR*B0_0_sim;                          %式21，求PTs0
  diff0_0=diff(PTs0_sim);   %一阶导  
  diff0_1=diff(PTs0_sim,z,2);%二阶导           %求均值、方差          %式22,均值
  
  Ts0_sim(1,tt)=subs(diff0_0,z,1);      %AC0时延均值
  Ds0_sim(1,tt)=subs(diff0_1,z,1)+Ts0_sim(1,tt)-(Ts0_sim(1,tt))^2; %方差
 
end
%  Ts0_sim=Ts0_sim(Ts0_sim~=0);
%  Ds0_sim=Ds0_sim(Ds0_sim~=0);
 
 
 
 
 
%  save('Ncs.mat','Ncs');
%  save('tao0.mat','tao0');
%  save('tao1.mat','tao1');
%  save('w1.mat','w1');
%  save('pb1.mat','pb1');
%  save('Ts0.mat','Ts0');
%  save('Ds0.mat','Ds0'); 
%  save('TransmissionProbability_Sim.mat','TransmissionProbability_Sim'); 
%  save('Ts0_sim.mat','Ts0_sim'); 
%  save('Ds0_sim.mat','Ds0_sim');  
%  
 

%————————————————仿真AC1——————————————%
TransmissionProbability_Sim_1=zeros(1,N+1);
CollisionProbability_Sim_1=zeros(1,N+1);
 
n_1=0;
for tt=1:1:N;
Counter_1=0;           
TotalTimeInSeconds_1=1.3;%总仿真时间，单位：秒   Ncs没去掉自身%%这个是为什么
Start_1 = 0;      
ArrivalTime_1 = 1:Ncs(1,tt);       %新数据包到无线节点发送缓冲区的时间
PacketLength_1 = 1:Ncs(1,tt);     %到无线节点发送缓冲区的新数据包大小
HasPacket_1 = zeros(1,Ncs(1,tt));
CW_1 = 1:Ncs(1,tt);
BackoffTimer_1 = 1:Ncs(1,tt);
cc = 1:Ncs(1,tt);
PacketBuff_1 = zeros(Ncs(1,tt),5001); %无线节点发送缓冲区各数据包大小矩阵
CollitionStations_1 = zeros(1,Ncs(1,tt)+1);  %冲突站点号向量
SlotTime_1 = 13*10^(-6);      %时隙间隔=50us
TotalTime_1 = floor(TotalTimeInSeconds_1/SlotTime_1);  %总仿真时间，单位：slot
CurBufferSize_1 = zeros(1,Ncs(1,tt)); %当前发送帧长
ChannelBusy_1=zeros(1,TotalTime_1);
Transmissionnum_1=0;
Collisionnum_1=0;

%初始化
for i = 1:Ncs(1,tt)
    ArrivalTime_1(i) = 1;  %初始化到达时间  
%    PacketLength(i) = 164;%初始化分组长度
    CW_1(i) = W1_0-1; %竞争窗口，CW = 32 slots
    BackoffTimer_1(i) = W1_0; %退避时间用 1200 slots来代表无穷大
end

for t = 1:TotalTime_1%总仿真时隙
    for i = 1:Ncs(1,tt)%%%当前时隙下，目标范围内车辆数
    %更新发送缓冲区
        if t == ArrivalTime_1(i)
            cc(i)=0;
            %目前不能发送，push分组进PackeBuff，修改退避计数器
            if(rand<=p1(1,tt)) %%%p1(1,tt)至少有一个包在等待的概率；有包的概率
                PacketLength_1(i) = 164;
                PacketBuff_1 = Push(PacketBuff_1,i,PacketLength_1(i));%无线节点发送缓冲区各数据包大小矩阵？？？？？？？？？
            %Push新数据包
                CurBufferSize_1(i) = CurBufferSize_1(i) + PacketLength_1(i);%当前发送帧长
                HasPacket_1(i) = 1;%有包
                BackoffTimer_1(i) = RandSel(CW_1(i));%退避计数器达到最大1200时，重置退避计数器               
            else %%%无包的概率
                BackoffTimer_1(i) = RandSel(CW_1(i));
            end
            %ArrivalTime(i) = 1 + PacketLength(i) + t;
            %下一个数据包的到达时间
            Counter_1=Counter_1+1;           
        end
    end

    for i = 1:Ncs(1,tt)
        if HasPacket_1(i) == 1  %PackeBuff中有数据包发送并且信道空闲 %%%==0时没有再检测了？？？？
            if BackoffTimer_1(i) == 0 %退避时间=0则发送,P[(0,k)e|(i,0)] P[(0.k)|(i,0)] P[(min(i+1,m),k|(i,0))]
                if(rand>w0(1,tt))%%%%%%%%不发生内部碰撞，AC1正常传输
                    Transmissionnum_1=Transmissionnum_1+1;
                    Counter_1=Counter_1+1;          
                    CollitionStations_1 = Add(CollitionStations_1,i);%加入冲突站点序列中            
                    Start_1 = 1; 
                else      %%%不丢包，翻倍
                    if (cc(i)<=1)
                    CW_1(i) = Increase(CW_1,i,W1_0);%%竞争窗口加倍
                    BackoffTimer_1(i) = RandSel(CW_1(i));
                    Counter_1=Counter_1+1; 
                    cc(i)=cc(i)+1;
                     continue;
                    else %%%丢包%%%%%%%%%%%这里格外注意：到底转到哪里？？？？
                        cc(i)=0;
                        CW_1(i)=W1_0;
                        PacketBuff_1 = Pop(PacketBuff_1,i);
                        if (PacketBuff_1(i,1)==0)%%%若丢弃之后，是无包
                            ArrivalTime_1(i) = 1 + t;
                            BackoffTimer_1(i) = RandSel(CW_1(i));
                            HasPacket_1(i) =0;
                            Counter_1=Counter_1+1; 
                            continue;
                        else
                            BackoffTimer_1(i) = RandSel(CW_1(i));
                            Counter_1=Counter_1+1; 
                            continue;
                        end
                        
                    end
                end
                
            elseif BackoffTimer_1(i) == 1%退避时间=0则 退避时间-1,P[(i,k-1)|(i,k)]=1
                if(Start_1==0)%信道空闲
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;
                    Counter_1=Counter_1+1;
                    ChannelBusy_1(1,t+1)=1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);
                    Counter_1=Counter_1+1;
                end
            else
                if(Start_1==0)
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;
                    Counter_1=Counter_1+1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);
                    Counter_1=Counter_1+1;
                end
            end
        elseif HasPacket_1(i) == 0 
            if BackoffTimer_1(i) == 0%退避时间=0则发送
                    if (rand>Pa1)% P[(0,0)e|(0,0)e]%pa0包的到达概率%%%?????这不是无包到达么
                        BackoffTimer_1(i) = 0;
                        Counter_1=Counter_1+1;
                    else %|P[(0,k)e|(0,0)e] P[(1,k)|(0,0)e]
                        HasPacket_1(i)=1;
                        PacketLength_1(i) = 164;                 
                        PacketBuff_1 = Push(PacketBuff_1,i,PacketLength_1(i));                  
                        CurBufferSize_1(i) = CurBufferSize_1(i) + PacketLength_1(i);                                                                      
                            BackoffTimer_1(i) = RandSel(W1_0);
                            Counter_1=Counter_1+1;
                    end
            else
                if(Start_1==0)
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;%退避时间=0则 退避时间-1 P[(0,k-1)e|(0,k)e] P[(0,k-1)|(0,k)e]
                    Counter_1=Counter_1+1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);%退避时间=0则 退避时间-1 P[(0,k-1)e|(0,k)e] P[(0,k-1)|(0,k)e]
                    Counter_1=Counter_1+1;
                end
            end
        end
    end

    if Start_1 == 1%%%%由于范围内节点发包，信道改为忙碌
        n_c_1 = CollitionStations_1(1);%%%当前正在发包节点数
        if n_c_1 == 1%信道中只有一个站点发送数据则为正常发送情况
          %  DeferenceTime = floor(t + 1);
            %PacketBuff(CollitionStations(2),2)数据长度
            %成功发送时间
            n_c_1 = CollitionStations_1(2);         
            CurBufferSize_1(n_c_1) = CurBufferSize_1(n_c_1) - PacketBuff_1(n_c_1,2);
            PacketBuff_1 = Pop(PacketBuff_1,n_c_1);
            CW_1(n_c_1) = W1_0;
            k_1 = PacketBuff_1(n_c_1,1);
            if k_1 ==0%如果没有数据等待发送，将HasPacke置0，BackoffTimer置Max
                ArrivalTime_1(n_c_1) = 1 + t;
                HasPacket_1(n_c_1) = 0;
                BackoffTimer_1(n_c_1) = RandSel(CW_1(n_c_1));
                Counter_1=Counter_1+1;
            else%还有数据分发送，修改碰撞计数器
                BackoffTimer_1(n_c_1) = RandSel(CW_1(n_c_1));
                 Counter_1=Counter_1+1;
            end    
        else
            %发生碰撞要加上最大的冲突数据时间段
            n_c_1 = CollitionStations_1(1);
            for i = 1:n_c_1
                j = CollitionStations_1(i+1);
                CW_1(j) = W1_0;
                BackoffTimer_1(j) = RandSel(CW_1(j));
                Counter_1=Counter_1+1;
                Collisionnum_1=Collisionnum_1+1;
            end    
        end
        Start_1=0;%信道恢复空闲         
        CollitionStations_1 = zeros(1,Ncs(1,tt)+1);
    end 
end
TransmissionProbability_Sim_1(1,tt)=(Transmissionnum_1)/Counter_1;
CollisionProbability_Sim_1(1,tt)=(Collisionnum_1)/Transmissionnum_1;
n_1=n_1 +1
end

 tao_sim1=zeros(1,N);
 PK_sim1=zeros(1,N);
 pb0_sim1=zeros(1,N);

 pb1_sim1=zeros(1,N);
 Ts1_sim=zeros(1,N);
 Ds1_sim=zeros(1,N);

for tt=1:1:N;  
    syms z;
TR=z^Ttr;      %式18

tao_sim1(1,tt)=TransmissionProbability_Sim_1(1,tt)+tao0(1,tt)+tao2(1,tt)+tao3(1,tt);

PK_sim1(1,tt)=(1-tao_sim1(1,tt))^(Ncs(1,tt)-1);

pb1_sim1(1,tt)=1-(PK_sim1(1,tt)*(1-w0(1,tt))*(1-w2(1,tt))*(1-w3(1,tt)))^(A1+1);


  
 %——————————————————AC1————————————————%
   H1_frozen=z^(Ttr+AIFS1);
H1=(1-pb1_sim1(1,tt))*(z^slot_time)/(1-pb1_sim1(1,tt)*H1_frozen);%式19,每一个状态的平均时间

  B1_0_sim=0;
 %求B1,0(Z)
  for i=0:W1_0-1;
      B1_0_sim=B1_0_sim+(1/W1_0)*(H1)^i;         %式20
  end 
  
    B1_1_sim=0;
 %求B1,1(Z)
  for i=0:W1_1-1;
      B1_1_sim=B1_1_sim+(1/W1_1)*(H1)^i;         %式20
  end 
  
B1_2_sim=B1_1_sim;
%   B1_3=B1_1;
%   B1_4=B1_1;
%    B1_5=B1_1;
       
   
   PTs1_sim=(1-w0(1,tt))*TR*(B1_0_sim+w0(1,tt)*B1_0_sim*B1_1_sim+((w0(1,tt))^2)*B1_0_sim*B1_1_sim*B1_2_sim)+((w0(1,tt))^(L1+1))*B1_0_sim*B1_1_sim*B1_2_sim;
   diff1_0=diff(PTs1_sim);   %一阶导  
   diff1_1=diff(PTs1_sim,2);%二阶导           %求均值、方差          %式22,均值
   
   Ts1_sim(1,tt)=subs(diff1_0,z,1);      %AC0时延均值，单位：秒
   Ds1_sim(1,tt)=subs(diff1_1,z,1)+Ts1_sim(1,tt)-(Ts1_sim(1,tt))^2; %方差   


end



%————————————————仿真AC2——————————————%
TransmissionProbability_Sim_2=zeros(1,N+1);
CollisionProbability_Sim_2=zeros(1,N+1);
 
n_2=0;
for tt=1:1:N;
Counter_1=0;           
TotalTimeInSeconds_1=1.3;%总仿真时间，单位：秒   Ncs没去掉自身%%这个是为什么
Start_1 = 0;      
ArrivalTime_1 = 1:Ncs(1,tt);       %新数据包到无线节点发送缓冲区的时间
PacketLength_1 = 1:Ncs(1,tt);     %到无线节点发送缓冲区的新数据包大小
HasPacket_1 = zeros(1,Ncs(1,tt));
CW_2 = 1:Ncs(1,tt);
BackoffTimer_1 = 1:Ncs(1,tt);
cc = 1:Ncs(1,tt);
PacketBuff_1 = zeros(Ncs(1,tt),5001); %无线节点发送缓冲区各数据包大小矩阵
CollitionStations_1 = zeros(1,Ncs(1,tt)+1);  %冲突站点号向量
SlotTime_1 = 13*10^(-6);      %时隙间隔=50us
TotalTime_1 = floor(TotalTimeInSeconds_1/SlotTime_1);  %总仿真时间，单位：slot
CurBufferSize_1 = zeros(1,Ncs(1,tt)); %当前发送帧长
ChannelBusy_1=zeros(1,TotalTime_1);
Transmissionnum_1=0;
Collisionnum_1=0;

%初始化
for i = 1:Ncs(1,tt)
    ArrivalTime_1(i) = 1;  %初始化到达时间  
%    PacketLength(i) = 164;%初始化分组长度
    CW_2(i) = W2_0; %竞争窗口，CW = 32 slots
    BackoffTimer_1(i) = W2_0-1; %退避时间用 1200 slots来代表无穷大
end

for t = 1:TotalTime_1%总仿真时隙
    for i = 1:Ncs(1,tt)%%%当前时隙下，目标范围内车辆数
    %更新发送缓冲区
        if t == ArrivalTime_1(i)
            cc(i)=0;
            %目前不能发送，push分组进PackeBuff，修改退避计数器
            if(rand<=p1(1,tt)) %%%p1(1,tt)至少有一个包在等待的概率；有包的概率
                PacketLength_1(i) = 164;
                PacketBuff_1 = Push(PacketBuff_1,i,PacketLength_1(i));%无线节点发送缓冲区各数据包大小矩阵？？？？？？？？？
            %Push新数据包
                CurBufferSize_1(i) = CurBufferSize_1(i) + PacketLength_1(i);%当前发送帧长
                HasPacket_1(i) = 1;%有包
                BackoffTimer_1(i) = RandSel(CW_2(i));%退避计数器达到最大1200时，重置退避计数器               
            else %%%无包的概率
                BackoffTimer_1(i) = RandSel(CW_2(i));
            end
            %ArrivalTime(i) = 1 + PacketLength(i) + t;
            %下一个数据包的到达时间
            Counter_1=Counter_1+1;           
        end
    end

    for i = 1:Ncs(1,tt)
        if HasPacket_1(i) == 1  %PackeBuff中有数据包发送并且信道空闲 %%%==0时没有再检测了？？？？
            if BackoffTimer_1(i) == 0 %退避时间=0则发送,P[(0,k)e|(i,0)] P[(0.k)|(i,0)] P[(min(i+1,m),k|(i,0))]
                if(rand>w1(1,tt))%%%%%%%%不发生内部碰撞，AC1正常传输
                    Transmissionnum_1=Transmissionnum_1+1;
                    Counter_1=Counter_1+1;          
                    CollitionStations_1 = Add(CollitionStations_1,i);%加入冲突站点序列中            
                    Start_1 = 1; 
                else      %%%不丢包，翻倍
                    if (cc(i)<=1)
                    CW_2(i) = Increase(CW_2,i,W2_0);%%竞争窗口加倍
                    BackoffTimer_1(i) = RandSel(CW_2(i));
                    Counter_1=Counter_1+1; 
                    cc(i)=cc(i)+1;
                     continue;
                    else %%%丢包%%%%%%%%%%%这里格外注意：到底转到哪里？？？？
                        cc(i)=0;
                        CW_2(i)=W2_0;
                        PacketBuff_1 = Pop(PacketBuff_1,i);
                        if (PacketBuff_1(i,1)==0)%%%若丢弃之后，是无包
                            ArrivalTime_1(i) = 1 + t;
                            BackoffTimer_1(i) = RandSel(CW_2(i));
                            HasPacket_1(i) =0;
                            Counter_1=Counter_1+1; 
                            continue;
                        else
                            BackoffTimer_1(i) = RandSel(CW_2(i));
                            Counter_1=Counter_1+1; 
                            continue;
                        end
                        
                    end
                end
                
            elseif BackoffTimer_1(i) == 1%退避时间=0则 退避时间-1,P[(i,k-1)|(i,k)]=1
                if(Start_1==0)%信道空闲
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;
                    Counter_1=Counter_1+1;
                    ChannelBusy_1(1,t+1)=1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);
                    Counter_1=Counter_1+1;
                end
            else
                if(Start_1==0)
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;
                    Counter_1=Counter_1+1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);
                    Counter_1=Counter_1+1;
                end
            end
        elseif HasPacket_1(i) == 0 
            if BackoffTimer_1(i) == 0%退避时间=0则发送
                    if (rand>Pa2)% P[(0,0)e|(0,0)e]%pa0包的到达概率%%%?????这不是无包到达么
                        BackoffTimer_1(i) = 0;
                        Counter_1=Counter_1+1;
                    else %|P[(0,k)e|(0,0)e] P[(1,k)|(0,0)e]
                        HasPacket_1(i)=1;
                        PacketLength_1(i) = 164;                 
                        PacketBuff_1 = Push(PacketBuff_1,i,PacketLength_1(i));                  
                        CurBufferSize_1(i) = CurBufferSize_1(i) + PacketLength_1(i);                                                                      
                            BackoffTimer_1(i) = RandSel(W2_0);
                            Counter_1=Counter_1+1;
                    end
            else
                if(Start_1==0)
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;%退避时间=0则 退避时间-1 P[(0,k-1)e|(0,k)e] P[(0,k-1)|(0,k)e]
                    Counter_1=Counter_1+1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);%退避时间=0则 退避时间-1 P[(0,k-1)e|(0,k)e] P[(0,k-1)|(0,k)e]
                    Counter_1=Counter_1+1;
                end
            end
        end
    end

    if Start_1 == 1%%%%由于范围内节点发包，信道改为忙碌
        n_c_1 = CollitionStations_1(1);%%%当前正在发包节点数
        if n_c_1 == 1%信道中只有一个站点发送数据则为正常发送情况
          %  DeferenceTime = floor(t + 1);
            %PacketBuff(CollitionStations(2),2)数据长度
            %成功发送时间
            n_c_1 = CollitionStations_1(2);         
            CurBufferSize_1(n_c_1) = CurBufferSize_1(n_c_1) - PacketBuff_1(n_c_1,2);
            PacketBuff_1 = Pop(PacketBuff_1,n_c_1);
            CW_2(n_c_1) = W2_0;
            k_1 = PacketBuff_1(n_c_1,1);
            if k_1 ==0%如果没有数据等待发送，将HasPacke置0，BackoffTimer置Max
                ArrivalTime_1(n_c_1) = 1 + t;
                HasPacket_1(n_c_1) = 0;
                BackoffTimer_1(n_c_1) = RandSel(CW_2(n_c_1));
                Counter_1=Counter_1+1;
            else%还有数据分发送，修改碰撞计数器
                BackoffTimer_1(n_c_1) = RandSel(CW_2(n_c_1));
                 Counter_1=Counter_1+1;
            end    
        else
            %发生碰撞要加上最大的冲突数据时间段
            n_c_1 = CollitionStations_1(1);
            for i = 1:n_c_1
                j = CollitionStations_1(i+1);
                CW_2(j) = W2_0;
                BackoffTimer_1(j) = RandSel(CW_2(j));
                Counter_1=Counter_1+1;
                Collisionnum_1=Collisionnum_1+1;
            end    
        end
        Start_1=0;%信道恢复空闲         
        CollitionStations_1 = zeros(1,Ncs(1,tt)+1);
    end 
end
TransmissionProbability_Sim_2(1,tt)=(Transmissionnum_1)/Counter_1;
CollisionProbability_Sim_2(1,tt)=(Collisionnum_1)/Transmissionnum_1;
n_2=n_2 +1
end

 tao_sim2=zeros(1,N);
 PK_sim2=zeros(1,N);
 pb2_sim=zeros(1,N);
 Ts2_sim=zeros(1,N);
 Ds2_sim=zeros(1,N);

for tt=1:1:N;  
    syms z;
TR=z^Ttr;      %式18

tao_sim2(1,tt)=TransmissionProbability_Sim_2(1,tt)+tao0(1,tt)+tao1(1,tt)+tao3(1,tt);

PK_sim2(1,tt)=(1-tao_sim2(1,tt))^(Ncs(1,tt)-1);
pb2_sim(1,tt)=1-(PK_sim2(1,tt)*(1-w0(1,tt))*(1-w1(1,tt))*(1-w3(1,tt)))^(A2+1);


  
 %——————————————————AC2————————————————%
    H2_frozen=z^(Ttr+AIFS2);
H2=(1-pb2_sim(1,tt))*(z^slot_time)/(1-pb2_sim(1,tt)*H2_frozen);%式19,每一个状态的平均时间

  B2_0=0;
 %求B2,0(Z)
  for i=0:W2_0-1;
      B2_0=B2_0+(1/W2_0)*(H2)^i;         %式20
  end 
  
    B2_1=0;
 %求B2,1(Z)
  for i=0:W2_1-1;
      B2_1=B2_1+(1/W2_1)*(H2)^i;         %式20
  end 
  
B2_2=B2_1;
%   B1_3=B1_1;
%   B1_4=B1_1;
%    B1_5=B1_1;
   
 PTs2=(1-pv2(1,tt))*TR*(B2_0+pv2(1,tt)*B2_0*B2_1+((pv2(1,tt))^2)*B2_0*B2_1*B2_2)+((pv2(1,tt))^(L2+1))*B2_0*B2_1*B2_2;
 diff2_0=diff(PTs2);   %一阶导  
   diff2_1=diff(PTs2,2);%二阶导           %求均值、方差          %式22,均值
   
   Ts2_sim(1,tt)=subs(diff2_0,z,1);      %AC0时延均值
   Ds2_sim(1,tt)=subs(diff2_1,z,1)+Ts2_sim(1,tt)-(Ts2_sim(1,tt))^2; %方差   


end


%————————————————仿真AC3——————————————%
TransmissionProbability_Sim_3=zeros(1,N+1);
CollisionProbability_Sim_3=zeros(1,N+1);
 
n_3=0;
for tt=1:1:N;
Counter_1=0;           
TotalTimeInSeconds_1=1.3;%总仿真时间，单位：秒   Ncs没去掉自身%%这个是为什么
Start_1 = 0;      
ArrivalTime_1 = 1:Ncs(1,tt);       %新数据包到无线节点发送缓冲区的时间
PacketLength_1 = 1:Ncs(1,tt);     %到无线节点发送缓冲区的新数据包大小
HasPacket_1 = zeros(1,Ncs(1,tt));
CW_3 = 1:Ncs(1,tt);
BackoffTimer_1 = 1:Ncs(1,tt);
cc = 1:Ncs(1,tt);
PacketBuff_1 = zeros(Ncs(1,tt),5001); %无线节点发送缓冲区各数据包大小矩阵
CollitionStations_1 = zeros(1,Ncs(1,tt)+1);  %冲突站点号向量
SlotTime_1 = 13*10^(-6);      %时隙间隔=50us
TotalTime_1 = floor(TotalTimeInSeconds_1/SlotTime_1);  %总仿真时间，单位：slot
CurBufferSize_1 = zeros(1,Ncs(1,tt)); %当前发送帧长
ChannelBusy_1=zeros(1,TotalTime_1);
Transmissionnum_1=0;
Collisionnum_1=0;

%初始化
for i = 1:Ncs(1,tt)
    ArrivalTime_1(i) = 1;  %初始化到达时间  
%    PacketLength(i) = 164;%初始化分组长度
    CW_3(i) = W3_0; %竞争窗口，CW = 32 slots
    BackoffTimer_1(i) = W3_0-1; %退避时间用 1200 slots来代表无穷大
end

for t = 1:TotalTime_1%总仿真时隙
    for i = 1:Ncs(1,tt)%%%当前时隙下，目标范围内车辆数
    %更新发送缓冲区
        if t == ArrivalTime_1(i)
            cc(i)=0;
            %目前不能发送，push分组进PackeBuff，修改退避计数器
            if(rand<=p3(1,tt)) %%%p1(1,tt)至少有一个包在等待的概率；有包的概率
                PacketLength_1(i) = 164;
                PacketBuff_1 = Push(PacketBuff_1,i,PacketLength_1(i));%无线节点发送缓冲区各数据包大小矩阵？？？？？？？？？
            %Push新数据包
                CurBufferSize_1(i) = CurBufferSize_1(i) + PacketLength_1(i);%当前发送帧长
                HasPacket_1(i) = 1;%有包
                BackoffTimer_1(i) = RandSel(CW_3(i));%退避计数器达到最大1200时，重置退避计数器               
            else %%%无包的概率
                BackoffTimer_1(i) = RandSel(CW_3(i));
            end
            %ArrivalTime(i) = 1 + PacketLength(i) + t;
            %下一个数据包的到达时间
            Counter_1=Counter_1+1;           
        end
    end

    for i = 1:Ncs(1,tt)
        if HasPacket_1(i) == 1  %PackeBuff中有数据包发送并且信道空闲 %%%==0时没有再检测了？？？？
            if BackoffTimer_1(i) == 0 %退避时间=0则发送,P[(0,k)e|(i,0)] P[(0.k)|(i,0)] P[(min(i+1,m),k|(i,0))]
                if(rand>w3(1,tt))%%%%%%%%不发生内部碰撞，AC1正常传输
                    Transmissionnum_1=Transmissionnum_1+1;
                    Counter_1=Counter_1+1;          
                    CollitionStations_1 = Add(CollitionStations_1,i);%加入冲突站点序列中            
                    Start_1 = 1; 
                else      %%%不丢包，翻倍
                    if (cc(i)<=1)
                    CW_3(i) = Increase(CW_3,i,W3_0);%%竞争窗口加倍
                    BackoffTimer_1(i) = RandSel(CW_3(i));
                    Counter_1=Counter_1+1; 
                    cc(i)=cc(i)+1;
                     continue;
                    else %%%丢包%%%%%%%%%%%这里格外注意：到底转到哪里？？？？
                        cc(i)=0;
                        CW_3(i)=W3_0;
                        PacketBuff_1 = Pop(PacketBuff_1,i);
                        if (PacketBuff_1(i,1)==0)%%%若丢弃之后，是无包
                            ArrivalTime_1(i) = 1 + t;
                            BackoffTimer_1(i) = RandSel(CW_3(i));
                            HasPacket_1(i) =0;
                            Counter_1=Counter_1+1; 
                            continue;
                        else
                            BackoffTimer_1(i) = RandSel(CW_3(i));
                            Counter_1=Counter_1+1; 
                            continue;
                        end
                        
                    end
                end
                
            elseif BackoffTimer_1(i) == 1%退避时间=0则 退避时间-1,P[(i,k-1)|(i,k)]=1
                if(Start_1==0)%信道空闲
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;
                    Counter_1=Counter_1+1;
                    ChannelBusy_1(1,t+1)=1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);
                    Counter_1=Counter_1+1;
                end
            else
                if(Start_1==0)
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;
                    Counter_1=Counter_1+1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);
                    Counter_1=Counter_1+1;
                end
            end
        elseif HasPacket_1(i) == 0 
            if BackoffTimer_1(i) == 0%退避时间=0则发送
                    if (rand>Pa3)% P[(0,0)e|(0,0)e]%pa0包的到达概率%%%?????这不是无包到达么
                        BackoffTimer_1(i) = 0;
                        Counter_1=Counter_1+1;
                    else %|P[(0,k)e|(0,0)e] P[(1,k)|(0,0)e]
                        HasPacket_1(i)=1;
                        PacketLength_1(i) = 164;                 
                        PacketBuff_1 = Push(PacketBuff_1,i,PacketLength_1(i));                  
                        CurBufferSize_1(i) = CurBufferSize_1(i) + PacketLength_1(i);                                                                      
                            BackoffTimer_1(i) = RandSel(W3_0);
                            Counter_1=Counter_1+1;
                    end
            else
                if(Start_1==0)
                    BackoffTimer_1(i) = BackoffTimer_1(i) - 1;%退避时间=0则 退避时间-1 P[(0,k-1)e|(0,k)e] P[(0,k-1)|(0,k)e]
                    Counter_1=Counter_1+1;
                else
                    BackoffTimer_1(i) = BackoffTimer_1(i);%退避时间=0则 退避时间-1 P[(0,k-1)e|(0,k)e] P[(0,k-1)|(0,k)e]
                    Counter_1=Counter_1+1;
                end
            end
        end
    end

    if Start_1 == 1%%%%由于范围内节点发包，信道改为忙碌
        n_c_1 = CollitionStations_1(1);%%%当前正在发包节点数
        if n_c_1 == 1%信道中只有一个站点发送数据则为正常发送情况
          %  DeferenceTime = floor(t + 1);
            %PacketBuff(CollitionStations(2),2)数据长度
            %成功发送时间
            n_c_1 = CollitionStations_1(2);         
            CurBufferSize_1(n_c_1) = CurBufferSize_1(n_c_1) - PacketBuff_1(n_c_1,2);
            PacketBuff_1 = Pop(PacketBuff_1,n_c_1);
            CW_3(n_c_1) = W3_0;
            k_1 = PacketBuff_1(n_c_1,1);
            if k_1 ==0%如果没有数据等待发送，将HasPacke置0，BackoffTimer置Max
                ArrivalTime_1(n_c_1) = 1 + t;
                HasPacket_1(n_c_1) = 0;
                BackoffTimer_1(n_c_1) = RandSel(CW_3(n_c_1));
                Counter_1=Counter_1+1;
            else%还有数据分发送，修改碰撞计数器
                BackoffTimer_1(n_c_1) = RandSel(CW_3(n_c_1));
                 Counter_1=Counter_1+1;
            end    
        else
            %发生碰撞要加上最大的冲突数据时间段
            n_c_1 = CollitionStations_1(1);
            for i = 1:n_c_1
                j = CollitionStations_1(i+1);
                CW_3(j) = W3_0;
                BackoffTimer_1(j) = RandSel(CW_3(j));
                Counter_1=Counter_1+1;
                Collisionnum_1=Collisionnum_1+1;
            end    
        end
        Start_1=0;%信道恢复空闲         
        CollitionStations_1 = zeros(1,Ncs(1,tt)+1);
    end 
end
TransmissionProbability_Sim_3(1,tt)=(Transmissionnum_1)/Counter_1;
CollisionProbability_Sim_3(1,tt)=(Collisionnum_1)/Transmissionnum_1;
n_3=n_3 +1
end

 tao_sim3=zeros(1,N);
 PK_sim3=zeros(1,N);


 pb3_sim=zeros(1,N);
 Ts3_sim=zeros(1,N);
 Ds3_sim=zeros(1,N);

for tt=1:1:N;  
    syms z;
TR=z^Ttr;      %式18

tao_sim3(1,tt)=TransmissionProbability_Sim_3(1,tt)+tao0(1,tt)+tao1(1,tt)+tao2(1,tt);

PK_sim3(1,tt)=(1-tao_sim3(1,tt))^(Ncs(1,tt)-1);

pb3_sim(1,tt)=1-(PK_sim3(1,tt)*(1-w0(1,tt))*(1-w1(1,tt))*(1-w2(1,tt)))^(A3+1);


  
   %——————————————————AC3————————————————%
   H3_frozen=z^(Ttr+AIFS3);
H3=(1-pb3_sim(1,tt))*(z^slot_time)/(1-pb3_sim(1,tt)*H3_frozen);%式19,每一个状态的平均时间

  B3_0=0;
 %求B3,0(Z)
  for i=0:W3_0-1;
      B3_0=B3_0+(1/W3_0)*(H3)^i;         %式20
  end 
  
    B3_1=0;
 %求B3,1(Z)
  for i=0:W3_1-1;
      B3_1=B3_1+(1/W3_1)*(H3)^i;         %式20
  end 
  
   B3_2=0;
 %求B3,2(Z)
  for i=0:W3_2-1;
      B3_2=B3_2+(1/W3_2)*(H3)^i;         %式20
  end 
  
   B3_3=0;
 %求B3,3(Z)
  for i=0:W3_3-1;
      B3_3=B3_3+(1/W3_3)*(H3)^i;         %式20
  end 
  
   B3_4=0;
 %求B3,4(Z)
  for i=0:W3_4-1;
      B3_4=B3_4+(1/W3_4)*(H3)^i;         %式20
  end
  
  B3_5=0;
 %求B3,5(Z)
  for i=0:W3_5-1;
      B3_5=B3_5+(1/W3_5)*(H3)^i;         %式20
  end     
  
    B3_6=0;
 %求B3,6(Z)
  for i=0:W3_6-1;
      B3_6=B3_6+(1/W3_6)*(H3)^i;         %式20
  end     
  
  
B3_7=B3_6;

   
 PTs3=(1-pv3(1,tt))*TR*(B3_0+pv3(1,tt)*B3_0*B3_1+((pv3(1,tt))^2)*B3_0*B3_1*B3_2+((pv3(1,tt))^3)*B3_0*B3_1*B3_2*B3_3+((pv3(1,tt))^4)*B3_0*B3_1*B3_2*B3_3*B3_4+((pv3(1,tt))^5)*B3_0*B3_1*B3_2*B3_3*B3_4*B3_5+((pv3(1,tt))^6)*B3_0*B3_1*B3_2*B3_3*B3_4*B3_5*B3_6+((pv3(1,tt))^7)*B3_0*B3_1*B3_2*B3_3*B3_4*B3_5*B3_6*B3_7)+((pv3(1,tt))^(L3+1))*B3_0*B3_1*B3_2*B3_3*B3_4*B3_5*B3_6*B3_7;
 diff3_0=diff(PTs3);   %一阶导  
   diff3_1=diff(PTs3,2);%二阶导           %求均值、方差          %式22,均值
   
   Ts3_sim(1,tt)=subs(diff3_0,z,1);      %AC0时延均值
   Ds3_sim(1,tt)=subs(diff3_1,z,1)+Ts3_sim(1,tt)-(Ts3_sim(1,tt))^2; %方差   

  
end
































 save('Ts0_sim.mat','Ts0_sim'); 
 save('Ds0_sim.mat','Ds0_sim');  
 save('Ts1_sim.mat','Ts1_sim'); 
 save('Ds1_sim.mat','Ds1_sim');  
 save('Ts2_sim.mat','Ts2_sim'); 
 save('Ds2_sim.mat','Ds2_sim');  
 save('Ts3_sim.mat','Ts3_sim'); 
 save('Ds3_sim.mat','Ds3_sim');  
 
 
 
%%---AC0----%%
u_0_sim=zeros(1,N);
c_0_sim=zeros(1,N);
Yt0_sim=zeros(1,N);
Dt0_sim=zeros(1,N);
x0=zeros(1,N);
x0(1,1)=0.005;
xt_sim=cell(N,2);
Xt_sim=zeros(1,N);

 for i=1:1:N
    u_0_sim(1,i)=1/Ts0_sim(1,i);  
    c_0_sim(1,i)=u_0_sim(1,i)*sqrt(Ds0_sim(1,i)); 
    [t,xt_sim{i,1}]=ode45('fun0',[(i-1)*0.1,i*0.1],x0(1,i),[],c_0_sim(1,i),u_0_sim(1,i));
    xtt=xt_sim{i,1};
    
    Xt_sim(1,i+1)=xtt(length(xtt),1);
%     Xt(1,i)=xtt(length(xtt),1);

%     Yt(1,i)=-(xtt(length(xtt),1)+1-sqrt((xtt(length(xtt),1))^2+2*(c_0(1,i))^2*xtt(length(xtt),1)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
if(i>1)
    if(Ts0_sim(1,i)~=Ts0_sim(1,i-1))
        Yt0_sim(1,i)=-(x0(1,i)+1-sqrt((x0(1,i))^2+2*(c_0_sim(1,i))^2*x0(1,i)+1))/(1-(c_0_sim(1,i))^2)*u_0_sim(1,i)+lambda0;
    else
        Yt0_sim(1,i)=0;
    end
else
    Yt0_sim(1,i)=-(x0(1,i)+1-sqrt((x0(1,i))^2+2*(c_0_sim(1,i))^2*x0(1,i)+1))/(1-(c_0_sim(1,i))^2)*u_0_sim(1,i)+lambda0;
end
    if(i>1)         
            Dt0_sim(1,i)=Yt0_sim(1,i)/lambda0*0.1+Dt0_sim(1,i-1);
    else
        Dt0_sim(1,i)=xtt(length(xtt),1)/lambda0;
    end
%     x0(1,i+1)=xt{i,1}(length(xtt),1);
x0(1,i+1)=xt_sim{i,1}(length(xtt),1);
 end


 
 

%%---AC1---%%
 
u_1_sim=zeros(1,N);
c_1_sim=zeros(1,N);
Yt1_sim=zeros(1,N);
Dt1_sim=zeros(1,N);
x1=zeros(1,N);
x1(1,1)=0.005;
xt1_sim=cell(N,2);
Xt1_sim=zeros(1,N);

 for i=1:1:N
    u_1_sim(1,i)=1/Ts1_sim(1,i);  
    c_1_sim(1,i)=u_1_sim(1,i)*sqrt(Ds1_sim(1,i)); 
    [t,xt1_sim{i,1}]=ode45('fun1',[(i-1)*0.1,i*0.1],x1(1,i),[],c_1_sim(1,i),u_1_sim(1,i));
    xtt1=xt1_sim{i,1};
    
    Xt1_sim(1,i+1)=xtt1(length(xtt1),1);
%     Xt(1,i)=xtt(length(xtt),1);

%     Yt(1,i)=-(xtt(length(xtt),1)+1-sqrt((xtt(length(xtt),1))^2+2*(c_0(1,i))^2*xtt(length(xtt),1)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
if(i>1)
    if(Ts1_sim(1,i)~=Ts1_sim(1,i-1))
        Yt1_sim(1,i)=-(x1(1,i)+1-sqrt((x1(1,i))^2+2*(c_1_sim(1,i))^2*x1(1,i)+1))/(1-(c_1_sim(1,i))^2)*u_1_sim(1,i)+lambda1;
    else
        Yt1_sim(1,i)=0;
    end
else
    Yt1_sim(1,i)=-(x1(1,i)+1-sqrt((x1(1,i))^2+2*(c_1_sim(1,i))^2*x1(1,i)+1))/(1-(c_1_sim(1,i))^2)*u_1_sim(1,i)+lambda1;
end
    if(i>1)         
            Dt1_sim(1,i)=Yt1_sim(1,i)/lambda1*0.1+Dt1_sim(1,i-1);
    else
        Dt1_sim(1,i)=xtt1(length(xtt1),1)/lambda1;
    end
%     x0(1,i+1)=xt{i,1}(length(xtt),1);
x1(1,i+1)=xt1_sim{i,1}(length(xtt1),1);
 end
 
 %%---AC2---%%
 
u_2_sim=zeros(1,N);
c_2_sim=zeros(1,N);
Yt2_sim=zeros(1,N);
Dt2_sim=zeros(1,N);
x2=zeros(1,N);
x2(1,1)=0.005;
xt2_sim=cell(N,2);
Xt2_sim=zeros(1,N);

 for i=1:1:N
    u_2_sim(1,i)=1/Ts2_sim(1,i);  
    c_2_sim(1,i)=u_2_sim(1,i)*sqrt(Ds2_sim(1,i)); 
    [t,xt2_sim{i,1}]=ode45('fun2',[(i-1)*0.1,i*0.1],x2(1,i),[],c_2_sim(1,i),u_2_sim(1,i));
    xtt2=xt2_sim{i,1};
    
    Xt2_sim(1,i+1)=xtt2(length(xtt2),1);
%     Xt(1,i)=xtt(length(xtt),1);

%     Yt(1,i)=-(xtt(length(xtt),1)+1-sqrt((xtt(length(xtt),1))^2+2*(c_0(1,i))^2*xtt(length(xtt),1)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
if(i>1)
    if(Ts2_sim(1,i)~=Ts2_sim(1,i-1))
        Yt2_sim(1,i)=-(x2(1,i)+1-sqrt((x2(1,i))^2+2*(c_2_sim(1,i))^2*x2(1,i)+1))/(1-(c_2_sim(1,i))^2)*u_2_sim(1,i)+lambda2;
    else
        Yt2_sim(1,i)=0;
    end
else
    Yt2_sim(1,i)=-(x2(1,i)+1-sqrt((x2(1,i))^2+2*(c_2_sim(1,i))^2*x2(1,i)+1))/(1-(c_2_sim(1,i))^2)*u_2_sim(1,i)+lambda2;
end
    if(i>1)         
            Dt2_sim(1,i)=Yt2_sim(1,i)/lambda2*0.1+Dt2_sim(1,i-1);
    else
        Dt2_sim(1,i)=xtt2(length(xtt2),1)/lambda2;
    end
%     x0(1,i+1)=xt{i,1}(length(xtt),1);
x2(1,i+1)=xt2_sim{i,1}(length(xtt2),1);
 end
 
 
 
 %%---AC3---%%
 
u_3_sim=zeros(1,N);
c_3_sim=zeros(1,N);
Yt3_sim=zeros(1,N);
Dt3_sim=zeros(1,N);
x3=zeros(1,N);
x3(1,1)=0.005;
xt3_sim=cell(N,2);
Xt3_sim=zeros(1,N);

 for i=1:1:N
    u_3_sim(1,i)=1/Ts3_sim(1,i);  
    c_3_sim(1,i)=u_3_sim(1,i)*sqrt(Ds3_sim(1,i)); 
    [t,xt3_sim{i,1}]=ode45('fun3',[(i-1)*0.1,i*0.1],x3(1,i),[],c_3_sim(1,i),u_3_sim(1,i));
    xtt3=xt3_sim{i,1};
    
    Xt3_sim(1,i+1)=xtt3(length(xtt3),1);
%     Xt(1,i)=xtt(length(xtt),1);

%     Yt(1,i)=-(xtt(length(xtt),1)+1-sqrt((xtt(length(xtt),1))^2+2*(c_0(1,i))^2*xtt(length(xtt),1)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
if(i>1)
    if(Ts3_sim(1,i)~=Ts3_sim(1,i-1))
        Yt3_sim(1,i)=-(x3(1,i)+1-sqrt((x3(1,i))^2+2*(c_3_sim(1,i))^2*x3(1,i)+1))/(1-(c_3_sim(1,i))^2)*u_3_sim(1,i)+lambda3;
    else
        Yt3_sim(1,i)=0;
    end
else
    Yt3_sim(1,i)=-(x3(1,i)+1-sqrt((x3(1,i))^2+2*(c_3_sim(1,i))^2*x3(1,i)+1))/(1-(c_3_sim(1,i))^2)*u_3_sim(1,i)+lambda3;
end
    if(i>1)         
            Dt3_sim(1,i)=Yt3_sim(1,i)/lambda3*0.1+Dt3_sim(1,i-1);
    else
        Dt3_sim(1,i)=xtt3(length(xtt3),1)/lambda3;
    end
%     x0(1,i+1)=xt{i,1}(length(xtt),1);
x3(1,i+1)=xt3_sim{i,1}(length(xtt3),1);
 end
 
 
 
 
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
 PDR0_sim=zeros(1,N);
  f_in1=zeros(1,N);
 f_out1=zeros(1,N);
 PDR1s=zeros((P*Mv),N);
 PDR1x=zeros((P*Mv),N);
 PDR1_sim=zeros(1,N);
   f_in2=zeros(1,N);
 f_out2=zeros(1,N);
 PDR2s=zeros((P*Mv),N);
 PDR2x=zeros((P*Mv),N);
 PDR2_sim=zeros(1,N);
   f_in3=zeros(1,N);
 f_out3=zeros(1,N);
 PDR3s=zeros((P*Mv),N);
 PDR3x=zeros((P*Mv),N);
 PDR3_sim=zeros(1,N);
 
 
 for k=1:1:N;
     f_in0(1,k)=lambda0;
      f_out0(1,k)=u_0_sim(1,k)*p0(1,k);
      f_in1(1,k)=lambda1;
      f_out1(1,k)=u_1_sim(1,k)*p1(1,k);
      f_in2(1,k)=lambda2;
      f_out2(1,k)=u_2_sim(1,k)*p2(1,k);
      f_in3(1,k)=lambda3;
      f_out3(1,k)=u_3_sim(1,k)*p3(1,k);
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
     PDR0_sim(1,k)=PDR0s((P*Mv),k)/PDR0x((P*Mv),k);
     
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
     PDR1_sim(1,k)=PDR1s((P*Mv),k)/PDR1x((P*Mv),k);
     
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
     PDR2_sim(1,k)=PDR2s((P*Mv),k)/PDR2x((P*Mv),k);
     
     
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
     PDR3_sim(1,k)=PDR3s((P*Mv),k)/PDR3x((P*Mv),k);
     
     
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
 

 
 
 
 
PDR0_sim(:,1)=[];
PDR1_sim(:,1)=[]; 
PDR2_sim(:,1)=[];
PDR3_sim(:,1)=[]; 
 

 save('Dt0_sim.mat','Dt0_sim'); 
 save('Dt1_sim.mat','Dt1_sim'); 
 save('Dt2_sim.mat','Dt2_sim'); 
 save('Dt3_sim.mat','Dt3_sim');  
save('PDR0_sim.mat','PDR0_sim'); 
save('PDR1_sim.mat','PDR1_sim'); 
save('PDR2_sim.mat','PDR2_sim'); 
save('PDR3_sim.mat','PDR3_sim'); 

load('Dt0.mat');
load('Dt1.mat');
load('Dt2.mat');
load('Dt3.mat');

load('Ts0.mat');
load('Ts1.mat');
load('Ts2.mat');
load('Ts3.mat');
load('PDR0.mat');
load('PDR1.mat');
load('PDR2.mat');
load('PDR3.mat');


figure(1)
x1=1:1:N;  
plot(0.1*x1,Ts0*1000,'-b');
hold on;
x2=1:1:N;
plot(0.1*x2,Ts1*1000,'-g');
hold on;
x3=1:1:N;  
plot(0.1*x3,Ts2*1000,'-r');
hold on;
x4=1:1:N;
plot(0.1*x4,Ts3*1000,'-y');
hold on;
x1=1:1:N;  
plot(0.1*x1,Ts0_sim*1000,':*b');
hold on;
x2=1:1:N;
plot(0.1*x2,Ts1_sim*1000,':+g');
hold on;
x3=1:1:N;  
plot(0.1*x3,Ts2_sim*1000,':or');
hold on;
x4=1:1:N;
plot(0.1*x4,Ts3_sim*1000,':xy');
title('Ts')
hold on;


figure(2)
x1=1:1:N;  
plot(0.1*x1,Dt0*1000,'-b');
hold on;
x2=1:1:N;
plot(0.1*x2,Dt1*1000,'-g');
hold on;
x3=1:1:N;  
plot(0.1*x3,Dt2*1000,'-r');
hold on;
x4=1:1:N;
plot(0.1*x4,Dt3*1000,'-y');
hold on;
x1=1:1:N;  
plot(0.1*x1,Dt0_sim*1000,':*b');
hold on;
x2=1:1:N;
plot(0.1*x2,Dt1_sim*1000,':+g');
hold on;
x3=1:1:N;  
plot(0.1*x3,Dt2_sim*1000,':or');
hold on;
x4=1:1:N;
plot(0.1*x4,Dt3_sim*1000,':xy');
title('Dt')
hold on;

figure(3)
x1=2:1:N;  
plot(0.1*x1,PDR0,'-b');
hold on;
x2=2:1:N;
plot(0.1*x2,PDR1,'-g');
hold on;
x3=2:1:N;  
plot(0.1*x3,PDR2,'-r');
hold on;
x4=2:1:N;
plot(0.1*x4,PDR3,'-y');
hold on;
x1=2:1:N;  
plot(0.1*x1,PDR0_sim,':*b');
hold on;
x2=2:1:N;
plot(0.1*x2,PDR1_sim,':+g');
hold on;
x3=2:1:N;  
plot(0.1*x3,PDR2_sim,':or');
hold on;
x4=2:1:N;
plot(0.1*x4,PDR3_sim,':xy');
title('PDR')
hold on;

