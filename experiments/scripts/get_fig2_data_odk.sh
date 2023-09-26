#!/bin/bash
set -o errexit

# gather metrics for figure 2
# load trained coinrun models and deploy them in the test environment.
# to do this without specifying the model_file every time, trained coinrun
# models must be stored in logs with exp_name 'freq-sweep-random-percent-$random_percent'
# write output metrics to csv files in ./experiments/results/

num_seeds=10000
python run_coinrun.py --model_file logs/train/coinrun/coinrun/2023-09-19__19-15-10__seed_6033/model_200015872.pth --start_level_seed 0 --num_seeds $num_seeds --random_percent 100
