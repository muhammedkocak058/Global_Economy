use worldEconomics

--GDP Changes by Country Over the Years
--Y�llara G�re �lke Bazl� GSYH De�i�imi

SELECT country, year, gross_domestic_product_gdp
FROM GlobalEconomy
ORDER BY country, year;

--Countries with the Highest and Lowest GDP (Last Year)
--En Y�ksek ve En D���k GSYH'ye Sahip �lkeler (Son Y�l)

SELECT country, gross_domestic_product_gdp
FROM GlobalEconomy
WHERE YEAR([year]) = 2021
ORDER BY gross_domestic_product_gdp DESC;

--GDP Per Capita Change Analysis
--Ki�i Ba��na GDP De�i�im Analizi

SELECT country, year, per_capita_gni
FROM GlobalEconomy
order by country, year

--Foreign Trade Balance (Export - Import) Calculation
-- D�� Ticaret Dengesi (�hracat - �thalat) Hesaplama

select country, year,exports_of_goods_and_services - imports_of_goods_and_services as trade_balance
from GlobalEconomy
order by year desc

-- Which Sectors GDP Comes From
--GDP�nin Hangi Sekt�rlerden Geldi�ini Analiz Et

select country, year,
		agriculture_hunting_forestry_fishing_isic_ab as agriculture,
		manufacturing_isic_d as manufacturing,
		wholesale_retail_trade_restaurants_and_hotels_isic_gh as services
from GlobalEconomy

--Fastest Growing Countries (by GDP Growth)
--En H�zl� B�y�yen �lkeler (GDP Art���yla)

Select country,
		MAX(gross_domestic_product_gdp) - MIN(gross_domestic_product_gdp) as gdp_growth
from GlobalEconomy
group by country
order by gdp_growth desc

--GDP / Population Calculation (GDP per capita)
--GSY�H / N�fus Hesab� (Ki�i Ba�� GSYH)

SELECT country, year,
		gross_domestic_product_gdp / population as gdp_per_capita
from GlobalEconomy

--Fixed Capital Formation Analysis (Development Investment)
--Sabit Sermaye Olu�umu Analizi (Geli�me Yat�r�m�)

select country, year ,gross_fixed_capital_formation_including_acquisitions_less_dispos
from GlobalEconomy
order by year


--Household and Public Expenditure Ratio
-- Hanehalk� ve Kamu Harcamalar� Oran�

SELECT country ,year,
		household_consumption_expenditure_including_nonprofit_institutio as household,
		general_government_final_consumption_expenditure as goverment
from GlobalEconomy

--Exchange Rate Change � IMF and AMA Rate Comparison
--D�viz Kuru De�i�imi � IMF ve AMA Oran� Kar��la�t�rmas�

select country,year,ama_exchange_rate,imf_based_exchange_rate
from GlobalEconomy
order by country, year

--Countries with the Largest Population
--En B�y�k N�fusa Sahip ulkeler

SELECT country,population
FROM GlobalEconomy
WHERE YEAR([year]) = 2021
ORDER BY population DESC

--Countries with the Most Exports
--En Fazla �hracat Yapan ulkeler

SELECT country,exports_of_goods_and_services
FROM GlobalEconomy
WHERE YEAR([year]) = 2021
ORDER BY exports_of_goods_and_services desc

--Countries That Import the Most
--En Fazla �thalat Yapan Ulkeler

SELECT country,imports_of_goods_and_services
FROM GlobalEconomy
WHERE YEAR([year]) = 2021
ORDER BY imports_of_goods_and_services DESC

--Consumption to GDP Ratio (Household + Government)
--Consumption to GDP Ratio (Household + Government)

SELECT country, year,
		(household_consumption_expenditure_including_nonprofit_institutio + general_government_final_consumption_expenditure) / gross_capital_formation as consumption_to_gdp_ratio
FROM GlobalEconomy

--Investment to GDP Ratio
--Yat�r�m�n GDP'ye Oran�

SELECT country,  year,
		gross_capital_formation / gross_domestic_product_gdp as investment_ratio
FROM GlobalEconomy

--In Which Countries Is the Service Sector More Dominant?
--Hangi �lkelerde Hizmet Sekt�r� Daha Bask�n?

SELECT country, year,
		wholesale_retail_trade_restaurants_and_hotels_isic_gh / gross_domestic_product_gdp as service_ratio
FROM GlobalEconomy
ORDER BY service_ratio DESC

--Countries with the Highest Net Trade Balance (Export - Import)
--Net Ticaret Dengesi (Export - Import) En Y�ksek �lkeler

SELECT country, year,
       exports_of_goods_and_services - imports_of_goods_and_services AS net_trade
FROM GlobalEconomy
ORDER BY net_trade DESC;

--Country with the Highest Increase in GDP (Annual Based)
--GSYH'de En Y�ksek Art�� Ya�anan �lke (Y�ll�k Bazl�)

SELECT country,year,
		gross_domestic_product_gdp - LAG(gross_domestic_product_gdp) OVER (PARTITION BY country ORDER BY year) AS gdp_change
FROM GlobalEconomy
ORDER BY gdp_change DESC