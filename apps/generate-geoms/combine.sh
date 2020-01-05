

awk 'FNR>1' csvs/usa.csv csvs/brazil.csv > finals/countries.csv
awk 'FNR>1' csvs/usa-states.csv csvs/brazil-states.csv > finals/states.csv
