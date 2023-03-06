function [z] = mpm_zero()
   %   (min, +) zero (Inf)
   %   (min, +) neutral element for (min, +) addition
   %
   %   MPM_ZERO returns (min, +) zero (Inf)
   %
   %   See also
   %   MPM_ZEROS, MPM_ONE, MPM_ONES, MPM_EYE, MP_ADD
   %
   %   Introduced in ver.1.5
   %
   %   Max-Plus Algebra Toolbox for Matlab, ver.1.8, 2023-March-06
   %   Copyright (C) 2003-2023 Jaroslaw Stanczyk, <jaroslaw.stanczyk@upwr.edu.pl>

   narginchk(0, 0);

   z = inf;
end

% end of file