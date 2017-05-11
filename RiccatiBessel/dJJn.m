%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the derivative of JJn (n can be an array)
function dj = dJJn(n, x)
%Derivation of the first term
    jn = 1/2/sqrt(x)*sqrt(pi/2)*besselj(n + 1/2, x);
    %Derivation of the second term
    djn = sqrt(pi * x /2)*dbesselj(n + 1/2, x);
    %sum
    dj = jn + djn;
end