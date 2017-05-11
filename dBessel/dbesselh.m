%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Computes the derivative the Hankel function of the kind K and of
% order m
% dh = dbesselh(m,,K,x) 
% m = order, x = evaluation point  
% Taken from the help of besselh:
%    If m and x are arrays of the same size, the result is also that size.
%    If either input is a scalar, it is expanded to the other input's size.
%    If one input is a row vector and the other is a column vector, the
%    result is a two-dimensional table of function values.
function dh = dbesselh(m,K,x)
    if (K == 1)
        dh =  (besselh(m-1,1,x)-besselh(m+1,1,x))/2;
    else if (K == 2)
        dh =  (besselh(m-1,2,x)-besselh(m+1,2,x))/2;
    else
        error('K is not equal to 1 or 2');
    end
end
