function [Z] = mp_zeros(x, y)
   %   (max, +) zeros array
   %
   %   MP_ZEROS returns (max, +) zero (-Inf).
   %   MP_ZEROS(x) or MP_ZEROS([x]) is an x-by-x matrix of (max, +) zeros.
   %   MP_ZEROS(x, y) or MP_ZEROS([x, y]) is an x-by-y matrix of (max, +) zeros.
   %   MP_ZEROS(SIZE(A)) is the same size as A and all (max, +) zeros.
   %
   %   See also 
   %   MP_ZERO, MP_ONE, MP_ONES, MP_EYE, MP_ADD
   %
   %   Introduced in ver.0.1
   %
   %   Max-Plus Algebra Toolbox for Matlab, ver.1.8, 2023-March-06
   %   Copyright (C) 2003-2023 Jaroslaw Stanczyk, <jaroslaw.stanczyk@upwr.edu.pl>

   function check(a)
      if (a < 0) || (floor(a) != a)
         error('mp_ones: accepts positive integer arguments');
      end
   end

   narginchk(0, 2);

   switch nargin
      case 0
         Z = -inf;
      case 1
         check(x);
         Z = ones(x) * -inf;
      case 2
         check(x);
         check(y);
         Z = ones(x, y) * -inf;
   end
end

% end of file
