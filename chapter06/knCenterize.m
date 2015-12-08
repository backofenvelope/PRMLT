function Kc = knCenterize(kn, X, Xt)
% Centerize the data in the kernel space
%   kn: kernel function
%   X: dxn data matrix of which the center is computed
%   Xt(optional): dxn test data to be centerized by the center of X
% Written by Mo Chen (sth4nth@gmail.com).
K = kn(X,X);
mK = mean(K);
mmK = mean(mK);
if nargin < 3
    % Kc = K-M*K-K*M+M*K*M; where M = ones(n,n)/n; 
    Kc = K+mmK-bsxfun(@plus,mK,mK');
else
    Kt = kn(X,Xt);
    mKt = mean(Kt);
    Kc = Kt+mmK-bsxfun(@plus,mKt,mK');
end