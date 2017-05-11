%% Matlab code associated to the article
% "Integral equation based optimized Schwarz method for electromagnetics"
% X. Claeys, B. Thierry and F. Collino
% ~~~~~~~~
% Eigenvalues of the iteration operator for the nonlocal conditions
% for Maxwell's equation
clear all;
close all;

%label on figure ?
doLabel = false;
%Relaxation parameter
r = 0.5;
%Wavenumber
k = 10;
%Impedance parameter alpha
alpha = k;
%Mode numbers vector
NN = [1:max(200, 5*k)].';

%% Computation of the eigenvalues
andp = an(NN, k, alpha, 'D', +1);
andm = an(NN, k, alpha, 'D', -1);
ancp = an(NN, k, alpha, 'C', +1);
ancm = an(NN, k, alpha, 'C', -1);

eigD = [(1-r) + r * sqrt(andp.*andm);
        (1-r) - r * sqrt(andp.*andm)];
eigC = [(1-r) + r * sqrt(ancp.*ancm); 
        (1-r) - r * sqrt(ancp.*ancm)];

%% Figure
figure(1); clf(1);
hold on;
plot(real(eigD), imag(eigD), '+', 'DisplayName', '$$(1-r) \pm r \sqrt{a_{n,+}^Da_{n,-}^D}$$');
plot(real(eigC), imag(eigC), 'o', 'DisplayName', '$$(1-r) \pm r\sqrt{a_{n,+}^Ca_{n,-}^C}$$');
hold off;
axis([-1 1 -1 1]);
if(doLabel)
    title(['Eigenvalues of the iteration operator for k=',num2str(k),[', ' ...
                        'r='],num2str(r),' and \alpha=',num2str(alpha)]);
    xlabel('Real part');
    ylabel('Imaginary part');
    h = legend('show');
    set(h,'Interpreter','latex');
end
saveas(gcf, ['eig_k_',num2str(k),'_r_',num2str(r),'.eps'], 'epsc');

%% save data in file

eigR = real([eigD;eigC]);
eigI = imag([eigD;eigC]);

fid=fopen(['eig_k_',num2str(k),'_r_',num2str(r),'.txt'], 'w+');
for i = 1:length(eigR)
    fprintf(fid, "%.15f \t %.15f\n", eigR(i), eigI(i)); 
end
fclose(fid);

