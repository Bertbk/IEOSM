%% Matlab code associated to the article
%% "Integral equation based optimized Schwarz method for electromagnetics"
%% X. Claeys, B. Thierry and F. Collino
%% ~~~~~~~~
%% Compute the a_n^D and a_n^C coefficients
function a = an(n, k, alpha, star, mysign)

    if(star ~= 'D' && star ~= 'C')
        error('star is not equal to C or D');
    end
    
    tt = tn(n, k, star, mysign);
    zz = zn(n, alpha, star);
    a = (tt - zz)./(tt+zz);
end
