a1 = input("내삽하고자 하는 값 두개 입력해주세요 : ");
a2 = input("내삽 기준 값 두개 입력해주세요 : ");
a3 = input("내삽 기준 값의 참 입력해주세요 : ");
k = abs(a2 - a3);
pol = k(2)*a1(1)/(k(1)+k(2))+k(1)*a1(2)/(k(1)+k(2));
fprintf("두 값을 내삽 : %f\n",pol);