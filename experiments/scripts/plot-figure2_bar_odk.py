import pandas as pd
import matplotlib.pyplot as plt
import os

# Load the dataset
data_path = "experiments/results/test_rand_percent_100/unkown_model__2023-09-25_20:53:08/metrics_agent_seed_623930.csv"
data_dir = os.path.dirname(data_path)
data = pd.read_csv(data_path)

# Calculate the percentages
total_rows = len(data)
percent_coin_collected = (data['coin_collected'] == 1).mean() * 100
percent_inv_coin_collected = (data['inv_coin_collected'] == 1).mean() * 100
percent_died = (data['died'] == 1).mean() * 100
percent_timed_out = (data['timed_out'] == 1).mean() * 100

percent_sum = percent_coin_collected + percent_inv_coin_collected + percent_died + percent_timed_out

# Prepare data for plotting
percentages = [percent_coin_collected, percent_inv_coin_collected, percent_died, percent_timed_out]
labels = ['% Coin Collected', '% End Level Reached', '% Died', '% Timed out']

# Create the bar plot
plt.figure(figsize=(10,6))
plt.bar(labels, percentages, color=['blue', 'orange', 'red', 'green'])
plt.ylabel('Percentage (%)')
plt.title('Trained Agent Results over 10000 seeds')
plt.ylim(0, 100)

# Display the percentages above the bars
for i, percent in enumerate(percentages):
    plt.text(i, percent + 1, f"{percent:.2f}%", ha='center', va='bottom')

# Save the plot as an image
plt.savefig(os.path.join(data_dir, 'results.png'))