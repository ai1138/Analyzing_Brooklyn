import pandas as pd
from matplotlib import pyplot as plt
analytic =  pd.read_csv("analytic.txt", sep='\t', lineterminator='\r')
energy_cleaned = pd.read_csv("energyCleaned.csv" , sep =',')
pd.options.display.float_format = '{:.2f}'.format


for i in range(41):
    analytic["zipcode"][i] = analytic["zipcode"][i].strip("\n")
    
analytic_1 = analytic[["zipcode","eScore","unsanitary_condition"]]
analytic_1 = analytic_1.sort_values(by='eScore')

#Complaints In Neighboorhoods With An Escore Less Than 61  bar graph
eScore_lessthan = analytic[analytic_1["eScore"] <  61].sort_values(by='eScore')
eScore_greaterthan = analytic[analytic_1["eScore"]  > 61].sort_values(by='eScore')
mean_lessthan = eScore_lessthan[["heat_hotwater", "water_system","unsanitary_condition", "sewer"]]
mean_lessthan =  mean_lessthan.mean()
mean_greaterthan = eScore_greaterthan[["heat_hotwater", "water_system","unsanitary_condition", "sewer"]]
mean_greaterthan = mean_greaterthan.mean()
mean_lessthan.plot.bar(x = 'complaint types', y = 'number of complaints')
plt.title("Complaints In Neighboorhoods With An Escore Less Than 61")
plt.xlabel("Types of Complaints")
plt.ylabel('# of Complaints')

#Complaints In Neighboorhoods With An Escore Greater Than 61 bar graph
analytic= analytic.sort_values(by='eScore' ,ascending=False )
mean_greaterthan.plot.bar()
plt.title("Complaints In Neighboorhoods With An Escore Greater Than 61")
plt.xlabel("Types of Complaints")
plt.ylabel('# of Complaints')
plt.ylim([0,5000])

#scatter plot street conditions vs number of people injured
cvc = analytic[["street_condition","numberOfPersonsInjured"]]
cvc.plot.scatter(x = "street_condition" , y = "numberOfPersonsInjured" )
plt.xlabel("# of Street Condition Complaints")
plt.ylabel(' # of Persons Injured')


#scatter plot of noise complaints vs energy star score
cvg = analytic[["eScore","noise_residential"]]
cvg.sort_values(by = ["eScore","noise_residential"])
cvg.plot.scatter(x = "eScore" , y = "noise_residential" )
plt.xlabel("Energy Score Rating")
plt.ylabel("Residential Noise Complaints")
