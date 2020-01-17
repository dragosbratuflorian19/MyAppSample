chirie = 566
digi = 20
gaz = 70
enel = 20
intretinere = 70
telefon = 35
sala = 135
tuns = 70
rata = 271
metrou = 35
extra = 100
mancare = 30 * (5 + 5 + 15)
cheltuieli = sum([chirie, digi, gaz, enel, intretinere,
                  telefon, sala, tuns, rata, metrou, extra, mancare])
income_10 = 2600 - cheltuieli
income_25 = 2000
initial_BCR = 10000
initial_BRD = 1500 + 142 + 28
# on 10 Feb
BCR = initial_BCR + 2000
BRD = initial_BRD + 2565.4 - cheltuieli
for month in ['MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST']:
    BCR += income_25
    BRD += income_10
print(f'BCR: {BCR} lei sau {BCR/4.6} euro')
print(f'BRD: {BRD} lei sau {BRD/4.6} euro')
