# Graph signal sampling

We measure values of a real valued smooth signal on the specific nodes of on a network using graph signal sampling.

<img src="figures/samples.png" alt="" width="200">

Using these known values, we can predict the signal values on the remaining nodes of a network.

<img src="figures/signal.png" alt="" width="200">

# How to sample graph signals

The software in this repository implements the *Approximate volume maximization* algorithm for graph signal sampling from [this paper](https://www.sciencedirect.com/science/article/pii/S0165168421004734).

## Download and Install

For this tutorial, I assume you are using a UNIX like OS.

### Software dependencies

This repository uses the following packages. They need to be downloaded in order to run the software in this respository.
- [GSPbox](https://github.com/epfl-lts2/gspbox/releases/latest)
- [GraphSamplingBox](https://archive.softwareheritage.org/browse/directory/e27b8849b4845e050049b1ceae73520a54a7c9f5/?origin_url=https://hal.archives-ouvertes.fr/hal-02960713&revision=3dc10882e6c8e08939d75c364a99a5b4270992e3&snapshot=834da05eaba8d5fd214a05d722acc017d17826dd)

Download and uncompress these packages in any directory on your computer. For this tutorial, I will assume that you placed all downloads in `~/Downloads`.

### Download this repository

Change directory to `~/Downloads`.
```
cd ~/Downloads
```

Clone this repository from GitHub.
```
git clone https://github.com/STAC-USC/Graph-signal-sampling-AVM.git
```

Change directory to that of the downloaded repository.
```
cd Graph-signal-sampling-AVM
```

## Run the algorithm

Start matlab.
```
matlab &
```

Run the algorithm at the MATLAB command prompt. The demo function takes two arguments - path of the GSP toolbox, and path of the GraphSamplingBox.
```
demo_sample_and_reconstruct('~/Downloads/gspbox', '~/Downloads/GraphSamplingBox');
```

## View results
If you're able to run the code succcessfully, you should be able to see results similar to these.

You should be able to see the sampled vertices highlighted in red.
<img src="figures/samples_from_simulation.png" alt="" width="400">

You should be able to see the original and the reconstructed signal comparison in a single plot.
<img src="figures/original_reconstructed_signal_superimpose.png" alt="" width="400">

# Support this work

Your appreciation motivates me to do rigorous research and develop quality software. If you find this software useful, you can show your appreciation by starring the repository. If you use this software towards your research, cite [this paper](https://www.sciencedirect.com/science/article/pii/S0165168421004734). Here's the bibtex citation for your convenience.

```
@article{JAYAWANT2022108436,
title = {Practical graph signal sampling with log-linear size scaling},
journal = {Signal Processing},
volume = {194},
pages = {108436},
year = {2022},
issn = {0165-1684},
doi = {https://doi.org/10.1016/j.sigpro.2021.108436},
url = {https://www.sciencedirect.com/science/article/pii/S0165168421004734},
author = {Ajinkya Jayawant and Antonio Ortega},
keywords = {Graph, Signal, Sampling, D-optimal, Volume, Coherence},
abstract = {Graph signal sampling is the problem of selecting a subset of representative graph vertices whose values can be used to interpolate missing values on the remaining graph vertices. Optimizing the choice of sampling set using concepts from experiment design can help minimize the effect of noise in the input signal. While many existing sampling set selection methods are computationally intensive because they require an eigendecomposition, existing eigendecomposition-free methods are still much slower than random sampling algorithms for large graphs. In this paper, through optimizing sampling sets towards the D-optimal objective from experiment design, we propose a sampling algorithm that has complexity comparable to random sampling algorithms, while reaching accuracy similar to existing eigendecomposition-free methods for a broad range of graph types.}
}
```

I welcome technical feedback either through github issues or email to the [corresponding author](https://arxiv.org/pdf/2102.10506.pdf).
