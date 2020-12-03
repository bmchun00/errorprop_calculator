function [return_value] = norm_pdf(value, avg, st, flag)
raw = load('norm_table.txt'); % ������ �ҷ�����
index_m = raw((2:34)); % ���� �ε���
index_p = raw((35:67)); % ��� �ε���
index_t = raw(1,(2:11)); % �Ҽ� ��°�ڸ� �ε���
mod_raw = raw(2:67,2:11); % ������ �����ͼ�. �ε��� �κ��� ������ ������ ���鸸�� �����ϴ�.
if flag == 1
    t = (value-avg)/st;
    t1 = fix(t*10)/10; % ǥ���� ���� ã������ ����
    t2 = fix((t-t1)*100); % ǥ���� ���� ã������ ����
    t3 = (t-t1-t2/100)*100; % ������ ���� ��
    if t*t>3.29*3.29 % t ���� ǥ�� �Ѿ���� Ȯ��
        
        return_value = -1; % error value
        disp("Program Error! t is beyond the range of the normal distribution table :(");
        return;
    end
    
    if t < 0
        d1 = find(index_m==t1);
    else
        d1 = find(index_p==t1)+33;
    end
    d2 = find(index_t==t2);
    data = mod_raw(d1,d2)*(1-t3)+mod_raw(d1,d2+1)*t3; % ������ �׻� �̷������ ������� ������ �����ϴ�.��°��� ����ȭ�ϱ� ���� ���� ���� �׻� �����մϴ�.
    if t3 ~= 0 % ������ ����ϱ� ���� ���ǹ�
        fprintf("Interpolated ");
    end
    fprintf("Probability of t (%.4f)",t);
    if avg~=0 %��հ��� 0�� ��� ��հ� ���� ����� ���� ����
        fprintf(" with mean %.4f",avg);
    end
    fprintf(", std %.4f is %.4f\n",st,data);
    
elseif flag==2
    if value>1
        fprintf("Probability is changed from percentage %.4f to %.4f\n",value,value/100);
        value = value/100;
    end
    if value< 0.00069 || value > 0.9995
        disp("Program Error! Probability is beyond the range of the normal distribution table :(");
        return_value = -1;
        return;
    end
    mod_value = 1-(1-value)/2; % ���� 0.95�� ������ 0.975�� ��ȯ
    
    [m,i1] = min(abs(mod_raw-mod_value)); %ù��° �ּҰ� ���
    [t1,j1] = min(m); %t1���� mod_value�� ���Ժ���ǥ ������ �ּҰ��� ���ϴ�. (���� �� ���)
    mod_raw(i1(j1),j1) = -10; % �ι�° �ּҰ��� ��� ����
    if t1 ~= 0 % ���� t1�� ���� 0�̶�� ���Ժ���ǥ ���� �� ����������ٴ� ���Դϴ�.
        fprintf("Interpolated ");
    end
    [m,i2] = min(abs(mod_raw-mod_value)); 
    [t2,j2] = min(m);
    t3 = t1+t2; %������ ���� ��
    % t1�� t2�� mod_value�� ���� ������ �ּҰ��� �����ϴ�. ���� ����
    % ������ �׻� �̷������ ������ ������ �����ϴ�. ��°��� ����ȭ�ϱ� ���� ���� ���� �׻� �����մϴ�.
    t = (index_p(i1(j1)-33)+index_t(j1)*0.01)*t2/t3+(index_p(i2(j2)-33)+index_t(j2)*0.01)*t1/t3;
    fprintf("critical value t is %.4f\n",t);
    disp("The region to meet the probability is");
    fprintf("%.4f - %.4f*%.4f < t < %.4f + %.4f*%.4f = %.4f < t < %.4f\n",avg,t,st,avg,t,st,avg-t*st,avg+t*st);
else
    fprintf("�÷��� ���� ������ �ֽ��ϴ�.\n");
end
end