%% Matlab code associated to the article
%% "Integral equation based optimized Schwarz method for electromagnetics"
%% X. Claeys, B. Thierry and F. Collino
%% ~~~~~~~~
%% Computes the convergence factor \rho

function rho = rho_IE_n(n, r, k, alpha)
    
    anDp = an(n, k, alpha, 'D', 1 );
    anDm = an(n, k, alpha, 'D', -1);
    anCp = an(n, k, alpha, 'C', 1 );
    anCm = an(n, k, alpha, 'C', -1);

    rho_tDp = abs(1 - r + r*sqrt(anDp.*anDm));
    rho_tDm = abs(1 - r - r*sqrt(anDp.*anDm));
    rho_tCp = abs(1 - r + r*sqrt(anCp.*anCm));
    rho_tCm = abs(1 - r - r*sqrt(anCp.*anCm));

    rho = max([rho_tDp; rho_tDm; rho_tCp; rho_tCm]);
end