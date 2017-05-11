%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the following Riccati Bessel function  (n can be an array):
% h(x) = \sqrt(\pi.x/2)* besselh(n+1/2, 1, x)
function h = HHn(n, x)
    h = sqrt(pi.*x./2) .* besselh(n+0.5, 1, x);
end