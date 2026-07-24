# Datasets and Models for Paper "Long-Range Machine Learning of Electron Density for Twisted Bilayer Moire Materials"

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18556914.svg)](https://doi.org/10.5281/zenodo.18556914)

Authors: Zekun Lou, Alan M. Lewis, and Mariana Rossi

Paper DOI: [10.1103/4575-9cmx](https://doi.org/10.1103/4575-9cmx)

Last Update: July 2026

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

arXiv:
```bibtex
@misc{louLongRangeMachineLearning2026,
  title = {Long-{{Range Machine Learning}} of {{Electron Density}} for {{Twisted Bilayer Moir\'e Materials}}},
  author = {Lou, Zekun and Lewis, Alan M. and Rossi, Mariana},
  year = 2026,
  publisher = {arXiv},
  doi = {10.48550/arXiv.2602.09938},
  eprint = {2602.09938},
  archiveprefix = {arXiv},
}
```

Dataset:
```bibtex
@misc{louSabiagroupPaperSALTEDmoireDataset2026,
  title = {Sabia-Group/Paper-{{SALTED-moire}}: {{Dataset}} Accompanying First Version of Paper},
  author = {Lou, Zekun},
  year = 2026,
  doi = {10.5281/ZENODO.18556914},
  howpublished = {Zenodo}
}
```

SALTED Software:
```bibtex
[to be added upon publication]
```

## Versions

- **SALTED**: Version 3.0.0 (git commit `91c85a78`, 2025-06-04).
- **FHI-aims**: Versions 241121 and 240507 are used in this work.
    - **Compatibility Note**: SALTED-predicted density fitting coefficients can be used to restart FHI-aims calculations, but require FHI-aims versions before or after 240830 depending on the training data version, due to changes in basis ordering.
    - For training data from FHI-aims ≥240830: Use FHI-aims ≥240830.
    - For training data from FHI-aims <240830: Use FHI-aims <240830, or add `sort_product_basis .true.` to `control.in` with newer FHI-aims versions.
- **featomic**: Version 0.6.1.
- **MACE**: Versions 0.3.5 and 0.3.14 are used for MACE model training.


## Directories

### `training_datasets/`

Contains training datasets for SALTED models, organized by material.
Each dataset includes geometry files, FHI-aims configuration files, and training data.

**Note**: Due to file size constraints, density fitting basis overlap matrices are provided only for the first geometry of graphene and hBN as a reference.

**Structure** (each `[material]/` subdirectory):
- `coefficients/` (`coefficients.tar`): Expansion coefficients for training. Please extract the `tar` files to access the individual files.
- `projections/` (`projections.tar`): Basis projections for training. Please extract the `tar` files to access the individual files.
- `overlaps/`: Density fitting basis overlap matrices (first geometry, for only graphene and hBN).
- `dft_data/`: FHI-aims output files (first geometry only).
- `[material].training.xyz`: Training geometries (without the large `ri_overlap.out` density fitting overlap matrix).
- `[material].control.in`: FHI-aims calculation settings.

For the example dft data, coefficients, and projections:
- graphene, hBN, TiS2: Generated using FHI-aims version 240507.
- ZrS2, MoS2: Generated using FHI-aims version 241121.

### `test_datasets/`

Contains moire test datasets for evaluating band structure prediction accuracy. Includes geometry files, FHI-aims configurations, and reference band structures.

**Structure** (each `[material]/` subdirectory):
- `[index]/`: Individual subdirectories for each test geometry's FHI-aims calculation.
    - Graphene: indices 1-10, ordered by decreasing twist angle.
    - hBN: indices 1-10 and 11-20, each ordered by decreasing twist angle; the two groups correspond to parallel and antiparallel stacking, respectively.
    - TiS2, ZrS2, MoS2: indices 1-8 and 11-18, each ordered by decreasing twist angle; the two groups correspond to parallel and antiparallel stacking, respectively.
- `[material].test.xyz`: Test geometry files.
- `[material].control.in`: FHI-aims configuration settings.

### `models/`

Contains example configuration files for SALTED model training and prediction.

**Contents**:
- Example `inp.example.yaml` files for band structure and density predictions.
    - Configurable parameters marked with `[xxx]`.
- `inp.graphene.band.soap.yaml`: Reference configuration for graphene band prediction using SOAP descriptor.
- `[material]_[expr_name]/`: Subdirectories for each material and experiment.
    - Each dir contains one SALTED configuration file.
    - Models for band structure predictions in the following directories are further provided with regression weights for comparison:
        - `models/graphene_chg_regul/optim_soap_regul1e-3`
        - `models/hBN_chg_regul/optim_lovv_regul1e-9`
        - `models/TiS2_chg_regul/optim_lovv_regul1e-14`
        - `models/ZrS2_chg_regul/optim_lovv_regul1e-8`
        - `models/MoS2_chg_regul/optim_lovv_regul1e-12`

For complete parameter values used in this study, refer to the paper and supplementary information.

**Note**: Trained models are not included due to file size (several to tens of GBs per model). Since overlap matrices are provided only for the first geometry of each material, direct prediction from this dataset is not possible. To reproduce results, users will need to regenerate complete datasets (including all overlap matrices) via DFT calculations, then train models following the SALTED tutorial.

### `mace/`

Contains MACE model training datasets and MACE model weights.

- graphene: `graphene_mace_model_compiled.model`
    - MACE version: 0.3.5.
    - Datasets: `tbg_geoms_forces.train.xyz`, `tbg_geoms_forces.valid.xyz`, `tbg_geoms_forces.test.xyz`.
- hBN: `hbn_mace_model_compiled.model`
    - MACE version: 0.3.14.
    - Datasets: `dbbn_5x5_geoms_forces.train.xyz`, `dbbn_5x5_geoms_forces.valid.xyz`, `dbbn_5x5_geoms_forces.test.xyz`.



