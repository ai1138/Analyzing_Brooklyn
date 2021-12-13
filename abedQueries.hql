create table energy(propertyId STRING, propertyName STRING, city STRING, postCode STRING, primaryPropertyTypeSelfSelected STRING,
primaryPropertyTypePortfolioManagerCalculated STRING, energyStarScore DECIMAL,energyStarCertificationEligibility BOOLEAN,
DECIMAL, fuelOil2UseKbtu DECIMAL , fuelOil4UseKbtu DECIMAL, fuelOil56UseKbtu DECIMAL, propaneUseKbtu DECIMAL,
districtSteamUseKbtu DECIMAL , naturalGasUseKbtu DECIMAL) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE LOCATION '/user/ai1138/project';

create table energyCleaned as
select postCode, avg(energyStarScore) as eScore, avg(fuelOil1UseKbtu) as fuelOil1,
avg(fuelOil2UseKBtu) as fuelOil2, avg(fuelOil4UseKBtu) as fuelOil4,avg(districtSteamUseKbtu) as districtSteamUse, 
avg(naturalGasUseKbtu) as naturalGasUse from energy
where city = "brooklyn" or city = "Bklyn" or city = "Booklyn" or city = "BROOKLYN" or city = "Brooklyn"
group by postCode;

