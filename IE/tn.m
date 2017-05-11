%% Matlab code associated to the article
%% "Integral equation based optimized Schwarz method for electromagnetics"
%% X. Claeys, B. Thierry and F. Collino
%% ~~~~~~~~
%% Compute the t^{star}_{n, \sigma} (x) coefficients

function t = tn(n, x, star, mysign)
    if(star ~= 'D' && star ~= 'C')
        error('star is not equal to C or D');
    end
    if(mysign == -1)
        djn = dJJn(n, x);
        jn  = JJn(n, x);
        res = 1i*djn./jn;
        if(star == 'D')
            t = res;
        end
        if(star == 'C')
            t = 1./res;
        end
    end

    if(mysign == +1)
        dhn = dHHn(n, x);
        hn  = HHn(n, x);
        res = -1i*dhn./hn;
        if(star == 'D')
            t = res;
        end
        if(star == 'C')
            t = 1./res;
        end
    end
    
end