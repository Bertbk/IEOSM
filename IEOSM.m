%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Convergence factor for the nonlocal condition
% for different values of k
clear all;
close all;

%% Parameters
%label on figure ?
doLabel = true;
%Relaxation
r = 0.5;
%Wavenumbers
vec_k = [10];
%Alpha parameters (of the impedance)
vec_alpha = vec_k;
%Vector of the modes number
NN = [1:200];
%Color vector (for the curves)
colork = {'-k', '-.b', '--r'};

%% Computation of the convergence factors
nk = length(vec_k);
rho = zeros(length(NN),nk);
for ik = 1:nk
    k = vec_k(ik);
    alpha = k;
    rho(:,ik)  = rho_IE_n(NN, r, k, alpha);
end
%% Output
filename = ['rho_r_', num2str(r),'_k_'];
for ik = 1:nk
filename = [filename, num2str(vec_k(ik)),'_'];
end


%% Display
figure(1); clf(1);
hold on;
for ik = 1:nk
    k = vec_k(ik);
    alpha = k;
    plot(NN, rho(:,ik), colork{mod(ik-1,length(colork))+1}, 'DisplayName', ['$$\rho(',num2str(k),')$$']);
end
plot(NN, 1./sqrt(2).*ones(size(NN)), ':', 'DisplayName', ['$$\frac{1}{\' ...
                    'sqrt{2}}$$']);
hold off;
if(doLabel)
    title(['\rho(k) with r = ', num2str(r),', \alpha= k']);
    xlabel('n');
    h = legend('show');
    set(h,'Interpreter','latex')
end
axis([1 max(NN) 0 1])
saveas(gcf, [filename, '.eps'], 'epsc')
saveas(gcf, [filename, '.png'], 'png')

%% Save data in files
%Separately...
for ik = 1:nk
    k = vec_k(ik);
    fid=fopen(['rho_k_',num2str(k),'_r_',num2str(r),'.txt'], 'w+');
    for i = 1:length(NN)
        fprintf(fid, "%.15f\n", rho(i,ik));
    end
    fclose(fid);
end

%... And regrouped in one file
%k1             k2          k3       ...
%rho(k1, 0)    rho(k2,0)   rho(k3,0) ... 
%rho(k1, 1)    rho(k2,1)   rho(k3,1) ... 
%rho(k1, 2)    rho(k2,2)   rho(k3,2) ... 
%...

fid=fopen([filename,'.txt'], 'w+');
for ik = 1:nk
    fprintf(fid, "%d\t", vec_k(ik));
end
fprintf(fid, "\n");
for i = 1:length(NN)
    for ik = 1:nk
        fprintf(fid, "%.15f\t", rho(i,ik));
    end
    fprintf(fid, "\n");
end
fclose(fid);

