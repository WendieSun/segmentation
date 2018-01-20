function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S

% size of X
[m, n] = size(X);

% initialise return values
U = zeros(n);
S = zeros(n);

% compute the covariance matrix
sigma = 1/m * (X' * X);

% compute eigenvector of sigma
[U, S, V] = svd(sigma);


end
