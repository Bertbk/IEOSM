%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the derivatives of the Bessel function J
% dj=dbesselj(m,x) 
% m = order, x = evaluation point  
% Taken from the help of besselj:
%    If m and x are arrays of the same size, the result is also that size.
%    If either input is a scalar, it is expanded to the other input's size.
%    If one input is a row vector and the other is a column vector, the
%    result is a two-dimensional table of function values.
function dj = dbesselj(m,x)
dj = (besselj(m-1,x)-besselj(m+1,x))/2;
