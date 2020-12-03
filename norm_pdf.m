function [return_value] = norm_pdf(value, avg, st, flag)
raw = load('norm_table.txt'); % 데이터 불러오기
index_m = raw((2:34)); % 음수 인덱싱
index_p = raw((35:67)); % 양수 인덱싱
index_t = raw(1,(2:11)); % 소수 둘째자리 인덱싱
mod_raw = raw(2:67,2:11); % 수정된 데이터셋. 인덱스 부분을 제외한 나머지 값들만을 가집니다.
if flag == 1
    t = (value-avg)/st;
    t1 = fix(t*10)/10; % 표에서 값을 찾기위한 변수
    t2 = fix((t-t1)*100); % 표에서 값을 찾기위한 변수
    t3 = (t-t1-t2/100)*100; % 내삽을 위한 값
    if t*t>3.29*3.29 % t 값이 표를 넘어가는지 확인
        
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
    data = mod_raw(d1,d2)*(1-t3)+mod_raw(d1,d2+1)*t3; % 내삽은 항상 이루어져도 결과에는 변함이 없습니다.출력값을 간소화하기 위해 조건 없이 항상 내삽합니다.
    if t3 ~= 0 % 내삽을 명시하기 위한 조건문
        fprintf("Interpolated ");
    end
    fprintf("Probability of t (%.4f)",t);
    if avg~=0 %평균값이 0일 경우 평균값 관련 출력을 하지 않음
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
    mod_value = 1-(1-value)/2; % 만약 0.95가 들어오면 0.975를 반환
    
    [m,i1] = min(abs(mod_raw-mod_value)); %첫번째 최소값 얻기
    [t1,j1] = min(m); %t1에는 mod_value와 정규분포표 차이의 최소값이 들어갑니다. (내삽 시 사용)
    mod_raw(i1(j1),j1) = -10; % 두번째 최소값을 얻기 위함
    if t1 ~= 0 % 만약 t1의 값이 0이라면 정규분포표 값에 딱 나누어떨어진다는 뜻입니다.
        fprintf("Interpolated ");
    end
    [m,i2] = min(abs(mod_raw-mod_value)); 
    [t2,j2] = min(m);
    t3 = t1+t2; %내삽을 위한 값
    % t1과 t2는 mod_value에 대한 각각의 최소값을 가집니다. 내삽 과정
    % 내삽은 항상 이루어져도 값에는 변함이 없습니다. 출력값을 간소화하기 위해 조건 없이 항상 내삽합니다.
    t = (index_p(i1(j1)-33)+index_t(j1)*0.01)*t2/t3+(index_p(i2(j2)-33)+index_t(j2)*0.01)*t1/t3;
    fprintf("critical value t is %.4f\n",t);
    disp("The region to meet the probability is");
    fprintf("%.4f - %.4f*%.4f < t < %.4f + %.4f*%.4f = %.4f < t < %.4f\n",avg,t,st,avg,t,st,avg-t*st,avg+t*st);
else
    fprintf("플래그 값에 문제가 있습니다.\n");
end
end