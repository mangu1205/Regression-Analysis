cd Iris_dataset
a = csvread("data - Copy.csv");
a1 =a(2:end,2:6);
Y = a(2:end,7:8);
%Y = [1*ones(50,1);2*ones(50,1);3*ones(50,1)];
X = transpose(a1)*a1;
y_new = transpose(a1)*Y;
% M =[ m11,m12,m13,m14,m21,m22,m23,m24,c1,c2]
M = inverse(X)*y_new;
y_predic = a1*M;
dists = [norm(y_predic - [0,0] ,"rows"),norm(y_predic - [1,0] ,"rows"),norm(y_predic - [1/2,sqrt(3)/2],"rows")];
actual_class = [ones(50,1);2*ones(50,1);3*ones(50,1)];
[_,pred_class] =min(dists ,[],2);
acurracy = sum (actual_class == pred_class)/ rows(actual_class)
