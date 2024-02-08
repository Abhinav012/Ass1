# Airbnb_NYC_2019 Exploratory Data Analysis

## Guide Overview

This guide is a highlevel overview of how you can run this project. Common steps involved are installing packages, loading data and finally running this project.

# Package Installation

1.  Step 1: Open Colab notebook.
2.  Step 2: Use the following syntax to install a package:

- ```python !pip install package_name```

3.  Step 3: Install necessary packages.

# Load Data

- Install necessary modules which in our case are google.colab to import drive and pandas to read csv.
- Traverse to get the exact path of the data file (in our case '/content/drive/MyDrive/Airbnb_NYC_2019.csv').
- Mount Drive.
- Import data using Pandas read_csv function: ```python bnb_df=pd.read_csv('/path/to/csv_file')```

# Run Project

- There are two choices you can make depending upon your need to run the project:
    * Run project cell by cell: For every cell click over run cell icon which is at top left corner of each cell.
    * Run all the cells at ones: Click on "Runtime" Menu and then select "Run all" from the dropdown menu.
    Alternatively, Use Keyboard Shortcuts. You can also use the keyboard shortcut to run all cells. use Ctrl + F9 for Windows/Linux and for Mac use Cmd + F9.

# Objective of Study

Objective of this analysis is to get an overview of findings which may help the company to focus on core areas where their is a scope of improvement leading to increase in profits.

# Summary

Airbnb data for New York City 2019 suggest that Manhatten and Brooklyn are the 2 most visited places among those who visited the city. It also suggest that most of the vistors like booking Entire Property/Apt and private rooms over bookings on sharing bases. The finding also shows Manhatten is the most expensive part while Brooklyn is the most prefered part people choose to stay at. If we do analysis on combine neighbourhood than we will find that Bedford, Williamsburg and Harlem are the most popular neighbourhoods among visitors. Analysis on property names suggest that host's have taken complete advantage of using such keywords which will help them attract maximum users by using words such as private room, beautiful, apartment and more in the listed names. A lot of visitors are intrested in staying for 1 to 5 nights, also Bedford-Stuyvesant has the most properties available through out the year and its price is also low. Same goes for Herlem. Over all the analysis is insightful and can help company to make multiple decisions.
