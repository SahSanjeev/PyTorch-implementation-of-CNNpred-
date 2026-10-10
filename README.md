# CNNpred PyTorch

A PyTorch implementation of CNNpred for stock market prediction using convolutional neural networks.

This project follows the paper:

> CNNpred: CNN-based stock market prediction using a diverse set of variables
>
> Ehsan Hoseinzade and Saman Haratizadeh
>
> Expert Systems with Applications, 2019

Paper: https://www.sciencedirect.com/science/article/abs/pii/S0957417419301915

## Overview

This repository trains a CNN model on stock market data to predict future movement using historical sequences and a set of market features. The main training entry point is `train.py`.

The script expects:
- the project root to be passed via `--Base-dir`
- the dataset folder to exist at `Dataset/`
- model checkpoints and outputs to be saved to `2D-models/`

## Features

- CNN-based stock prediction model
- PyTorch implementation
- Sequence-based dataset preparation
- Validation and test evaluation
- Optional Weights & Biases logging via `--use-wandb`
- Windows-friendly helper scripts: `setup.bat`, `run.bat`, and `Makefile`

## Requirements

- Python 3.8+
- pip
- Windows 10/11 recommended for the provided scripts
- NVIDIA GPU optional; CPU is supported automatically

## Project structure

```text
CNNpred-pytorch-main/
├── Dataset/                  # stock market dataset files
├── 2D-models/                # trained model checkpoints and result files
├── CNNpred2D.py              # CNN model definition
├── dataset.py                # dataset loader utilities
├── processing_data.py        # preprocessing and sequence generation
├── train.py                  # main training entry point
├── requirements.txt          # Python dependencies
├── setup.bat                 # Windows dependency installer
├── run.bat                   # Windows run launcher
├── Makefile                  # Unix/macOS convenience commands
├── .gitignore                # ignore local data and generated files
├── .env                      # local environment template
├── README.md                 # project documentation
└── LICENSE                   # project license (if present)
```

## Installation

### Option 1: Use the provided Windows setup script

Open Command Prompt in the project folder and run:

```bat
setup.bat
```

### Option 2: Install manually

```bat
python -m pip install -r requirements.txt
```

This installs the required packages, including:
- torch
- pandas
- numpy
- scikit-learn
- tqdm
- pathlib2
- wandb

## Running the project

From the project root, run:

```bat
run.bat
```

Or run directly:

```bat
python train.py --Base-dir .
```

This starts the model training process using the dataset located in `Dataset/`.

## Common run examples

### Default run

```bat
python train.py --Base-dir .
```

### Custom training configuration

```bat
python train.py --Base-dir . --epochs 200 --seq-len 60 --predict-day 1 --batch-size 128 --num-filter 8 --drop 0.1 --lr 0.0001
```

### Disable W&B logging

```bat
python train.py --Base-dir . --use-wandb False
```

## Supported arguments

The main CLI supports the following arguments:

- `--Base-dir`: path to the project root directory
- `--epochs`: number of training epochs
- `--seq-len`: length of the input sequence window
- `--predict-day`: prediction horizon (days ahead)
- `--num-iter`: number of training iterations
- `--num-filter`: number of CNN filters
- `--drop`: dropout rate
- `--lr`: learning rate
- `--weight-decay`: optimizer weight decay
- `--batch-size`: batch size for training and validation
- `--patience`: early stopping patience
- `--use-wandb`: enable/disable W&B logging
- `--override`: overwrite existing model checkpoints
- `--num-workers`: number of workers for data loading

## Output

Training artifacts are saved under the `2D-models/` directory. Typical outputs include:

```text
2D-models/best-200-60-8-0.1-1.pt
2D-models/new results.csv
```

The CSV file stores the evaluation summary for the experiments.

## Dataset requirement

Make sure the data files are in the project root under `Dataset/` before running training. The project expects a dataset structure that matches the CSV files used by the preprocessing code.

If the script cannot find the dataset, verify that:
- you are running the command from the project root
- `Dataset/` exists in the same folder as `train.py`
- the variable `--Base-dir` points to the correct project directory

## Troubleshooting

### Import errors

Reinstall dependencies:

```bat
python -m pip install -r requirements.txt
```

### Dataset not found

Check that the project directory is correct and that the command uses:

```bat
python train.py --Base-dir .
```

### GPU not available

The project automatically falls back to CPU if CUDA is not available.

### W&B errors

If you do not want to use Weights & Biases, keep it disabled:

```bat
python train.py --Base-dir . --use-wandb False
```

## Quick start

```bat
cd C:\path\to\CNNpred-pytorch-main
setup.bat
run.bat
```

Or:

```bat
cd C:\path\to\CNNpred-pytorch-main
python -m pip install -r requirements.txt
python train.py --Base-dir .
```

## Citation

```bibtex
@article{hoseinzade2019cnnpred,
  title={CNNpred: CNN-based stock market prediction using a diverse set of variables},
  author={Hoseinzade, Ehsan and Haratizadeh, Saman},
  journal={Expert Systems with Applications},
  volume={129},
  pages={273--285},
  year={2019},
  publisher={Elsevier}
}
```

