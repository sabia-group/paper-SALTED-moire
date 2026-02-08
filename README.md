# Long-Range Machine Learning of Electron Density for Twisted Bilayer Moire Materials

Authors: Zekun Lou, Alan M. Lewis, and Mariana Rossi

DOI: [to be added upon publication]

Last Update: Feb 2026

## Overview

This dataset contains training and test structures, along with model configurations, used to demonstrate the SALTED framework for predicting electronic structures of twisted bilayer moire materials.

The dataset covers five 2D bilayer materials: graphene, hBN, TiS2, ZrS2, and MoS2.
Placeholders marked with `[xxx]` and `???` should be replaced with actual values as determined by the specific context of the calculation.

For detailed instructions on model training and prediction, please refer to the [SALTED tutorial](https://fhi-aims-club.gitlab.io/tutorials/fhi-aims-with-salted).

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

## Versions

- **SALTED**: Version 3.0.0 (git commit `91c85a78`, 2025-06-04).
- **FHI-aims**: Versions 241121 and 240507 are used in this work.
    - **Compatibility Note**: SALTED-predicted density fitting coefficients can be used to restart FHI-aims calculations, but require FHI-aims versions before or after 240830 depending on the training data version, due to changes in basis ordering.
    - For training data from FHI-aims ≥240830: Use FHI-aims ≥240830,
    - For training data from FHI-aims <240830: Use FHI-aims <240830, or add `sort_product_basis .true.` to `control.in` with newer FHI-aims versions.
- **featomic**: Version 0.6.1.


## Directories

### `training_datasets/`

Contains training datasets for SALTED models, organized by material.
Each dataset includes geometry files, FHI-aims configuration files, and training data.

**Note**: Due to file size constraints, density fitting basis overlap matrices are provided only for the first geometry of graphene and hBN as a reference.

**Structure** (each `[material]/` subdirectory):
- `coefficients/`: Expansion coefficients for training.
- `projections/`: Basis projections for training.
- `overlaps/`: Density fitting basis overlap matrices (first geometry, for only graphene and hBN).
- `dft_data/`: FHI-aims output files (first geometry only).
- `[material].training.xyz`: Training geometries.
- `[material].control.in`: FHI-aims calculation settings.

For example dft data:
- graphene, hBN, TiS2: Generated using FHI-aims version 240507.
- ZrS2, MoS2: Generated using FHI-aims version 241121.

### `test_datasets/`

Contains moiré test datasets for evaluating band structure prediction accuracy. Includes geometry files, FHI-aims configurations, and reference band structures.

**Structure** (each `[material]/` subdirectory):
- `[index]/`: Individual subdirectories for each test geometry's FHI-aims calculation.
- `[material].test.xyz`: Test geometry files.
- `[material].control.in`: FHI-aims configuration settings.

### `models/`

Contains example configuration files for SALTED model training and prediction.

**Contents**:
- Example `inp.example.yaml` files for band structure and density predictions.
    - Configurable parameters marked with `[xxx]`.
- `inp.graphene.band.soap.yaml`: Reference configuration for graphene band prediction using SOAP descriptor.

For complete parameter values used in this study, refer to the paper and supplementary information.

**Note**: Trained models are not included due to file size (several to tens of GBs per model). Since overlap matrices are provided only for the first geometry of each material, direct prediction from this dataset is not possible. To reproduce results, users shall regenerate complete datasets (including all overlap matrices) via DFT calculations, then train models following the SALTED tutorial.
