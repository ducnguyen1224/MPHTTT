% B21DCVT135
a = 1;
b = 5;
c = 2 * b - a;

% a
disp('� A');
A = [a -b -c; c 2*b -a; a c -3*c];
B = [10; 5; 2];
disp('matrix A:');
disp(A);

disp('matrix B:');
disp(B);
% b
disp('� b');
new_size=b+4;
extended_A = ones(new_size);

% gi� tr? c?a c�c ph?n t? trong ph?n m? r?ng b?ng gi� tr? a
new_A(:,:) = a;
%  gi� tr? c?a ph?n t? t?i h�ng (b+4) c?t (b+4) b?ng 10
new_A(b+4, b+4) = 10;
disp('Ma tr?n A sau khi m? r?ng:');
disp(new_A);
% c 
disp('� C');
C= randi([0,1],5 ,10);
disp('ma tr?n ng?u nhi�n ')
disp(C);
