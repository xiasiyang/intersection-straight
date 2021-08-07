
function y = Add(CollitionStations,index)
CollitionStations(1) = CollitionStations(1) + 1;%CollitionStations(1)为序列位置指示标
i = CollitionStations(1);
CollitionStations(i+1) = index;
y = CollitionStations;
