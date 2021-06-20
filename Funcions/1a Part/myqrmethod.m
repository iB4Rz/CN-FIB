function [H,steps] = myqrmethod(A)
% Computes all the eigenvalues of a matrix using the QR method.
% Input: A -- square matrix
% Outputs: E -- vector of eigenvalues
% steps -- the number of iterations it took
[m n] = size(A);
if m ~= n
    warning('The input matrix is not square.')
return
end
% Set up initial estimate
H = hess(A);
E = diag(H);
change = 1;
steps = 0;
% loop while estimate changes
while (change > eps && steps < 250)
    Eold = E;
    % apply QR method
    [Q R] = qr(H);
    H = R*Q;
    % test change
    change = norm(tril(H,-1));
    steps = steps +1;
end
change,H
end