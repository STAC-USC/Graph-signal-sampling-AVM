function proj = vert_proj_filt(G, vert, lambda_k)
    % This function gives the projection by approximating a filter for the
    % ideal low pass filter.
    % k: The number of low pass vectors we are trying to project on.

    % Estimate the lambda max of G
    G = gsp_estimate_lmax(G);

    % Approximate the filter coefficients
    poly_order = 30;
    coeffs = gsp_jackson_cheby_coeff(0, lambda_k, [0 G.lmax], poly_order);

    % Filter the vertex
    N = size(G.W, 1);
    delt_sig = zeros(N, 1); delt_sig(vert) = 1;
    proj = gsp_cheby_op(G, coeffs, delt_sig);

end
