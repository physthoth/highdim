% RAYLEIGH                    Rayleigh statistic for spherical uniformity 
% 
%     Rnp = rayleigh(U)
%
%     Most powerful invariant test against von Mises alternative.
%
%     INPUTS
%     U - [n x p] matrix, n samples with dimensionality p
%         the data should already be projected to the unit hypersphere
%
%     OUTPUTS
%     Rnp - statistic
%
%     REFERENCE
%     Mardia, KV, Jupp, PE (2000). Directional Statistics. John Wiley
%
%     SEE ALSO
%     spheresign

%     $ Copyright (C) 2014 Brian Lau http://www.subcortex.net/ $
%     The full license and most recent version of the code can be found on GitHub:
%     https://github.com/brian-lau/spheretest
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function Rnp = rayleigh(U)

[n,p] = size(U);

if 0
   Rnp = (p/n)*sum(sum(U*U'));
else
   % Modified Rayleigh test statistic (Mardia & Jupp, eq. 10.4.6)
   Ubar = mean(U);
   T = n*p*sum(Ubar.^2);
   Rnp = (1-1/(2*n))*T + (1/(2*n*(p+2)))*T^2;
end