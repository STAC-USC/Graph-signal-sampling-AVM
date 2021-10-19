% Given a graph g we construct the laplacian from the adjacency matrix and
% return it. This function uses the graph datastructure from grasp
% 'n' normalized
% 'p' plain, not normalized
function [lap] = construct_laplacian(A,type_l)
    % A: adjacency matrix
    N = size(A,1);

    % The reason d is calculated inside is because computing with a sparse
    % matrix gives sparse output while computing with full matrix gives
    % full output.
    if issparse(A)
        d = sum(A,2);        
        dinv = d;
        dinv(d~=0) = d(d~=0).^(-1/2);
        D = spdiags(d,0,N,N);
        Dinv = spdiags(dinv,0,N,N);
    else
        d = sum(A,2);
        D = diag(d);
        dinv = d;
        dinv(d~=0) = d(d~=0).^(-1/2);
        Dinv = diag(dinv);        
    end
    
    if type_l == 'n'
        lap = Dinv*D*Dinv - Dinv*A*Dinv;
    elseif type_l == 'p'
        lap = D - A;
    else
        error('Unrecognized Laplacian type.');
    end        
end