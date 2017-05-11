%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Maximum value of the convergence factor for the nonlocal conditions
% for different values of k
% This shows that: 1-maxrho(k) = C/k^a

clear all;
close all;

%% Parameters
%Relaxation
r = 0.5;
%Wavenumbers
vec_k = [10:200].';
%Alpha parameters (of the impedance)
vec_alpha = vec_k;

%% Computation of the convergence factors
%% And extraction of its maximum value
nk = length(vec_k);
maxrho = zeros(nk, 1);
indmaxrho = zeros(nk, 1);
for ik = 1:nk
    k = vec_k(ik);
    %Vector of the modes number
    NN = [0:max(100,3*k)];
    alpha = k;
    rho  = rho_IE_n(NN, r, k, alpha);
    maxrho(ik) = max(rho);
    indmaxrho(ik) = NN(find(rho == max(rho), 1));
    if(indmaxrho(ik) == NN(end))
        error(['NN is probably not long enough for k', num2str(k)]);
    end    
end

%% Log scale and computation of "a" and "C"
logrhomax = log10(1-maxrho);
logk = log10(vec_k);
%linear regression
A = [logk, ones(nk,1)];
res = A\logrhomax;
a = -res(1);
C = exp(res(2));

%% Display
figure(1); clf(1);
hold on
plot(logk, logrhomax,'DisplayName', ['$$\log_{10}(1-\max_n(\rho))$$']);
plot(logk, log(C) - a*logk, '--','DisplayName', ['$$',num2str(-a),'\log_{10}(k) ',num2str(log(C)),'$$']);
hold off
title(['Log-scale of (1- maximum value of \rho) with r = ', num2str(r),', \alpha= k']);
xlabel('log(k)');
ylabel('log(1-max(rho))');
h = legend('show');
set(h,'Interpreter','latex')
saveas(gcf, 'rho_max_log.eps', 'epsc')
saveas(gcf, 'rho_max_log.png', 'png')


figure(2); clf(2);
asymp =  1 - C./((vec_k).^a);
hold on
plot(vec_k, maxrho, 'DisplayName', '$$\max_n(\rho)$$');
plot(vec_k, asymp, '--', 'DisplayName', ['$$1-\frac{',num2str(C),'}{k^{',num2str(a),'}}$$']);
hold off
title(['Maximum value of \rho with r = ', num2str(r),', \alpha= k']);
xlabel('k');
ylabel('max(rho)')
h = legend('show');
set(h,'Interpreter','latex')
saveas(gcf, 'rho_max.eps', 'epsc')
saveas(gcf, 'rho_max.png', 'png')



