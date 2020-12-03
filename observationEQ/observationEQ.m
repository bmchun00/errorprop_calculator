clear all;
clc;
%% �⺻������ �����ؾ��մϴ�.
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
    %% ������ ������ ���ϸ� ����
    dfx(x, y) = diff(f,x);
    dfy(x, y) = diff(f,y);
    A = [dfx(init(1),init(2)),dfy(init(1),init(2))]; 
    L = L-f(init(1),init(2));
    %% �ǵ帮�� �ʾƵ� ��
    test = inv(A'*A)*A'*L;
    init = init+test;
    fprintf("********%d��° ����********\n",i);
    i=i+1;
    fprintf("A��\n");
    disp(double(A));
    fprintf("L��\n");
    disp(double(L));
    fprintf("correction��\n");
    disp(double(test));
    fprintf("�̹Ƿ� �ʱⰪ��\n");
    disp(double(init));
    fprintf("�� ����˴ϴ�.\n");
end
fprintf("�ݺ��� �Ϸ�Ǿ����ϴ�.\n");