%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the derivative of YYn (n can be an array)
function dy = dYYn(n, x)
%Derivation of the first term
    yn = 1/2/sqrt(x)*sqrt(pi/2)*bessely(n + 1/2, x);
    %Derivation of the second term
    dyn = sqrt(pi * x /2)*dbessely(n + 1/2, x);
    %sum
    dy = yn + dyn;

end