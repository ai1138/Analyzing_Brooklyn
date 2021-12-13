create table energy(propertyId STRING, propertyName STRING, city STRING, postCode STRING, primaryPropertyTypeSelfSelected STRING,
primaryPropertyTypePortfolioManagerCalculated STRING, energyStarScore DECIMAL,energyStarCertificationEligibility BOOLEAN,
DECIMAL, fuelOil2UseKbtu DECIMAL , fuelOil4UseKbtu DECIMAL, fuelOil56UseKbtu DECIMAL, propaneUseKbtu DECIMAL,
districtSteamUseKbtu DECIMAL , naturalGasUseKbtu DECIMAL) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE LOCATION '/user/ai1138/project';

create table issues_by_zip_code(zipcode STRING, noise_residential  INT, illegal_parking INT, 
heat_hotwater  INT, blocked_driveway  INT, noise_street_sidewalk INT,
unsanitary_condition INT,street_condition  INT, water_system INT, construction_or_plumbing INT , 
noise_commercial  INT, noise_vehicle  INT, damaged_tree  INT, sidewalk_condition  INT , 
rodent  INT, sewer INT , graffiti INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE LOCATION '/user/ai1138/afnanHive';


create external table crashes (zipcode INT, persons_injured INT, persons_killed INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE LOCATION '/user/ai1138/projectShnu';


create table energyCleaned as
select postCode, avg(energyStarScore) as eScore, avg(fuelOil1UseKbtu) as fuelOil1,
avg(fuelOil2UseKBtu) as fuelOil2, avg(fuelOil4UseKBtu) as fuelOil4,avg(districtSteamUseKbtu) as districtSteamUse, 
avg(naturalGasUseKbtu) as naturalGasUse from energy
where city = "brooklyn" or city = "Bklyn" or city = "Booklyn" or city = "BROOKLYN" or city = "Brooklyn"
group by postCode;


create table energyCrisis as
select postCode,eScore,fuelOil1,fuelOil2, fuelOil4, districtSteamUse,naturalGasUse,
crashInDepth.numberOfPersonsInjured,crashInDepth.numberOfPersonsKilled
from energyCleaned, crashInDepth
where energyCleaned.postCode = crashInDepth.zipcode;

create table analytic as
select postCode,eScore,fuelOil1,fuelOil2, fuelOil4, districtSteamUse,naturalGasUse,
numberOfPersonsInjured,numberOfPersonsKilled,issues_by_zip_code.noise_residential,
issues_by_zip_code.illegal_parking, issues_by_zip_code.heat_hotwater ,issues_by_zip_code.blocked_driveway,
issues_by_zip_code.noise_street_sidewalk,issues_by_zip_code.unsanitary_condition , issues_by_zip_code.street_condition ,
issues_by_zip_code.water_system ,issues_by_zip_code.construction_or_plumbing ,issues_by_zip_code.noise_commercial,
issues_by_zip_code.noise_vehicle, issues_by_zip_code.damaged_tree , issues_by_zip_code.sidewalk_condition ,
issues_by_zip_code.rodent , issues_by_zip_code.sewer, issues_by_zip_code.graffiti
from energyCrisis,issues_by_zip_code
where energyCrisis.postCode = issues_by_zip_code.zipcode;