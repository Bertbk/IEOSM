%% Matlab code associated to the article
%% "Integral equation based optimized Schwarz method for electromagnetics"
%% X. Claeys, B. Thierry and F. Collino
%% ~~~~~~~~
%% Computes the impedance modes: z^{star}_{n}(\alpha)

function z = zn(n, alpha, star)
    if(star ~= 'D' && star ~= 'C')
        error('star is not equal to C or D');
    end

  if(star == 'D')
      djn = dJJn(n, 1i*alpha);
      dhn = dHHn(n, 1i*alpha);
      z = 2*djn.*dhn;
  end

  if(star == 'C')
      jn = JJn(n, 1i*alpha);
      hn = HHn(n, 1i*alpha);
      yn = YYn(n, 1i*alpha);
      z = 2*jn.*hn;
  end
end