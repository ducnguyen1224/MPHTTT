function [Xn] = Fibonnaci( N )
   if (N == 1 || N == 2)
        Xn=1;
   else
       N = Fibonnaci(N - 1) + Fibonnaci(N - 2);
       Xn = N;
   end
   
end