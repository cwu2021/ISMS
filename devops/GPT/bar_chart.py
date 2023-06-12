# Import the pandas and matplotlib.pyplot modules
import pandas as pd
import matplotlib.pyplot as plt

# Read the csv file and store it in a variable
data = pd.read_csv('data.csv')

# Set the index of the data frame to the first column of the csv file
data.set_index(data.columns[0], inplace=True)

# Plot the data frame as a bar chart
data.plot(kind='bar')

# Save the chart as a png file
plt.savefig('chart.png')

# Show the chart
# plt.show()
