function mp_tab4latex(X, Y, fileName)
   %   table generation from X to LaTeX source
   %
   %   MP_TAB4LATEX(X, Y, fileName)
   %   - X state vector evolved in time (actually matrix),
   %   - Y output vector evolved in time (actually matrix),
   %   - fileName (optional) a file for source latex code, default: mp_tab.tex
   %
   %   See also
   %   MP_MX2LATEX, MP_GANTT4LATEX
   %
   %   Introduced in ver.1.8
   %
   %   Max-Plus Algebra Toolbox for Matlab, ver.1.8, 2023-March-06
   %   Copyright (C) 2003-2023 Jaroslaw Stanczyk, <jaroslaw.stanczyk@upwr.edu.pl>

   narginchk(2, 3);
   switch nargin
      case 2
         fileName = 'mp_tab.tex';
   end

   if (isempty(X))
      error('mp_gantt4latex: an empty input parameter')
   end

   SizeX = size(X);

   fid = fopen(fileName, 'w+');
   fprintf(fid, '\\begin{tabular}{|c|');

   for i = 1:SizeX(1, 2)
      fprintf(fid, 'c');
   end
   fprintf(fid, '|}\n\\hline\n\\rowcolor{black}\n\\textcolor{white}{$k$} &\n');

   for i = 1:SizeX(1, 2)
      fprintf(fid, '\\textcolor{white}{%d}', i);
      if i ~= SizeX(1, 2)
         fprintf(fid, ' & \n');
      else
         fprintf(fid, '\\\\\n');
      end
   end
   fprintf(fid, '\\hline\n');

   fprintf(fid, '\\cellcolor{gray1} $\\mathbf{x}(k)$ &\n');
   for i = 1:SizeX(1, 2)
      fprintf(fid, '$\\begin{array}{*{20}c}');
      for j = 1:SizeX(1, 1)
         fprintf(fid, ' %d \\\\', X(j, i));
      end
      if (i == SizeX(1, 2))
         fprintf(fid, '\\end{array}$ \\\\\\hline\n');
      else
         if (mod(i, 2))
            fprintf(fid, '\\end{array}$ & \\cellcolor{gray1}\n');
         else
            fprintf(fid, '\\end{array}$ &\n');
         end
      end
   end

   SizeY = size(Y);
   fprintf(fid, '\\cellcolor{gray1} $\\mathbf{y}(k)$ &\n');

   for i = 1:SizeY(1, 2)
      fprintf(fid, '$\\begin{array}{*{20}c}');
      for j = 1:SizeY(1, 1)
         fprintf(fid, ' %d \\\\', Y(j, i));
      end
      if (i == SizeY(1, 2))
         fprintf(fid, ' \\end{array}$ \\\\\\hline\n');
      else
         if (mod(i, 2))
            fprintf(fid, '\\end{array}$ & \\cellcolor{gray1}\n');
         else
            fprintf(fid, '\\end{array}$ &\n');
         end
      end
   end

   fprintf(fid, '\\end{tabular}\n');
   fclose(fid);
end

% end of file
