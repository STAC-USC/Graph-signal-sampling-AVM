function U_vr = get_evecs(A, r, lap_type, fast)
    % Since a lot of algorithms need the lower eigenvectors of the
    % Laplacian given the Adjacency matrix to avoid repeating the code
    % again, creating a function for returning the lowest eigenvectors.        
    % A: Adjacency matrix.
    % r: The number of lowest eigenvectors we are interested in.
    
    if ~exist('lap_type','var') || lap_type == 'p'
        L = construct_laplacian(A,'p');
    elseif lap_type == 'n'
        L = construct_laplacian(A,'n');
    else
        error('This code accepts only combinatorial and normalized laplacian matrices.');
    end
    
    if ~exist('fast','var') || fast == false
        [U,~,~] = svd(full(L));
        U_asc = fliplr(U);
        U_vr = U_asc(:,1:r);
    elseif fast == true
        [U,~,~] = svds(L,r,'smallest');
        U_vr = fliplr(U);
    else
        error('This code accepts only combinatorial and normalized laplacian matrices.');
    end
    
    
end