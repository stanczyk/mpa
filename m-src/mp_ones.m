function [Z] = mp_ones(x, y)
   %   (max, +) ones array
   %
   %   MP_ONES returns (max, +) unit (0).
   %   MP_ONES(x) or MP_ONES([x]) is an x-by-x matrix of (max, +) ones.
   %   MP_ONES(x, y) or MP_ONES([x, y]) is an x-by-y matrix of (max, +) ones.
   %   MP_ONES(SIZE(A)) is the same size as A and all (max, +) ones.
   %
   %   See also
   %   MP_ONE, MP_ZERO, MP_ZEROS, MP_EYE, MP_MULTI
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
         Z = 0;
      case 1
         check(x);
         Z = zeros(x);
      case 2
         check(x);
         check(y);
         Z = zeros(x, y);
   end
end

% end of file