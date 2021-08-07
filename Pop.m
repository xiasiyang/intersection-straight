
function y = Pop(PacketBuff,n)
PacketBuff(n,:) = [PacketBuff(n,1),PacketBuff(n,3:5001),0];%ÖØÐÂ¸³Öµ
%here£¬accomadate with packet buffer length
PacketBuff(n,1) = PacketBuff(n,1) - 1;
y = PacketBuff;
