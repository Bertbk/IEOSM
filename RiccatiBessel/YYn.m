%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the Riccati-Bessel function of second type
% y(x) = \sqrt(\pi.x/2)* bessely(n+1/2, x)

function y = YYn(n, x)
  y = sqrt(pi*x./2)*bessely(n+1/2, x);
end