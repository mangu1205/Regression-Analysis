function given_pt = fn_lin_regre2(x)
  cd Iris_dataset
  a = csvread("data - Copy.csv");
  a1 = a(2:end,2:6);
  Y = a(2:end,7:8);
  %Y = [1*ones(50,1);2*ones(50,1);3*ones(50,1)];
  X = transpose(a1)*a1;
  y_new = transpose(a1)*Y;
  M = inverse(X)*y_new;
  y_pred = [x,1]*M;
  dists = [norm(y_pred - [0,0] ,"rows"),norm(y_pred - [1,0] ,"rows"),norm(y_pred - [1/2,sqrt(3)/2] , "rows" )];
  [_,pred_class] = min( dists ,[],2);
  if (pred_class == 1)
  disp("Given dimensions is Iris-setosa")
  elseif (pred_class == 2)
    disp("Given dimensions is Iris-versicolor")
  else
    disp("Given dimensions is Iris-virginica")
  end
endfunction
