%二进制指数碰撞竞争窗口
function y = Increase(CW,n,W)
i = log2(CW(n)/W);

%达到CWmax后保持直至被重置
if  i < 8
    i = i + 1;
end
y = W*2^i;