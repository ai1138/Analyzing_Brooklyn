import pandas as pd

analytic =  pd.read_csv("analytic.txt", sep='\t', lineterminator='\r')
energy_cleaned = pd.read_csv("energyCleaned.csv" , sep =',')

for i in range(41):
    analytic["zipcode"][i] = analytic["zipcode"][i].strip("\n")
    
analytic_1 = analytic[["zipcode","eScore","unsanitary_condition"]]
analytic_1 = analytic_1.sort_values(by='eScore')

eScore_lessthan = analytic[analytic_1["eScore"] <  61].sort_values(by='eScore')
eScore_greaterthan = analytic[analytic_1["eScore"]  > 61].sort_values(by='eScore')
mean_lessthan = eScore_lessthan.drop(columns=["zipcode"])
mean_lessthan =  mean_lessthan.mean()
mean_greaterthan = eScore_greaterthan.drop(columns=["zipcode","naturalgasuse"])
mean_greaterthan = mean_greaterthan.mean()


less_than_61_graph = mean_lessthan.plot.kind
