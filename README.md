# Long-Range Machine Learning of Electron Density for Twisted Bilayer Moire Materials

Authors: Zekun Lou, Alan M. Lewis, and Mariana Rossi

DOI: [to be added upon publication]

Last Update: Feb 2026

## Overview

This dataset contains training and test structures, along with model configurations, used to demonstrate the SALTED framework for predicting electronic structures of twisted bilayer moire materials.

The dataset covers five 2D bilayer materials: graphene, hBN, TiS2, ZrS2, and MoS2.
Placeholders marked with `[xxx]` and `???` should be replaced with actual values as determined by the specific context of the calculation.

For detailed instructions on model training and prediction, please refer to the [SALTED tutorial](https://fhi-aims-club.gitlab.io/tutorials/fhi-aims-with-salted).

## License

This repository is licensed under CC-BY-4.0. See [LICENSE](LICENSE) for more details.

## Citation

If you use this dataset in your research, please cite both the dataset and the paper:

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

This directory contains material-specific datasets for training the SALTED model.
Due to the large size of density fitting basis overlap matrices, we provide geometry files and control.in files to generate the necessary data via FHI-aims calculations.

File naming conventions: `[material].[usage]`.
`[usage]` can be
- `training.xyz`: Geometry files for the training dataset.
- `control.in`: Configuration settings for FHI-aims calculations.

### `test_datasets/`

This directory contains moire test datasets for evaluating band prediction accuracy.
Due to the large size of band structure files, we provide the geometry files and control.in files required for FHI-aims calculations.

File naming conventions: `[material].[usage]`.
`[usage]` can be
- `test.xyz`: Geometry files for the test dataset.
- `control.in`: Configuration settings for FHI-aims calculations.

### `models/`

This directory includes example `inp.example.yaml` files for SALTED model band or density predictions.
Note that fully trained models (each has tens of GBs due to RKHS vectors) are not included.
Configurable parameters are marked with "[xxx]".
All specific parameters used in this study can be found in the paper and the supplementary information.
An example configuration for graphene band prediction using the SOAP descriptor is provided in `inp.graphene.band.soap.yaml`.

