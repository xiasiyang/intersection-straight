%������ָ����ײ��������
function y = Increase(CW,n,W)
i = log2(CW(n)/W);

%�ﵽCWmax�󱣳�ֱ��������
if  i < 8
    i = i + 1;
end
y = W*2^i;