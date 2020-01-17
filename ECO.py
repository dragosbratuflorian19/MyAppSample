cheltuieli = {
    'chirie': 566,
    'digi': 20,
    'gaz': 70,
    'enel': 20,
    'intretinere': 70,
    'telefon': 35,
    'sala': 135,
    'tuns': 70,
    'rata': 271,
    'metrou': 35,
    'extra': 100,
    'mancare': 750}
cheltuieli_totale = sum(cheltuieli.values())
income_10 = 2600 - cheltuieli_totale
income_25 = 2000
initial_BCR = 10000
initial_BRD = 1500 + 142 + 28 + 140 - 100
# on 10 February
BCR = initial_BCR + 2000
BRD = initial_BRD + 2565.4 - cheltuieli_totale
for year in [2020]:
    for month in ['March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December', 'January', 'February']:
        BCR += income_25
        BRD += income_10
        print('_' * 40)
        print(f'Balance in 10th of {month}, {year}:')
        print(f'BCR balance: {BCR} RON or {round(BCR/4.6)}\u20ac')
        print(f'BRD balance: {round(BRD)} RON or {round(BRD/4.6)}\u20ac')
        print(f'Total balance: {round(BCR + BRD)} RON or {round((BRD + BCR)/4.6)}\u20ac')
print('_' * 40)
print(f'Salariu este: +{income_10 + income_25 + cheltuieli_totale} RON')
print(f'Cheltuielile totale sunt: -{cheltuieli_totale} RON')
