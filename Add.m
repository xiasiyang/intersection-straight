
function y = Add(CollitionStations,index)
CollitionStations(1) = CollitionStations(1) + 1;%CollitionStations(1)Ϊ����λ��ָʾ��
i = CollitionStations(1);
CollitionStations(i+1) = index;
y = CollitionStations;
