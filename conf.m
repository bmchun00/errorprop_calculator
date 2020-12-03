clear all;
flag = input("평균 (1), 분산 (2), 분산비 (3) : ");
a = input("유의수준을 입력해 주세요 : ");
if (flag == 1)
    m = input("평균을 입력해 주세요 : ");
    s = input("표준편차를 입력해 주세요 : ");
    n = input("데이터의 갯수를 입력해 주세요 : ");
    if (n < 30)
        fprintf("t_%f,%d 를 입력해 주세요.",a/2,n-1);
        cv = input(" : ");
    else
        fprintf("N_%f 를 입력해 주세요.",a/2);
        cv = input(" : ");
    end
    fprintf("유의수준 %f에 대한 평균의 신뢰구간은\n%f < mu < %f 입니다.\n",a,m-cv*s/sqrt(n),m+cv*s/sqrt(n));
elseif (flag == 2)
    s = input("표준편차를 입력해 주세요 : ");
    n = input("데이터의 갯수를 입력해 주세요 : ");
    fprintf("X2_%f,%d 를 입력해 주세요.",a/2,n-1);
    cv1 = input(" : ");
    fprintf("X2_%f,%d 를 입력해 주세요.",1-a/2,n-1);
    cv2 = input(" : ");
    fprintf("유의수준 %f에 대한 분산의 신뢰구간은\n%f < var < %f 입니다.\n",a,(n-1)*s*s/cv1,(n-1)*s*s/cv2);
elseif (flag == 3)
    v1 = input("분산이 큰 v1을 입력해주세요 : ");
    v2 = input("분산이 작은 v2를 입력해주세요 : ");
    n1 = input("v1의 데이터 갯수를 입력해 주세요 : ");
    n2 = input("v2의 데이터 갯수를 입력해 주세요 : ");
    fprintf("F_%f,%d,%d 를 입력해 주세요. : ",a/2,n1-1,n2-1);
    cv1 = input(" : ");
    fprintf("F_%f,%d,%d 를 입력해 주세요. : ",a/2,n2-1,n1-1);
    cv2 = input(" : ");
    fprintf("유의수준 %f에 대한 분산비의 신뢰구간은\n%f < var1/var2 < %f 입니다.\n",a,1/cv1*v1/v2,cv2*v1/v2);
end