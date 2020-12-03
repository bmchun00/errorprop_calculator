clear all;
A = input("계수를 입력해 주세요 : ");
fprintf("1 by %d 계수 입력됨\n",length(A));
sig = input("표준편차(주의)를 입력해 주세요 : ");

vari = power(diag(sig),2);
fprintf("구하고자 하는 값은 %f\n",sqrt(A*vari*A'));
