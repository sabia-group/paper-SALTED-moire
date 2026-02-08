# Long-Range Machine Learning of Electron Density for Twisted Bilayer Moire Materials

Authors: Zekun Lou, Alan M. Lewis, and Mariana Rossi

DOI: [to be added upon publication]

Last Update: Feb 2026

## Overview

This dataset contains training and test structures, along with model configurations, used to demonstrate the SALTED framework for predicting electronic structures of twisted bilayer moire materials.

The dataset covers five 2D bilayer materials: graphene, hBN, TiS$_2$, ZrS$_2$, and MoS$_2$.

In this repo, `[xxx]` indicates placeholders to be filled in with the actual values, which can be determined from the context.

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

### `test_datasets/`

Test dataset per materials for testing band accuracy.
Due to large band structure files, we provide geometry files and `control.in` files for FHI-aims calculations.

### `models/`

Optimized SALTED model `inp.yaml` configuration files for band predictions or density predictions.
Full trained models are not included due to file size (total tens of GBs).
However, provided configurations enable exact reproduction by retraining with SALTED software.






