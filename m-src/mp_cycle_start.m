function [z] = mp_cycle_start(X, cycle)
   %
   %   Introduced in ver.1.8
   %
   %   Max-Plus Algebra Toolbox for Matlab, ver.1.8, 2023-March-06
   %   Copyright (C) 2003-2023 Jaroslaw Stanczyk, <jaroslaw.stanczyk@upwr.edu.pl>

   narginchk(2, 2);

   sizeX = size(X);
   % sizeX(1, 1) % -- ile elementów w wektorze
   % sizeX(1, 2) % -- ile wektorów

   for i = 1:sizeX(1, 2)-1
      ans = 0;
      for j = 1:sizeX(1, 1)
         % disp([X(j,i) + cycle, X(j,i+1)])
         if (X(j, i) + cycle) ~= X(j, i+1)
            ans = 1;
         end
      end

      if ans == 0
         z = i;
         return
      end

   end
   z = 0;
end

% end of file