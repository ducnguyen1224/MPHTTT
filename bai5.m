% pt
ode = @(t, x) [-x(2); x(1)]; 

% dieu kien ban dau 
initial_conditions = [1; 0];

% Giải phương trình vi phân
[t, sol] = ode45(ode, [0, 10], initial_conditions);

% hien thi 
plot(t, sol(:, 1), 'r', t, sol(:, 2), 'b');
legend('y(t)', 'ij(t)');
xlabel('Thời gian');
ylabel('Giá trị');
title('Giải phương trình vi phân bậc nhất');