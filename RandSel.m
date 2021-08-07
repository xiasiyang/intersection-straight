%退避计数器达到最大1000时，重置退避计数器
function y = RandSel(CW)
%y = 0;
%while y == 0
    y = floor(rand * CW);
%end
