clear all;
flag = input("��� (1), �л� (2), �л�� (3) : ");
a = input("���Ǽ����� �Է��� �ּ��� : ");
if (flag == 1)
    m = input("����� �Է��� �ּ��� : ");
    s = input("ǥ�������� �Է��� �ּ��� : ");
    n = input("�������� ������ �Է��� �ּ��� : ");
    if (n < 30)
        fprintf("t_%f,%d �� �Է��� �ּ���.",a/2,n-1);
        cv = input(" : ");
    else
        fprintf("N_%f �� �Է��� �ּ���.",a/2);
        cv = input(" : ");
    end
    fprintf("���Ǽ��� %f�� ���� ����� �ŷڱ�����\n%f < mu < %f �Դϴ�.\n",a,m-cv*s/sqrt(n),m+cv*s/sqrt(n));
elseif (flag == 2)
    s = input("ǥ�������� �Է��� �ּ��� : ");
    n = input("�������� ������ �Է��� �ּ��� : ");
    fprintf("X2_%f,%d �� �Է��� �ּ���.",a/2,n-1);
    cv1 = input(" : ");
    fprintf("X2_%f,%d �� �Է��� �ּ���.",1-a/2,n-1);
    cv2 = input(" : ");
    fprintf("���Ǽ��� %f�� ���� �л��� �ŷڱ�����\n%f < var < %f �Դϴ�.\n",a,(n-1)*s*s/cv1,(n-1)*s*s/cv2);
elseif (flag == 3)
    v1 = input("�л��� ū v1�� �Է����ּ��� : ");
    v2 = input("�л��� ���� v2�� �Է����ּ��� : ");
    n1 = input("v1�� ������ ������ �Է��� �ּ��� : ");
    n2 = input("v2�� ������ ������ �Է��� �ּ��� : ");
    fprintf("F_%f,%d,%d �� �Է��� �ּ���. : ",a/2,n1-1,n2-1);
    cv1 = input(" : ");
    fprintf("F_%f,%d,%d �� �Է��� �ּ���. : ",a/2,n2-1,n1-1);
    cv2 = input(" : ");
    fprintf("���Ǽ��� %f�� ���� �л���� �ŷڱ�����\n%f < var1/var2 < %f �Դϴ�.\n",a,1/cv1*v1/v2,cv2*v1/v2);
end