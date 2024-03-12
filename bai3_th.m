a = 1;
b = 3;
c= a+b+2;
A = [a  -b  -c; c  2*b -a; a  c  -3*c];
b = [10; 5; 2];

det_a = det(A);
%ma tr?n khác 0
if det_a ~= 0
    x = linsolve(A, b);
    disp('he phuong trinh co nghiem la:');
    disp(x);
else
    disp('He phuong trinh vo nghiem hoac co vo so nghiem');
end