clear all;
A = input("����� �Է��� �ּ��� : ");
fprintf("1 by %d ��� �Էµ�\n",length(A));
sig = input("ǥ������(����)�� �Է��� �ּ��� : ");

vari = power(diag(sig),2);
fprintf("���ϰ��� �ϴ� ���� %f\n",sqrt(A*vari*A'));
