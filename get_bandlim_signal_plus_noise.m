function [xn, x] = get_bandlim_signal_plus_noise(L, R, n_pow, fast)
    % This function returns a power 1 bandlimited signal plus noise of desired power.
    % R: Bandwidth of the signal
    % n_pow: noise power.
    N = size(L, 1);
    sig_pow = 1;

    x_coeff = wgn(R, 1, 10*log10(sig_pow/R));
    noise = wgn(N, 1, 10*log10(n_pow/N));

    if ~exist('fast', 'var') || fast == false
        [U1, ~, ~] = svd(full(L));
        U1_asc = fliplr(U1);
        Uvr = U1_asc(:, 1:R);
    elseif fast == true
        if ~issparse(L)
            warning('Expecting a sparse Laplacian with the fast method.');
            [U1, ~, ~] = svds(sparse(L), R, 'smallest');
        else
            [U1, ~, ~] = svds(L, R, 'smallest');
        end
        Uvr = fliplr(U1);
    else
        error('This code accepts only combinatorial and normalized laplacian matrices.');
    end

    x = Uvr*x_coeff;
    xn = x + noise;
end
