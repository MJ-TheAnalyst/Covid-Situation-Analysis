# Covid Situational Anaysis

## Table of content

- [Project Overview](#Project-Overview)
- [Objective](#Objective)
- [Data Source](#Data-Source)
- [Tools](#Tools)
- [Process](#Process)
- [Challenges](#Challenges)
- [References](#Refereneces)


## Project Overview
This project analyzes Global Covid 19 data to provide key insights on it's impact and casualties in affected countries. It Focuses on Showing the impact of infection, mortality and vaccination in affected countries all over the world.

## Objective
Using SQL queries, I examined:

- The relationship between total cases, deaths, and population to assess infection and mortality rates.

- Countries and continents with the highest infection and death counts relative to population size.

- Global case and death trends over time.

- Vaccination progress by country, including cumulative vaccinations and percentage of population vaccinated.

## Data source
The datasets used in this analysis comes from Our World in Data. 
This dataset is compiled from official sources such as the World Health Organization (WHO), national health agencies, and the European Centre for Disease Prevention and Control (ECDC), 
and is regularly updated to reflect the global COVID-19 situation wwhich is relevant to this analysis.

## Tools 
- SQL Server: Data cleaning and exploration
- Tableau:  Data Visualization

## Process
### 1. Data Collection and Cleaning

- The COVID-19 dataset from Our World in Data was Downloaded in CSV format.

- A SQL Server database was created to store and analyze the data.

- Imported the CSV files into SQL Server, making adjustments such as:

    A. Converting data types (e.g., dates, numerics

    B. Allowing/handling NULL values where appropriate

    C. Ensuring the schema was standardized for querying

### 2. Exploratory Analysis

The analysis focused on exploring global COVID-19 trends using SQL queries. We examined the dataset from multiple perspectives to better understand the impact of the pandemic and to amswer  key questions like:

- What is the likelihood of dying if someone contracts COVID-19 in a given country?
- How do total deaths compare to total cases over time?
- What percentage of each country’s population contracted COVID-19?
- Which countries had the highest infection rates relative to population?
- Which countries recorded the highest death counts per population?
- How do death counts vary across continents?
- What were the worldwide trends in new cases and deaths over time?
- What was the global death percentage compared to total reported cases
- How do vaccination rates compare across countries and continents?
- What percentage of a country’s population has been vaccinated over time?

### 3. Data Visualization 

<img width="1856" height="755" alt="Dashboard 1" src="https://github.com/user-attachments/assets/4fce089d-6e6f-404f-bb22-a52d0685e944" />

The visualization provided us with key insights from the analysis, these include:
1. The global impact of the Covid 19 virus is 150M+ cases, 3.18M deaths and ~2.1% global death rate.
2. Europe recorded the highest death count, followed by North & South America; Africa and Oceania had the lowest.
3. The U.S. and Europe showed the highest infection percentages, while Africa and Oceania remained low.
4. The U.S. experienced the steepest growth in infections, with the UK and Mexico also significant but lower; China’s actual cases stayed low compared to estimates.

These visuals reflect SQL queries analyzing cases vs deaths, infections vs population, and continent-level breakdowns, making global and regional COVID-19 impacts clear.



## Key insights/ Results
From the exploratory analysis, several insights emerged:

- Countries varied widely in death-to-case ratios, with some showing significantly higher likelihood of death once infected.
- Certain countries experienced very high infection percentages relative to their population, while others reported lower spread (possibly due to under-testing or reporting gaps).
- The highest absolute death counts were concentrated in a few countries, but when normalized by population, smaller nations also showed severe impacts.
- Some continents consistently recorded higher death totals than others, reflecting differences in healthcare systems, demographics, and response strategies.
- Worldwide, death percentages fluctuated over time, showing peaks during major waves.
- Vaccination coverage was uneven — some countries quickly vaccinated large portions of their populations, while others lagged behind.

## Recommendations
Based on the findings, the following recommendations can be made:

- Standardize and enhance reporting methods globally to reduce missing values and ensure better comparability.
- Countries with higher fatality rates should analyze their healthcare capacity and response strategies to reduce mortality.
- Increase efforts to distribute vaccines fairly, especially in countries with low vaccination rates.
- Pay closer attention to regions with disproportionately high infection or death percentages relative to population.
- Policymakers can leverage these insights to prepare for future pandemics — improving testing, response times, and resource allocation.

## Challenges
Some of the challenges encountered while working with the dataset includes:

1. Missing / Incomplete Data:
  
  - Many fields contained NULL values, which required handling to ensure queries and calculations did not break.
  - Some countries had inconsistent reporting, leading to gaps in the data.

2. Data Type Issues

  - Some columns such as total_cases, and total_deaths were not always in the correct format when importing into SQL Server.
  - I had to explicitly convert data types (e.g., nvarchar → Float) to make the dataset usable.

3. Importing CSV to SQL Server

  - This dataset occasionally failed to import due to delimiter or encoding issues.
  - Adjustments were needed to accept NULL values and to standardize the schema for smoother analysis.


## Reference

[Download-Dataset-Here](https://ourworldindata.org/covid-deaths)

[Guided-Tutorial](https://youtu.be/qfyynHBFOsM?si=P7-XSuIPUQ52YnBP)

[Download-Covid-Vaccination-Dataset](https://github.com/AlexTheAnalyst/PortfolioProjects/blob/main/CovidVaccinations.xlsx)

[Download-covid-Death](https://github.com/AlexTheAnalyst/PortfolioProjects/blob/main/CovidDeaths.xlsx)
[Tabkeau visualization](https://public.tableau.com/views/CovidAnalysisDashboard_17590705999550/Dashboard1?:language=en-US&:sid=&:redirect=auth&publish=yes&showOnboarding=true&:display_count=n&:origin=viz_share_link)
