#!/bin/bash
set -o errexit

num_seeds=10
python run_coinrun.py --model_file logs/train/coinrun/coinrun/2023-09-19__19-15-10__seed_6033/model_200015872.pth --start_level_seed 0 --num_seeds $num_seeds --random_percent 100
