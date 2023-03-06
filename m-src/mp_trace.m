function [v] = mp_trace(A)
   %   (max, +) trace of a matrix
   %
   %   MP_TRACE(A) returns (max, +) trace of matrix A, i.e:
   %       the (max, +) sum of main diagonal of A
   %   (or equivalently, a maximal element from main diagonal of A).
   %
   %   See also
   %   MP_ADD
   %
   %   Introduced in ver.0.1
   %
   %   Max-Plus Algebra Toolbox for Matlab, ver.1.8, 2023-March-06
   %   Copyright (C) 2003-2023 Jaroslaw Stanczyk, <jaroslaw.stanczyk@upwr.edu.pl>
   
   narginchk(1, 1);
   
   if isempty(A)
      % error('MP_TRACE: empty input value');
      v = mp_zero;
      return
   end
   
   sizea = size(A);
   if sizea(1, 1) > sizea(1, 2)
      j = sizea(1, 2);
   else
      j = sizea(1, 1);
   end
   
   v = A(1, 1);
   for i = 2:j
      v = mp_add(v, A(i, i));
   end
end

% end of file 
