%%---the scenario of one crossroad------%%

close all;
clear all;

v0=22.352;  %50Ӣ��ÿСʱ22.352��40Ӣ��ÿСʱ17.8816��25Ӣ��ÿСʱ11.176
T0=1.5;
ve=11.176; %ƽ���ٶ�
s0=3;
se=(s0+ve*T0)/(1-(ve/v0)^4)^0.5;
a0=2;
b0=-3;
P=2*3*4;  %��ʼ״̬ǰ�������3*4��������ÿ������2������
Mv=3;   %ÿ������3����
L0=3;   %������3m
d1=3.5*3+6;
d2=3.5;
R1=6+3.5/2;
N=300;
T=N;
t0=0.1;
N1=300;

%%---��ʼ��------%%

V=zeros(P,Mv,T);  %��P�����ӣ�ÿ������Mv�������ٶȸ���ֵ0
Vx=zeros(P,Mv,T);
Vy=zeros(P,Mv,T);
a=zeros(P,Mv,T);
x=zeros(P,Mv,T);   %ÿ�����ĺ������ʼֵ0
y=zeros(P,Mv,T);  %ÿ�������������ʼֵ0
s=zeros(P,Mv,T); 
o=zeros(P,Mv,T); 
kt=ones(P,Mv,T);
kt0=ones(P,Mv,T);
ht=zeros(P*Mv,P*Mv,T);
X=zeros(P*Mv,T);
Y=zeros(P*Mv,T);

for i=1:1:P;   %ÿ������λ�ø���ʼֵ
    for j=1:1:Mv;
        k=1;
        V(i,j,k)=ve;   %��P�����ӣ�ÿ������Mv�������ٶȸ���ֵ
        if(i==1)   %��1�����ӣ�lane1��
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
        if(i==2)   %��2�����ӣ�lane1��
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
        if(i==3)   %��3�����ӣ�lane2��
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
        if(i==4)   %��4�����ӣ�lane2��
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
        if(i==5)   %��5�����ӣ�lane3��
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
        if(i==6)   %��6�����ӣ�lane3��
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
        if(i==7)   %��7�����ӣ�lane4��
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
        if(i==8)   %��8�����ӣ�lane4��
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
        if(i==9)   %��9�����ӣ�lane5��
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
        if(i==10)   %��10�����ӣ�lane5��
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
        if(i==11)   %��11�����ӣ�lane6��
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
        if(i==12)   %��12�����ӣ�lane6��
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
        if(i==13)   %��13�����ӣ�lane7��
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
        if(i==14)   %��14�����ӣ�lane7��
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
        if(i==15)   %��15�����ӣ�lane8��
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
        if(i==16)   %��16�����ӣ�lane8��
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
        if(i==17)   %��17�����ӣ�lane9��
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
        if(i==18)   %��18�����ӣ�lane9��
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
        if(i==19)   %��19�����ӣ�lane10��
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
        if(i==20)   %��20�����ӣ�lane10��
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
        if(i==21)   %��21�����ӣ�lane11��
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
        if(i==22)   %��22�����ӣ�lane11��
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
        if(i==23)   %��23�����ӣ�lane12��
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
        if(i==24)   %��24�����ӣ�lane12��
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



%%---��ת------%%

for k=2:1:N;
    t=0.1*k;
    for i=1:1:P;
        for j=1:1:Mv;
           if(i==3||i==4||i==9||i==10)
            if(i==3)   %��һ�׶�P1,P2������ת��P1
                if(j==1)   %ͷ��
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                     if(V(i,j,k)<ve)
                         a(i,j,k)=a0;
                     elseif(V(i,j,k)==ve)
                         a(i,j,k)=0;
                     else
                         a(i,j,k)=b0;
                     end
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                else        %��Ա��������ģ��
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
                if(j==1)   %ͷ��
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    if(s(i-1,Mv,k)>=(-d1))  %ǰ����ĩ����ת��
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
                        if(abs(s(i,j,k)-s(i-1,Mv,k))>=se)  %����������ڵ���seʱ����ve�ȽϾ������ٶ�
                            if(V(i,j,k)<ve)
                                a(i,j,k)=a0;
                            elseif(V(i,j,k)==ve)
                                a(i,j,k)=0;
                            else
                                a(i,j,k)=b0;
                            end
                        else  %��������С��seʱ������IDM����
                             a(i,j,k)=a0*(1-(V(i,j,k)/v0)^4-((s0+V(i,j,k)*T0+V(i,j,k)*(V(i,j,k)-V(i-1,Mv,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i-1,Mv,k)+L0))^2);
                        end
                    end
                else    %��Ա����
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
            elseif(i==9)   %��һ�׶�P1,P2������ת��P1
                if(j==1)   %ͷ��
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                     if(V(i,j,k)>(-ve))
                         a(i,j,k)=(-a0);
                     elseif(V(i,j,k)==(-ve))
                         a(i,j,k)=0;
                     else
                         a(i,j,k)=(-b0);
                     end
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                else        %��Ա��������ģ��
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)-L0))^2);
                end
                if(s(i,j,k)<=d1)   %ת��ǰ
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
                if(j==1)   %ͷ��
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    if(s(i-1,Mv,k)<=(d1))  %ǰ����ĩ����ת��
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
                        if(abs(s(i,j,k)-s(i-1,Mv,k))>=se)  %����������ڵ���seʱ����ve�ȽϾ������ٶ�
                            if(abs(V(i,j,k))<ve)
                                a(i,j,k)=(-a0);
                            elseif(abs(V(i,j,k))==ve)
                                a(i,j,k)=0;
                            else
                                a(i,j,k)=(-b0);
                            end
                        else  %��������С��seʱ������IDM����
                             a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i-1,Mv,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i-1,Mv,k)-L0))^2);
                        end
                    end
                else    %��Ա����
                    V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                    s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                    a(i,j,k)=-a0*(1-(V(i,j,k)/v0)^4-((s0-V(i,j,k)*T0-V(i,j,k)*(-V(i,j,k)+V(i,j-1,k))/2/sqrt(a0*(-b0)))/(s(i,j,k)-s(i,j-1,k)-L0))^2);
                end
                if(s(i,j,k)<=d1)   %ת��ǰ
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
           else     %�����������
               if(i==1||i==5||i==13||i==15||i==17)  %���������ĵ�һ������
                   V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                   s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                   if(j==1)   %ͷ��
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
               elseif(i==2||i==6||i==14||i==16||i==18)   %���������ڶ�������
                   if(j==1)
                       V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                       s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                       if(abs(s(i,j,k)-s(i-1,Mv,k)+L0)>=se)  %����������ڵ���seʱ����ve�ȽϾ������ٶ�
                           a(i,j,k)=0;
                       else  %��������С��seʱ������IDM����
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
               elseif(i==7||i==11||i==19||i==21||i==23)  %���������ĵ�һ������
                   V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                   s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                   if(j==1)   %ͷ��
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
               elseif(i==8||i==12||i==20||i==22||i==24)   %���������ڶ�������
                   if(j==1)
                       V(i,j,k)=V(i,j,k-1)+a(i,j,k-1)*t0;
                       s(i,j,k)=s(i,j,k-1)+V(i,j,k-1)*t0+0.5*a(i,j,k-1)*(t0)^2;
                       if(abs(s(i,j,k)-s(i-1,Mv,k)-L0)>=se)  %����������ڵ���seʱ����ve�ȽϾ������ٶ�
                           a(i,j,k)=0;
                       else  %��������С��seʱ������IDM����
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
 
% x11=zeros(1,N);
% y11=zeros(1,N);
% x12=zeros(1,N);
% y12=zeros(1,N);
% x13=zeros(1,N);
% y13=zeros(1,N);
% x21=zeros(1,N);
% y21=zeros(1,N);
% x22=zeros(1,N);
% y22=zeros(1,N);
% x23=zeros(1,N);
% y23=zeros(1,N);
% for k=1:1:N;
%     x11(1,k)=x(1,1,k);
%     y11(1,k)=y(1,1,k);
%     x12(1,k)=x(1,2,k);
%     y12(1,k)=y(1,2,k);
%     x13(1,k)=x(1,3,k);
%     y13(1,k)=y(1,3,k);
%     x21(1,k)=x(2,1,k);
%     y21(1,k)=y(2,1,k);
%     x22(1,k)=x(2,2,k);
%     y22(1,k)=y(2,2,k);
%     x23(1,k)=x(2,3,k);
%     y23(1,k)=y(2,3,k);
% end
% 
% figure('Color',[1,1,1])
% subplot(1,3,1)
% plot(x23,y23,'r');
% hold on;
% subplot(1,3,2)
% plot(x22,y22,'g');
% hold on;
% subplot(1,3,3)
% plot(x21,y21,'b');
% xlabel('x'),ylabel('y')
% hold on;

%%---��H��t��------%%

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
            if(sqrt((X(i,k)-X(j,k))^2+(Y(i,k)-Y(j,k))^2)<=C)
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


%%---���ֵ������------%%

lambda0=5;lambda1=10;%%%AC0�ĵ����ʣ�5pks/s %AC1
lambda2=15;lambda3=20;
slot_time=13*(10^(-6));%ʱ϶��С��ת������

PHYh=48;MACh=112;Pl=200;%ȫ����bitsΪ��λ
Rd=3*10^6;Rb=10^6;tran_time=10^(-6);
Ttr=(PHYh/Rb)+((MACh+Pl)/Rd)+2*tran_time;%����ʱ��㶨

Pa0=1-exp(-lambda0*slot_time); %AC0�������
Pa1=1-exp(-lambda1*slot_time);      %AC1������ʣ��������ʲ��䣬�����䣩,%ȡ�������ݲ���������ʲô���ɣ������˷���ʲôϵͳ�����ڣ�daodalv*sltot_time;���ɣ�1-exp(-daodalv*slot_time)
Pa2=1-exp(-lambda2*slot_time);
Pa3=1-exp(-lambda3*slot_time);
%**********************802.11p���ܲ���************%
W0_0=4;%AC0��ʼ�������ڴ�С
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

M1=1;%AC1�ɷ�����������
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



pv0=zeros(1,N);
pv1=zeros(1,N);
pv2=zeros(1,N);
pv3=zeros(1,N);

w0=zeros(1,N);
w1=zeros(1,N);
w2=zeros(1,N);
w3=zeros(1,N);

tao0=zeros(1,N);
tao1=zeros(1,N);
tao2=zeros(1,N);
tao3=zeros(1,N);
tao=zeros(1,N);

PK=zeros(1,N);


pb0=zeros(1,N);%pb�ĳ�ʼ��ֵ
pb1=zeros(1,N);
pb2=zeros(1,N);
pb3=zeros(1,N);

pb01=zeros(1,N);%pb���ֵ
pb11=zeros(1,N);
pb21=zeros(1,N);%pb���ֵ
pb31=zeros(1,N);

b0_0=zeros(1,N);
b1_0_0=zeros(1,N);
b2_0_0=zeros(1,N);
b3_0_0=zeros(1,N);

g1_1=zeros(1,N);
g1_2=zeros(1,N);
g1_3=zeros(1,N);
g1_4=zeros(1,N);
g1_5=zeros(1,N);

g2_1=zeros(1,N);
g2_2=zeros(1,N);
g2_3=zeros(1,N);
g2_4=zeros(1,N);
g2_5=zeros(1,N);

g3_1=zeros(1,N);
g3_2=zeros(1,N);
g3_3=zeros(1,N);
g3_4=zeros(1,N);
g3_5=zeros(1,N);

p0=zeros(1,N);%luo0��ʼ��ֵ
p1=zeros(1,N);
p2=zeros(1,N);%luo0��ʼ��ֵ
p3=zeros(1,N);

p01=zeros(1,N);%luo0����ֵ
p11=zeros(1,N);
p21=zeros(1,N);%luo0����ֵ
p31=zeros(1,N);

Ts0=zeros(1,N);
Ds0=zeros(1,N);
Ts1=zeros(1,N);
Ds1=zeros(1,N);
Ts2=zeros(1,N);
Ds2=zeros(1,N);
Ts3=zeros(1,N);
Ds3=zeros(1,N);

Ts0_tag=zeros(1,N);
Ds0_tag=zeros(1,N);
Ts1_tag=zeros(1,N);
Ds1_tag=zeros(1,N);
Ts2_tag=zeros(1,N);
Ds2_tag=zeros(1,N);
Ts3_tag=zeros(1,N);
Ds3_tag=zeros(1,N);

m=0;
for k=1:1:N;
 syms z;
 %*********************************************************** ���õ������������ֵ������
 %***********************************************************
 %��luo��ֵ
  p0(1,k)=1-exp(-lambda0*slot_time);%luo����ʼֵ
  p1(1,k)=1-exp(-lambda1*slot_time);
  p2(1,k)=1-exp(-lambda2*slot_time);%luo����ʼֵ
  p3(1,k)=1-exp(-lambda3*slot_time);
  
  pb0(1,k)=0.2;%���ֵ���������ʡ�
  pb1(1,k)=0.3;
  pb2(1,k)=0.4;%���ֵ���������ʡ�
  pb3(1,k)=0.5;

for u=1:100;
for j=1:100;
b0_0(1,k)=(0.5*(W0_0+1)/(1-pb0(1,k))+(1-p0(1,k))/Pa0)^(-1);
w0(1,k)=b0_0(1,k);
pv0(1,k)=0;
pv1(1,k)=w0(1,k);


g1_1(1,k)=(1-(pv1(1,k))^(L1+1))/(1-pv1(1,k));
g1_2(1,k)=(W1_0-1)/(2*(1-pb1(1,k)));
g1_3(1,k)=(W1_0*pv1(1,k)*(1-(2*pv1(1,k))^M1))/((1-pb1(1,k))*(1-2*pv1(1,k)));
g1_4(1,k)=((2^(M1-1))*W1_0*(1-(pv1(1,k))^(L1-M1))*pv1(1,k)^(M1+1))/((1-pb1(1,k))*(1-pv1(1,k)));
g1_5(1,k)=(1-p1(1,k))/Pa1;
b1_0_0(1,k)=(g1_1(1,k)+g1_2(1,k)+g1_3(1,k)+g1_4(1,k)+g1_5(1,k))^(-1);
w1(1,k)=g1_1(1,k)*b1_0_0(1,k);%16��2

pv2(1,k)=w0(1,k)+w1(1,k);
g2_1(1,k)=(1-(pv2(1,k))^(L2+1))/(1-pv2(1,k));
g2_2(1,k)=(W2_0-1)/(2*(1-pb2(1,k)));
g2_3(1,k)=(W2_0*pv2(1,k)*(1-(2*pv2(1,k))^M2))/((1-pb2(1,k))*(1-2*pv2(1,k)));
g2_4(1,k)=((2^(M2-1))*W2_0*(1-(pv2(1,k))^(L2-M2))*pv2(1,k)^(M2+1))/((1-pb2(1,k))*(1-pv2(1,k)));
g2_5(1,k)=(1-p2(1,k))/Pa2;
b2_0_0(1,k)=(g2_1(1,k)+g2_2(1,k)+g2_3(1,k)+g2_4(1,k)+g2_5(1,k))^(-1);
w2(1,k)=g2_1(1,k)*b2_0_0(1,k);%16��2


pv3(1,k)=w0(1,k)+w1(1,k)+w2(1,k);
g3_1(1,k)=(1-(pv3(1,k))^(L3+1))/(1-pv3(1,k));
g3_2(1,k)=(W3_0-1)/(2*(1-pb3(1,k)));
g3_3(1,k)=(W3_0*pv3(1,k)*(1-(2*pv3(1,k))^M3))/((1-pb3(1,k))*(1-2*pv3(1,k)));
g3_4(1,k)=((2^(M3-1))*W3_0*(1-(pv3(1,k))^(L3-M3))*pv3(1,k)^(M3+1))/((1-pb3(1,k))*(1-pv3(1,k)));
g3_5(1,k)=(1-p3(1,k))/Pa3;
b3_0_0(1,k)=(g3_1(1,k)+g3_2(1,k)+g3_3(1,k)+g3_4(1,k)+g3_5(1,k))^(-1);
w3(1,k)=g3_1(1,k)*b3_0_0(1,k);%16��2

tao0(1,k)=w0(1,k);
tao1(1,k)=w1(1,k)*(1-pv1(1,k));
tao2(1,k)=w2(1,k)*(1-pv2(1,k));
tao3(1,k)=w3(1,k)*(1-pv3(1,k));
tao(1,k)=tao0(1,k)+tao1(1,k)+tao2(1,k)+tao3(1,k);

PK(1,k)=(1-tao(1,k))^(Ncs(1,k)-1);
pb01(1,k)=1-(PK(1,k)*(1-w1(1,k))*(1-w2(1,k))*(1-w3(1,k)))^(A0+1);
pb11(1,k)=1-(PK(1,k)*(1-w0(1,k))*(1-w2(1,k))*(1-w3(1,k)))^(A1+1);   %13-1
pb21(1,k)=1-(PK(1,k)*(1-w0(1,k))*(1-w1(1,k))*(1-w3(1,k)))^(A2+1);
pb31(1,k)=1-(PK(1,k)*(1-w0(1,k))*(1-w1(1,k))*(1-w2(1,k)))^(A3+1);   %13-1

piancha1=abs(pb01(1,k)-pb0(1,k));%pb����������
piancha2=abs(pb11(1,k)-pb1(1,k));
piancha3=abs(pb21(1,k)-pb2(1,k));
piancha4=abs(pb31(1,k)-pb3(1,k));


    if(piancha1>0.0000001 && piancha2>0.0000001 && piancha3>0.0000001 && piancha4>0.0000001 )
         pb0(1,k)=pb01(1,k);
         pb1(1,k)=pb11(1,k);
         pb2(1,k)=pb21(1,k);
         pb3(1,k)=pb31(1,k);
    else
        break;
    end
end
TR=z^Ttr; %ʽ18

% % % %**********************������������AC0������������������������************%
 H0_frozen=z^(Ttr+AIFS0);
H0=(1-pb0(1,k))*(z^slot_time)/(1-pb0(1,k)*H0_frozen);%ʽ19,ÿһ��״̬��ƽ��ʱ��
 B0_0=0;
 %��B0,0(Z)
  for i=0:W0_0-1;
      B0_0=B0_0+(1/W0_0)*(H0)^i;         %ʽ20
  end
  PTs0=TR*B0_0;                          %ʽ21����PTs0
  diff0_0=diff(PTs0);   %һ�׵�  
  diff0_1=diff(PTs0,2);%���׵�           %���ֵ������          %ʽ22,��ֵ
  
  Ts0(1,k)=subs(diff0_0,z,1);      %AC0ʱ�Ӿ�ֵ��ת����ms
  Ds0(1,k)=subs(diff0_1,z,1)+Ts0(1,k)-(Ts0(1,k))^2; %����
  
  Ts0_tag(1,k)=Ts0(1,k)*10^3;%Ts0��Ϊ��λ��Ts0_tag����Ϊ��λ
  Ds0_tag(1,k)=sqrt(Ds0(1,k))*10^3;
  
  p01(1,k)=lambda0*Ts0(1,k);%���luo��������ĳ��AC0ʱ��
  piancha3=abs(p01(1,k)-p0(1,k));
 %������������������������������������AC1��������������������������������%
   H1_frozen=z^(Ttr+AIFS1);
H1=(1-pb1(1,k))*(z^slot_time)/(1-pb1(1,k)*H1_frozen);%ʽ19,ÿһ��״̬��ƽ��ʱ��

  B1_0=0;
 %��B1,0(Z)
  for i=0:W1_0-1;
      B1_0=B1_0+(1/W1_0)*(H1)^i;         %ʽ20
  end 
  
    B1_1=0;
 %��B1,1(Z)
  for i=0:W1_1-1;
      B1_1=B1_1+(1/W1_1)*(H1)^i;         %ʽ20
  end 
  
B1_2=B1_1;
%   B1_3=B1_1;
%   B1_4=B1_1;
%    B1_5=B1_1;
   
 PTs1=(1-pv1(1,k))*TR*(B1_0+pv1(1,k)*B1_0*B1_1+((pv1(1,k))^2)*B1_0*B1_1*B1_2)+((pv1(1,k))^(L1+1))*B1_0*B1_1*B1_2;
 diff1_0=diff(PTs1);   %һ�׵�  
   diff1_1=diff(PTs1,2);%���׵�           %���ֵ������          %ʽ22,��ֵ
   
   Ts1(1,k)=subs(diff1_0,z,1);      %AC0ʱ�Ӿ�ֵ
   Ds1(1,k)=subs(diff1_1,z,1)+Ts1(1,k)-(Ts1(1,k))^2; %����   
   
   Ts1_tag(1,k)=Ts1(1,k)*10^3;%Ts0��Ϊ��λ��Ts0_tag����Ϊ��λ
   Ds1_tag(1,k)=sqrt(Ds1(1,k))*10^3;
   
   p11(1,k)=lambda1*Ts1(1,k);%���luo1
   piancha4=abs(p11(1,k)-p1(1,k));
   
 

   %������������������������������������AC2��������������������������������%
   H2_frozen=z^(Ttr+AIFS2);
H2=(1-pb2(1,k))*(z^slot_time)/(1-pb2(1,k)*H2_frozen);%ʽ19,ÿһ��״̬��ƽ��ʱ��

  B2_0=0;
 %��B2,0(Z)
  for i=0:W2_0-1;
      B2_0=B2_0+(1/W2_0)*(H2)^i;         %ʽ20
  end 
  
    B2_1=0;
 %��B2,1(Z)
  for i=0:W2_1-1;
      B2_1=B2_1+(1/W2_1)*(H2)^i;         %ʽ20
  end 
  
B2_2=B2_1;
%   B1_3=B1_1;
%   B1_4=B1_1;
%    B1_5=B1_1;
   
 PTs2=(1-pv2(1,k))*TR*(B2_0+pv2(1,k)*B2_0*B2_1+((pv2(1,k))^2)*B2_0*B2_1*B2_2)+((pv2(1,k))^(L2+1))*B2_0*B2_1*B2_2;
 diff2_0=diff(PTs2);   %һ�׵�  
   diff2_1=diff(PTs2,2);%���׵�           %���ֵ������          %ʽ22,��ֵ
   
   Ts2(1,k)=subs(diff2_0,z,1);      %AC0ʱ�Ӿ�ֵ
   Ds2(1,k)=subs(diff2_1,z,1)+Ts2(1,k)-(Ts2(1,k))^2; %����   
   
   Ts2_tag(1,k)=Ts2(1,k)*10^3;%Ts0��Ϊ��λ��Ts0_tag����Ϊ��λ
   Ds2_tag(1,k)=sqrt(Ds2(1,k))*10^3;
   
   p21(1,k)=lambda2*Ts2(1,k);%���luo1
   piancha5=abs(p21(1,k)-p2(1,k));
    
   
   %������������������������������������AC3��������������������������������%
   H3_frozen=z^(Ttr+AIFS3);
H3=(1-pb3(1,k))*(z^slot_time)/(1-pb3(1,k)*H3_frozen);%ʽ19,ÿһ��״̬��ƽ��ʱ��

  B3_0=0;
 %��B3,0(Z)
  for i=0:W3_0-1;
      B3_0=B3_0+(1/W3_0)*(H3)^i;         %ʽ20
  end 
  
    B3_1=0;
 %��B3,1(Z)
  for i=0:W3_1-1;
      B3_1=B3_1+(1/W3_1)*(H3)^i;         %ʽ20
  end 
  
   B3_2=0;
 %��B3,2(Z)
  for i=0:W3_2-1;
      B3_2=B3_2+(1/W3_2)*(H3)^i;         %ʽ20
  end 
  
   B3_3=0;
 %��B3,3(Z)
  for i=0:W3_3-1;
      B3_3=B3_3+(1/W3_3)*(H3)^i;         %ʽ20
  end 
  
   B3_4=0;
 %��B3,4(Z)
  for i=0:W3_4-1;
      B3_4=B3_4+(1/W3_4)*(H3)^i;         %ʽ20
  end
  
  B3_5=0;
 %��B3,5(Z)
  for i=0:W3_5-1;
      B3_5=B3_5+(1/W3_5)*(H3)^i;         %ʽ20
  end     
  
    B3_6=0;
 %��B3,6(Z)
  for i=0:W3_6-1;
      B3_6=B3_6+(1/W3_6)*(H3)^i;         %ʽ20
  end     
  
  
B3_7=B3_6;

   
 PTs3=(1-pv3(1,k))*TR*(B3_0+pv3(1,k)*B3_0*B3_1+((pv3(1,k))^2)*B3_0*B3_1*B3_2+((pv3(1,k))^3)*B3_0*B3_1*B3_2*B3_3+((pv3(1,k))^4)*B3_0*B3_1*B3_2*B3_3*B3_4+((pv3(1,k))^5)*B3_0*B3_1*B3_2*B3_3*B3_4*B3_5+((pv3(1,k))^6)*B3_0*B3_1*B3_2*B3_3*B3_4*B3_5*B3_6+((pv3(1,k))^7)*B3_0*B3_1*B3_2*B3_3*B3_4*B3_5*B3_6*B3_7)+((pv3(1,k))^(L3+1))*B3_0*B3_1*B3_2*B3_3*B3_4*B3_5*B3_6*B3_7;
 diff3_0=diff(PTs3);   %һ�׵�  
   diff3_1=diff(PTs3,2);%���׵�           %���ֵ������          %ʽ22,��ֵ
   
   Ts3(1,k)=subs(diff3_0,z,1);      %AC0ʱ�Ӿ�ֵ
   Ds3(1,k)=subs(diff3_1,z,1)+Ts3(1,k)-(Ts3(1,k))^2; %����   
   
   Ts3_tag(1,k)=Ts3(1,k)*10^3;%Ts0��Ϊ��λ��Ts0_tag����Ϊ��λ
   Ds3_tag(1,k)=sqrt(Ds3(1,k))*10^3;
   
   p31(1,k)=lambda3*Ts3(1,k);%���luo1
   piancha6=abs(p31(1,k)-p3(1,k));
   
   if(piancha3<0.000001 && piancha4<0.000001  && piancha5<0.000001 && piancha6<0.000001)
        break;
   else     
         p0(1,k)=p01(1,k); %p0������ʼluo
         p1(1,k)=p11(1,k); 
         p2(1,k)=p21(1,k); %p0������ʼluo
         p3(1,k)=p31(1,k);
   end   
   
   
end
m+1
end
%  figure('Color',[1,1,1])
%  subplot(2,2,1);
%  x=1:1:N;
%  plot(x,Ts0,'r');
%  hold on;
%  subplot(2,2,2);
%  x=1:1:N;
%  plot(x,Ds0,'r');
%  hold on;
%  subplot(2,2,3);
%  x=1:1:N;
%  plot(x,Ncs,'r');
%  hold on;

%%---���ܷ���------%%

%%---AC0----%%
u_0=zeros(1,N);
c_0=zeros(1,N);
Yt=zeros(1,N);
Dt0=zeros(1,N);
x0=zeros(1,N);
x0(1,1)=0.005;
xt=cell(N,2);
Xt=zeros(1,N);
 for i=1:1:N
    u_0(1,i)=1/Ts0(1,i);  
    c_0(1,i)=u_0(1,i)*sqrt(Ds0(1,i)); 
    [t,xt{i,1}]=ode45('fun0',[(i-1)*0.1,i*0.1],x0(1,i),[],c_0(1,i),u_0(1,i));
    xtt=xt{i,1};
    
    Xt(1,i+1)=xtt(length(xtt),1);
%     Xt(1,i)=xtt(length(xtt),1);

%     Yt(1,i)=-(xtt(length(xtt),1)+1-sqrt((xtt(length(xtt),1))^2+2*(c_0(1,i))^2*xtt(length(xtt),1)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
if(i>1)
    if(Ts0(1,i)~=Ts0(1,i-1))
        Yt(1,i)=-(x0(1,i)+1-sqrt((x0(1,i))^2+2*(c_0(1,i))^2*x0(1,i)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
    else
        Yt(1,i)=0;
    end
else
    Yt(1,i)=-(x0(1,i)+1-sqrt((x0(1,i))^2+2*(c_0(1,i))^2*x0(1,i)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
end
    if(i>1)         
            Dt0(1,i)=Yt(1,i)/lambda0*0.1+Dt0(1,i-1);
    else
        Dt0(1,i)=xtt(length(xtt),1)/lambda0;
    end
%     x0(1,i+1)=xt{i,1}(length(xtt),1);
x0(1,i+1)=xt{i,1}(length(xtt),1);
 end


 
 

%%---AC1---%%
 
u_1=zeros(1,N);
c_1=zeros(1,N);
Yt1=zeros(1,N);
Dt1=zeros(1,N);
x1=zeros(1,N);
x1(1,1)=0.005;
xt1=cell(N,2);
Xt1=zeros(1,N);
 for i=1:1:N
    u_1(1,i)=1/Ts1(1,i);  
    c_1(1,i)=u_1(1,i)*sqrt(Ds1(1,i)); 
    [t,xt1{i,1}]=ode45('fun1',[(i-1)*0.1,i*0.1],x1(1,i),[],c_1(1,i),u_1(1,i));
    xtt1=xt1{i,1};
    
    Xt1(1,i+1)=xtt1(length(xtt1),1);
%     Xt(1,i)=xtt(length(xtt),1);

%     Yt(1,i)=-(xtt(length(xtt),1)+1-sqrt((xtt(length(xtt),1))^2+2*(c_0(1,i))^2*xtt(length(xtt),1)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
if(i>1)
    if(Ts1(1,i)~=Ts1(1,i-1))
        Yt1(1,i)=-(x1(1,i)+1-sqrt((x1(1,i))^2+2*(c_1(1,i))^2*x1(1,i)+1))/(1-(c_1(1,i))^2)*u_1(1,i)+lambda1;
    else
        Yt1(1,i)=0;
    end
else
    Yt1(1,i)=-(x1(1,i)+1-sqrt((x1(1,i))^2+2*(c_1(1,i))^2*x1(1,i)+1))/(1-(c_1(1,i))^2)*u_1(1,i)+lambda1;
end
    if(i>1)         
            Dt1(1,i)=Yt1(1,i)/lambda1*0.1+Dt1(1,i-1);
    else
        Dt1(1,i)=xtt1(length(xtt1),1)/lambda1;
    end
%     x0(1,i+1)=xt{i,1}(length(xtt),1);
x1(1,i+1)=xt1{i,1}(length(xtt1),1);
 end
 
 %%---AC2---%%
 
u_2=zeros(1,N);
c_2=zeros(1,N);
Yt2=zeros(1,N);
Dt2=zeros(1,N);
x2=zeros(1,N);
x2(1,1)=0.005;
xt2=cell(N,2);
Xt2=zeros(1,N);
 for i=1:1:N
    u_2(1,i)=1/Ts2(1,i);  
    c_2(1,i)=u_2(1,i)*sqrt(Ds2(1,i)); 
    [t,xt2{i,1}]=ode45('fun2',[(i-1)*0.1,i*0.1],x2(1,i),[],c_2(1,i),u_2(1,i));
    xtt2=xt2{i,1};
    
    Xt2(1,i+1)=xtt2(length(xtt2),1);
%     Xt(1,i)=xtt(length(xtt),1);

%     Yt(1,i)=-(xtt(length(xtt),1)+1-sqrt((xtt(length(xtt),1))^2+2*(c_0(1,i))^2*xtt(length(xtt),1)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
if(i>1)
    if(Ts2(1,i)~=Ts2(1,i-1))
        Yt2(1,i)=-(x2(1,i)+1-sqrt((x2(1,i))^2+2*(c_2(1,i))^2*x2(1,i)+1))/(1-(c_2(1,i))^2)*u_2(1,i)+lambda2;
    else
        Yt2(1,i)=0;
    end
else
    Yt2(1,i)=-(x2(1,i)+1-sqrt((x2(1,i))^2+2*(c_2(1,i))^2*x2(1,i)+1))/(1-(c_2(1,i))^2)*u_2(1,i)+lambda2;
end
    if(i>1)         
            Dt2(1,i)=Yt2(1,i)/lambda2*0.1+Dt2(1,i-1);
    else
        Dt2(1,i)=xtt2(length(xtt2),1)/lambda2;
    end
%     x0(1,i+1)=xt{i,1}(length(xtt),1);
x2(1,i+1)=xt2{i,1}(length(xtt2),1);
 end
 
 %%---AC3---%%
 
u_3=zeros(1,N);
c_3=zeros(1,N);
Yt3=zeros(1,N);
Dt3=zeros(1,N);
x3=zeros(1,N);
x3(1,1)=0.005;
xt3=cell(N,2);
Xt3=zeros(1,N);
 for i=1:1:N
    u_3(1,i)=1/Ts3(1,i);  
    c_3(1,i)=u_3(1,i)*sqrt(Ds3(1,i)); 
    [t,xt3{i,1}]=ode45('fun3',[(i-1)*0.1,i*0.1],x3(1,i),[],c_3(1,i),u_3(1,i));
    xtt3=xt3{i,1};
    
    Xt3(1,i+1)=xtt3(length(xtt3),1);
%     Xt(1,i)=xtt(length(xtt),1);

%     Yt(1,i)=-(xtt(length(xtt),1)+1-sqrt((xtt(length(xtt),1))^2+2*(c_0(1,i))^2*xtt(length(xtt),1)+1))/(1-(c_0(1,i))^2)*u_0(1,i)+lambda0;
if(i>1)
    if(Ts3(1,i)~=Ts3(1,i-1))
        Yt3(1,i)=-(x3(1,i)+1-sqrt((x3(1,i))^2+2*(c_3(1,i))^2*x3(1,i)+1))/(1-(c_3(1,i))^2)*u_3(1,i)+lambda3;
    else
        Yt3(1,i)=0;
    end
else
    Yt3(1,i)=-(x3(1,i)+1-sqrt((x3(1,i))^2+2*(c_3(1,i))^2*x3(1,i)+1))/(1-(c_3(1,i))^2)*u_3(1,i)+lambda3;
end
    if(i>1)         
            Dt3(1,i)=Yt3(1,i)/lambda3*0.1+Dt3(1,i-1);
    else
        Dt3(1,i)=xtt3(length(xtt3),1)/lambda3;
    end
%     x0(1,i+1)=xt{i,1}(length(xtt),1);
x3(1,i+1)=xt3{i,1}(length(xtt3),1);
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
 
 
 
 for k=1:1:N;
     f_in0(1,k)=lambda0;
      f_out0(1,k)=f_in0(1,k)-Yt(1,k);
      f_in1(1,k)=lambda1;
      f_out1(1,k)=f_in1(1,k)-Yt1(1,k);
      f_in2(1,k)=lambda2;
      f_out2(1,k)=f_in2(1,k)-Yt2(1,k);
      f_in3(1,k)=lambda3;
      f_out3(1,k)=f_in3(1,k)-Yt3(1,k);
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

 save('Ncs.mat','Ncs');
 save('Dt0.mat','Dt0'); 
 save('Dt1.mat','Dt1'); 
 save('Dt2.mat','Dt2'); 
 save('Dt3.mat','Dt3'); 
 save('Ts0.mat','Ts0'); 
 save('Ts1.mat','Ts1'); 
 save('Ts2.mat','Ts2'); 
 save('Ts3.mat','Ts3'); 
 save('p0.mat','p0');  
 save('p1.mat','p1');  
 save('p2.mat','p2'); 
 save('p3.mat','p3'); 
 save('tao0.mat','tao0');  
 save('tao1.mat','tao1');   
 save('tao2.mat','tao2');   
 save('tao3.mat','tao3');  
 save('tao.mat','tao');   
 save('u_0.mat','u_0');  
  save('u_1.mat','u_1'); 
  save('u_2.mat','u_2'); 
  save('u_3.mat','u_3'); 
  save('c_0.mat','c_0');  
  save('c_1.mat','c_1'); 
  save('c_2.mat','c_2'); 
  save('c_3.mat','c_3');
 save('pv0.mat','pv0'); 
 save('pv1.mat','pv1');  
 save('pv2.mat','pv2');  
 save('pv3.mat','pv3');  
figure(1)
 x=1:1:N;
 plot(0.1*x,p_c_avg,'r');
 title('p_c_avg');
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
plot(0.1*x2,Dt1);
hold on;
x3=1:1:N;  
plot(0.1*x3,Dt2);
hold on;
x4=1:1:N;  
plot(0.1*x4,Dt3);
hold on;
title('Dt')
hold on; 