select*
/*
Covid 19 Data Exploration 

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/

from PortfolioProject..CovidDeaths
where continent is not null
order by 3, 4

--select*
--from PortfolioProject..CovidVaccinations
--order by 3, 4

--select the data to be used

select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
where continent is not null
order by 1,2


--TOTAL CASES VS TOTAL DEATHS FOR THE UAE

--what population of the UAE got covid?

select location, max(total_cases) as [Total case count], population, max(total_cases)/(population)*100 AS totalcasespercentage
from PortfolioProject..CovidDeaths
where location like '%emirates%' and continent is not null
group by location, population

--what percentage of the UAE population died of covid?

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS deathpercentage
from PortfolioProject..CovidDeaths
where location like '%emirates%' and continent is not null

select location, Population, max(total_cases) as [total case count], max(cast(total_deaths as int)) as [total death count], max(cast(total_deaths as int))/max(total_cases)*100 AS 
deathpercentage, max(cast(total_deaths as int))/max(population)*100 AS [death/population]
from PortfolioProject..CovidDeaths
where location like '%emirates%' and continent is not null
group by location, population

--LOOKING AT IRAN

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS deathpercentage
from PortfolioProject..CovidDeaths
where location like '%iran%' and continent is not null

select location, max(total_cases) as [total case count], max(cast(total_deaths as int)) as [total death count], max(cast(total_deaths as int))/max(total_cases)*100 AS deathpercentage
from PortfolioProject..CovidDeaths
where location like '%iran%' and continent is not null
group by location


--COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POLPULATION

select location, population, max(total_cases) as highestinfectioncount, max((total_cases/population))*100 as percentpopulationinfected
from PortfolioProject..CovidDeaths
where continent is not null
group by location, population
order by 4 desc

--COUNTRIES WITH HIGHEST DEATH COUNT
--what percentage of each country's population died of covid

select location, population,  max(cast(total_deaths as int)) as totaldeathcount, max((total_deaths/total_cases))*100 as percentagedeath
from PortfolioProject..CovidDeaths
where continent is not null
group by location, population
order by percentagedeath desc


--LOOKING AT CONTINENTS
--WHICH COUNTRY HAS THE HIGHEST DEATHS FROM COVID

--AFRICA

select location, population, max(total_cases) as highestinfectioncount, max(total_cases)/population*100 as 
percentpopulationinfected, max(cast(total_deaths as int)) as Totaldeathcount,  max(total_deaths)/population*100 as percentagedeath
from PortfolioProject..CovidDeaths
where continent = 'africa' and continent is not null
group by location, population
order by percentagedeath desc

select location, population, max(total_cases) as highestinfectioncount, (max(total_cases)/(population))*100 as 
percentpopulationinfected, max(cast(total_deaths as int)) as Totaldeathcount,  (max(total_deaths)/(population))*100 as percentagedeath
from PortfolioProject..CovidDeaths
where continent = 'africa' and continent is not null
group by location,population
order by percentagedeath desc

--just comparing the above 2 queries to see if they'll give same result

--NORTH AMERICA

select location, population, max(total_cases) as highestinfectioncount, max(total_cases)/population*100 as 
percentpopulationinfected, max(cast(total_deaths as int)) as Totaldeathcount,  max(total_deaths)/population*100 as percentagedeath
from PortfolioProject..CovidDeaths
where continent = 'north america' and continent is not null
group by location, population
order by percentagedeath desc


--SOUTH AMERICA

select location, population, max(total_cases) as highestinfectioncount, max(total_cases)/population*100 as 
percentpopulationinfected, max(cast(total_deaths as int)) as Totaldeathcount,  max(total_deaths)/population*100 as percentagedeath
from PortfolioProject..CovidDeaths
where continent = 'south america' and continent is not null
group by location, population
order by percentagedeath desc


--EUROPE

select location, population, max(total_cases) as highestinfectioncount, max(total_cases)/population*100 as 
percentpopulationinfected, max(cast(total_deaths as int)) as Totaldeathcount,  max(total_deaths)/population*100 as percentagedeath
from PortfolioProject..CovidDeaths
where continent = 'europe' and continent is not null
group by location, population
order by percentagedeath desc

--OCEANIA

select location, population, max(total_cases) as highestinfectioncount, max(total_cases)/population*100 as 
percentpopulationinfected, max(cast(total_deaths as int)) as Totaldeathcount,  max(total_deaths)/population*100 as percentagedeath
from PortfolioProject..CovidDeaths
where continent = 'oceania' and continent is not null
group by location, population
order by percentagedeath desc

--ASIA
select location, population, max(total_cases) as highestinfectioncount, max(total_cases)/population*100 as 
percentpopulationinfected, max(cast(total_deaths as int)) as Totaldeathcount,  max(total_deaths)/population*100 as percentagedeath
from PortfolioProject..CovidDeaths
where continent = 'asia' and continent is not null
group by location, population
order by percentagedeath desc

--CONTINENTS WITH THE HIGHEST DEATH COUNT PER POPULATION


select continent, max(population) as PopulationCount, max(total_cases) as highestinfectioncount, max((total_cases/population))*100 as 
percentpopulationinfected, max((total_deaths/total_cases))*100 as percentagedeath, max((total_deaths/total_cases))*100 as 
[Death Rate], max((total_cases-total_deaths)/total_cases)*100 as [survival rate]
from PortfolioProject..CovidDeaths
where continent is not null
group by continent
--wrong query

select continent, max(population), max(total_cases) as highestinfectioncount, (max(total_cases)/max(population))*100 as 
percentpopulationinfected, max(convert(int, total_deaths)) as Totaldeathcount, (max(total_deaths)/max(total_cases))*100 as [Death Rate], 
max((total_cases-total_deaths)/total_cases)*100 as [survival rate]
from PortfolioProject..CovidDeaths
where continent is not null
group by continent
--correct query

--LOOKING AT GLOBAL NUMBERS

select date, sum(new_cases) as [Total cases], sum(cast(new_deaths as int)) as [Total Deaths], sum(cast(new_deaths as int))/sum(new_cases)*100 as 
[Death Percentage]--, total_deaths, (total_deaths/total_cases)*100 AS deathpercentage
from PortfolioProject..CovidDeaths
where continent is not null
group by date
order by 1,2

select sum(new_cases) as [Total cases], sum(cast(new_deaths as int)) as [Total Deaths], sum(cast(new_deaths as int))/sum(new_cases)*100 as 
[Death Percentage]--, total_deaths, (total_deaths/total_cases)*100 AS deathpercentage
from PortfolioProject..CovidDeaths
where continent is not null
--group by date
order by 1,2

--POPULATION VS VACCINATIONS

select Dea.continent, Dea.location, Dea.date, Dea.population, vac.new_vaccinations, 
SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.date) as [Rolling People Vaccinated]
from PortfolioProject..CovidDeaths Dea
join PortfolioProject..CovidVaccinations vac
on Dea.location=vac.location and Dea.date=vac.date
where dea.continent is not null
order by 2,3

--USE A CTE

with PopVacc (continent, location, date, population, New_vaccinations, [Rolling people vaccinated])
as (select Dea.continent, Dea.location, Dea.date, Dea.population, vac.new_vaccinations, 
SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.date) as [Rolling People Vaccinated]
from PortfolioProject..CovidDeaths Dea
join PortfolioProject..CovidVaccinations vac
on Dea.location=vac.location and Dea.date=vac.date
where dea.continent is not null
)

select *, [Rolling people vaccinated]/population*100 as [Percentage population vaccinated]
from PopVacc
where location like '%emirates%'

--Temp tables
DROP TABLE IF EXISTS #PERCENTPOPVACC
CREATE TABLE #PERCENTPOPVACC
(continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
New_vaccinations numeric,
[Rolling people vaccinated] numeric)


INSERT INTO #PERCENTPOPVACC
select Dea.continent, Dea.location, Dea.date, Dea.population, vac.new_vaccinations, 
SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.date) as [Rolling People Vaccinated]
from PortfolioProject..CovidDeaths Dea
join PortfolioProject..CovidVaccinations vac
on Dea.location=vac.location and Dea.date=vac.date
where dea.continent is not null

select *, [Rolling people vaccinated]/population*100 as [Percentage population vaccinated]
from #PERCENTPOPVACC
where location like '%emirates%'

--CREATING VIEWS FOR VISUALISARION

CREATE VIEW PERCENTPOPVACC AS
select Dea.continent, Dea.location, Dea.date, Dea.population, vac.new_vaccinations, 
SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.date) as [Rolling People Vaccinated]
from PortfolioProject..CovidDeaths Dea
join PortfolioProject..CovidVaccinations vac
on Dea.location=vac.location and Dea.date=vac.date
where dea.continent is not null

CREATE VIEW POPVSVACC AS
select Dea.continent, Dea.location, Dea.date, Dea.population, vac.new_vaccinations, 
SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.date) as [Rolling People Vaccinated]
from PortfolioProject..CovidDeaths Dea
join PortfolioProject..CovidVaccinations vac
on Dea.location=vac.location and Dea.date=vac.date
where dea.continent is not null

CREATE VIEW CONTINENTSDEAVSPOP AS
select continent, MAX(cast(total_deaths as int)) as totaldeathcount
from PortfolioProject..CovidDeaths
where continent is not null
group by continent