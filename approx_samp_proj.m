function Samp = approx_samp_proj(proj_ene, s, proj_fnh)
    % Given a projection matrix this function selects s samples
    % proj_ene: Energy in the projections from 1 to N. Here we'll assume we
    % can somehow compute that.
    % proj_fnh: Projection function handle

    if ~isscalar(s)
        error('The number of samples should be a scalar');
    end

    N = size(proj_ene,1);
    Samp = false(N,1);
    sum_proj = zeros(N,1);

    for j = 1:s
            proj = proj_ene - sum_proj; % Do these calculations for all vertices
            [~,m_ind] = max(proj(~Samp)); % Find maximum which is not in the current
            S_cur = find(~Samp);
            Samp(S_cur(m_ind)) = true; % Adding the new vertex
	    n_vert = S_cur(m_ind);

            new_proj = proj_fnh(n_vert);
            sum_proj = sum_proj + new_proj.^2/new_proj(n_vert); % Compute new products
    end
end
