function Samp = dot_prod_samp_est_k(A, S, varargin)
    % This function is the same as dot_prod_samp but instead of doing an
    % eignedecomposition, it estimates the corresponding eigenvalue of the
    % graph laplacian.
    N = size(A, 1);
    Samp = false(N, length(S));

    if isempty(varargin) || varargin{1} == 'p'
        G = gsp_create_laplacian(gsp_graph(A), 'combinatorial');
    elseif varargin{1} == 'n'
        G = gsp_create_laplacian(gsp_graph(A), 'normalized');
    else
        error('Third argument should either be ''p\'', ''n'' or empty.\n');
    end

    % Estimate the lambda max of G
    G = gsp_estimate_lmax(G);

    for i=1:length(S)
        k = S(i);

        % Estimate the coherences
        [lambda_k, proj_ene] = gsp_estimate_lk(G, k, get_rand_param(N)); % With the default parameter for the number of random vectors

        proj_fh = @(vert) vert_proj_filt(G, vert, lambda_k);

        Samp(:, i) = approx_samp_proj(proj_ene, S(i), proj_fh);
    end
end
