function demo_sample_and_reconstruct(gspbox_path, random_sampling_package_path)
    % gspbox_path: The system path to the gspbox toolbox
    % random_sampling_package_path: The system path to the random sampling package

    % Collect and add paths
    extra_package_paths = [genpath(gspbox_path), genpath(random_sampling_package_path)];
    addpath(extra_package_paths);

    % Constructing knn graph from vertices randomly spread out on 2d plane
    number_vertices = 1000;
    number_neighbors_parameter.nnparam.k = 8;
    graph = gsp_sensor(number_vertices, number_neighbors_parameter);

    % Sample the graph
    number_samples = 200;
    sampled_vertices = dot_prod_samp_est_k(graph.W, number_samples);

    % Define an approximately bandlimited signal on the graph
    signal_bandwidth = 50;
    graph_with_laplacian = gsp_create_laplacian(graph, 'combinatorial');
    noise_power = 0.1;
    speedup_signal_construct = false;
    original_signal = get_bandlim_signal_plus_noise(graph_with_laplacian.L, signal_bandwidth, noise_power, speedup_signal_construct);

    % Reconstruct the graph signal
    reconstruction_freq = 50;
    graph_with_fourier_basis = gsp_compute_fourier_basis(graph_with_laplacian);
    eigenvecs_bandwidth = graph_with_fourier_basis.U(:, 1:reconstruction_freq);
    reconstructed_signal = pseudo_inv_bool_recon_lowpass(sampled_vertices, eigenvecs_bandwidth, original_signal, reconstruction_freq);

    % Plot the sampled vertices
    figure;
    highlight_parameter.vertex_highlight = sampled_vertices;
    gsp_plot_signal(graph, original_signal, highlight_parameter);

    % Plot the reconstruction and the original signal
    figure;
    gsp_plot_signal(graph, original_signal);
    figure;
    gsp_plot_signal(graph, reconstructed_signal);
    figure;
    plot(original_signal); hold on;
    plot(reconstructed_signal);
    legend('Original signal', 'Reconstructed signal');

    % Remove added paths
    rmpath(extra_package_paths);
end
