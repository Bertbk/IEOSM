%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the derivative of HHn (n can be an array):
function dh = dHHn(n, x)
    hn = 1/2/sqrt(x)*sqrt(pi/2)*(besselh(n+1/2, x));
    dhn = sqrt(pi * x /2)*dbesselh(n + 1/2, 1, x);
    dh = hn + dhn;
end