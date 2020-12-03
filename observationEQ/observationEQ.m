clear all;
clc;
%% 기본적으로 변경해야합니다.
syms x y
f(x,y) = [x+y-2*y^2;x^2+y^2;3*x^2-y^2];
sig = 0.005;
init = [2;2];
Ltmp = [-4;8;7.7];
%% 
test = [10;10];
i = 1;
while(sig<=abs(test(1)) || sig<=abs(test(2)))
    L = Ltmp;
    %% 변수의 개수가 변하면 변경
    dfx(x, y) = diff(f,x);
    dfy(x, y) = diff(f,y);
    A = [dfx(init(1),init(2)),dfy(init(1),init(2))]; 
    L = L-f(init(1),init(2));
    %% 건드리지 않아도 됨
    test = inv(A'*A)*A'*L;
    init = init+test;
    fprintf("********%d번째 시행********\n",i);
    i=i+1;
    fprintf("A는\n");
    disp(double(A));
    fprintf("L은\n");
    disp(double(L));
    fprintf("correction이\n");
    disp(double(test));
    fprintf("이므로 초기값이\n");
    disp(double(init));
    fprintf("로 변경됩니다.\n");
end
fprintf("반복이 완료되었습니다.\n");