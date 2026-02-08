# Long-Range Machine Learning of Electron Density for Twisted Bilayer Moire Materials

Authors: Zekun Lou, Alan M. Lewis, and Mariana Rossi

DOI: [to be added upon publication]

Last Update: Feb 2026

## Overview

This dataset contains training and test structures, along with model configurations, used to demonstrate the SALTED framework for predicting electronic structures of twisted bilayer moire materials.

The dataset covers five 2D bilayer materials: graphene, hBN, TiS$_2$, ZrS$_2$, and MoS$_2$.

In this repo, `[xxx]` and triple question mark `???` indicate placeholders to be filled in with the actual values, which can be determined from the context.

## License

This repository is licensed under CC-BY-4.0. See [LICENSE](LICENSE) for more details.

## Citation

If you use thid dataset in your research, please cite both the dataset and the paper:

Paper:
```bibtex
[to be added upon publication]
```

Dataset:
```bibtex
[to be added upon publication]
```

SALTED Software:
```bibtex
[to be added upon publication]
```

## Directories

### `training_datasets/`

Training datasets per material for SALTED model training.
Due to large density fitting basis overlap matrices, we provide geometry files and `control.in` files for FHI-aims calculations.

File naming conventions: `[material].[usage]`.
`[usage]` can be
- `training.xyz` for training dataset geometry files.
- `control.in` for FHI-aims calculation settings.

For model training and prediction, please refer to the [SALTED tutorial](https://fhi-aims-club.gitlab.io/tutorials/fhi-aims-with-salted).

### `test_datasets/`

Test/moire dataset per materials for testing band accuracy.
Due to large band structure files, we provide geometry files and `control.in` files for FHI-aims calculations.

File naming conventions: `[material].[usage]`.
`[usage]` can be
- `test.xyz` for test dataset geometry files.
- `control.in` for FHI-aims calculation settings.

### `models/`

SALTED model `inp.yaml` example file for band predictions or density predictions.
Full trained models are not included due to file size (total tens of GBs).
Any part that needs to be adapted is marked with `"[xxx]"`.
All parameters can be found in the paper and the SI.
A detailed model configuration tutorial can be found in the [SALTED tutorial](https://fhi-aims-club.gitlab.io/tutorials/fhi-aims-with-salted).

An example model configuration file is provided for graphene band prediction using SOAP descriptor in `inp.graphene.band.soap.yaml`.

