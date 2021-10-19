function param = get_rand_param(N)
    % Creating a function for this because a lot of functions are using the
    % parameter and don't want to use different parameter in different
    % places.
    param.nb_features = round(10*log(N));
end
