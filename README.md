# Graph signal sampling

We measure values of a real valued smooth signal on the specific nodes of on a network using graph signal sampling.

<img src="figures/samples.png" alt="" width="200">

Using these known values, we can predict the signal values on the remaining nodes of a network.

<img src="figures/signal.png" alt="" width="200">

# How to sample graph signals

The software in this repository implements the *Approximate volume maximization* algorithm for graph signal sampling from [this paper](https://arxiv.org/abs/2102.10506).

## Download and Install

### Software dependencies

This repository uses the following packages. They need to be installed in order to run the software in this respository.
- [GSPbox](https://epfl-lts2.github.io/gspbox-html/)
- [GraphSamplingBox](https://archive.softwareheritage.org/browse/directory/e27b8849b4845e050049b1ceae73520a54a7c9f5/?origin_url=https://hal.archives-ouvertes.fr/hal-02960713&revision=3dc10882e6c8e08939d75c364a99a5b4270992e3&snapshot=834da05eaba8d5fd214a05d722acc017d17826dd)

Download and uncompress these packages in any directory on your computer. For this tutorial, I will assume that you placed them in ~/Downloads.

## Run the algorithm

Run the algorithm using the following command.
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

Your appreciation motivates me to do rigorous research and develop quality software. If you find this software useful, you can show your appreciation by starring the repository. If you use this software towards your research, cite [this paper](https://arxiv.org/abs/2102.10506). Here's the bibtex citation for your convenience.

```
@misc{jayawant2021practical,
      title={Practical graph signal sampling with log-linear size scaling},
      author={Ajinkya Jayawant and Antonio Ortega},
      year={2021},
      eprint={2102.10506},
      archivePrefix={arXiv},
      primaryClass={eess.SP}
}
```

I welcome technical feedback either through github issues or email to the [corresponding author](https://arxiv.org/pdf/2102.10506.pdf).