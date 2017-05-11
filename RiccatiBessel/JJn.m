%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the Riccati-Bessel function of first kind (n can be an array):
% j(x) = \sqrt(\pi.x/2)* besselj(n+1/2, x)
function j = JJn(n, x)
  j = sqrt(pi*x./2)*besselj(n+1/2, x);
end