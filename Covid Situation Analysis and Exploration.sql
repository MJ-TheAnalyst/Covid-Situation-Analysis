SELECT *
 FROM Covid_Death
  ORDER By 3,4

  -- Select the data we are going to use

  Select Location, date, total_cases, new_cases, total_deaths, population
  from Covid_Death
  order by 1,2
  
-- looking at the total cases vs total deaths
--Shows likelihood of dying if covid is contracted in yout country

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Percentage_of_death
  from Covid_Death
  Where Location like '%states'
  order by 1,2

 -- looking at total cases vs Population
 -- SHow what Population Contracted Covid(use "Where" Filter to check country by country

 Select Location, date,  Population, total_cases, (total_cases/Population)*100 as Percentage_of_Contraction
 From Covid_Death
 Where Location like'%zim%'
 Order by 1,2

 --Looking at countried with highest infection rates compared to population

 Select Location,  Population, max(total_cases) as Highest_infection_Count, max(total_cases/Population)*100 as Highest_infection_Percentage
 From Covid_Death
 --Where Location like'%zim%'
 Group by location, Population 
 Order by Highest_infection_Percentage desc

 --Showing Countries with highest death count per population

 Select Location, max(total_deaths) as Highest_death_Count
 From Covid_Death
 --Where Location like'%zim%'
 Where continent is not null
 Group by location
 Order by Highest_death_Count desc

 -- Breaking Things down by continent

 -- Showing Continents with highest death Count per population

 Select continent, max(total_deaths) as Highest_death_Count
 From Covid_Death
 --Where Location like'%zim%'
 Where continent is not null
 Group by continent
 Order by Highest_death_Count desc


 -- Global Numbers
 Select date, sum(new_cases), sum(new_deaths), sum(new_deaths)/sum(new_cases)*100 as Percentage_of_death
  from Covid_Death
  --Where Location like '%states'
  Where Continent is not null
  group by date
  order by 1,2

 Select sum(new_cases) as total_cases, sum(new_deaths) as Total_deaths, sum(new_deaths)/sum(new_cases)*100 as Percentage_of_death
  from Covid_Death
  --Where Location like '%states'
  Where Continent is not null
  --group by date
  order by 1,2
 

 -- Querying the Vaccination Table
 Select *
from Covid_vaccination

-- Join Both Tables
Select *
from Covid_Death Dea
join Covid_Vaccination Vac
on dea.location = Vac.Location
and Dea.date = vac.date

--Looking at Total Population vs vaccinations

Select dea.Continent, dea.Location, dea.Date, dea.Population, vac.new_vaccinations
from Covid_Death Dea
join Covid_Vaccination Vac
on dea.location = Vac.Location
and Dea.date = vac.date
where dea.continent is not null
order by 1, 2, 3 

-- Checking total vaccination in each Location

Select dea.Continent, dea.Location, dea.Date, dea.Population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dea.location Order by dea.Location, dea.date) as Total_vaccination_per_location
from Covid_Death Dea
join Covid_Vaccination Vac
on dea.location = Vac.Location
and Dea.date = vac.date
where dea.continent is not null
order by 1, 2, 3

-- Using CTE
With PopvsVac (continent, location, date, population, new_vaccinations, Total_vaccination_per_location)
as
(Select dea.Continent, dea.Location, dea.Date, dea.Population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dea.location Order by dea.Location, dea.date) as Total_vaccination_per_location
from Covid_Death Dea
join Covid_Vaccination Vac
on dea.location = Vac.Location
and Dea.date = vac.date
where dea.continent is not null
--order by 1, 2, 3
)
Select *
from PopvsVac

-- Checking perecntage_by_location

With PopvsVac (continent, location, date, population, new_vaccinations, Total_vaccination_per_location)
as
(Select dea.Continent, dea.Location, dea.Date, dea.Population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dea.location Order by dea.Location, dea.date) as Total_vaccination_per_location
from Covid_Death Dea
join Covid_Vaccination Vac
on dea.location = Vac.Location
and Dea.date = vac.date
where dea.continent is not null
--order by 1, 2, 3
)
Select *, (Total_vaccination_per_location/population)*100 as  perecntage_by_location
from PopvsVac

--Using Temp Table

Drop table if exists Percentage_of_population_vaccinated
Create table Percentage_of_population_vaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
date datetime,
population numeric,
new_vaccination numeric,
Total_vaccination_per_location numeric
)

insert into Percentage_of_population_vaccinated
Select dea.Continent, dea.Location, dea.Date, dea.Population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dea.location Order by dea.Location, dea.date) as Total_vaccination_per_location
from Covid_Death Dea
join Covid_Vaccination Vac
on dea.location = Vac.Location
and Dea.date = vac.date
where dea.continent is not null
--order by 1, 2, 3

Select *, (Total_vaccination_per_location/population)*100 as  perecntage_by_location
from Percentage_of_population_vaccinated

--Creatng View to store data for later visualization

Create view Percentage_of_population_vaccinated_view as
Select dea.Continent, dea.Location, dea.Date, dea.Population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dea.location Order by dea.Location, dea.date) as Total_vaccination_per_location
from Covid_Death Dea
join Covid_Vaccination Vac
on dea.location = Vac.Location
and Dea.date = vac.date
where dea.continent is not null
--order by 1, 2, 3

Select *
from Percentage_of_population_vaccinated_view