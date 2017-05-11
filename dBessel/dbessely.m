%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the derivatives of the Bessel function Y
% dy=dbessely(m,x) 
% m = order, x = evaluation point  
% Taken from the help of bessely:
%    If m and x are arrays of the same size, the result is also that size.
%    If either input is a scalar, it is expanded to the other input's size.
%    If one input is a row vector and the other is a column vector, the
%    result is a two-dimensional table of function values.
function dy = dbessely(m,k)

dy = (bessely(m-1,k)-bessely(m+1,k))/2;