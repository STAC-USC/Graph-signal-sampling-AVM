function [recon] = pseudo_inv_bool_recon_lowpass(S, Uv, sig, n_R)
    % This function is a version of the pseudo_inv_bulk_recon_lowpass such
    % that the samples are given as a boolean matrix with each column as
    % one set of samples.
    % This function does reconstruction for multiple values number of
    % samples.
    % S: Array which contains the samples taken on the graph in order.
    % L: Laplacian matrix.
    % samp: Samples of the signal on the graph at the locations given by S.
    % n_R: Number of lowpass basis vectors to take
    % n_S: This contains the number of samples at which we will find the
    % reconstruction.
    % sig: The original signal which is sampled here and reconstructed.
    % cumCoh was included because gilles_recon needed cumCoh so that it is
    % not computed repeatedly for calls to the function. Since all
    % reconstruction functions will have the same arguments because it is
    % convenient for handles, we are including it here also.

    N = size(Uv, 1);
    Uvr = Uv(:, 1:n_R); clear Uv;
    sig = sig(:);

    % Input check that S matrix is boolean
    if ~islogical(S)
        error('Expecting samples S to be a logical array');
    end
    % Check that samples are along the column
    if size(S, 1)~=N
        error('The samples should be along the column');
    end

    l_S = size(S, 2);
    recon = zeros(N, l_S);

    for i=1:l_S
        S_ind = S(:, i);
        recon(:, i) = Uvr*pinv(Uvr(S_ind, :))*sig(S_ind);
    end

end
