chirie = 566
digi = 20
gaz = 70
enel = 20
intretinere = 70
telefon = 35
sala = 135
metrou = 35
extra = 100
mancare = 30 * (5 + 5 + 15)
rata = 542
cheltuieli = sum([chirie, digi, gaz, enel, intretinere,
                  telefon, sala, metrou, extra, mancare])
income_10 = 2450 - cheltuieli
income_25 = 2150
initial_BCR = 7685
initial_BRD = 2407
# on 10 Feb
BCR = initial_BCR + 2000 + 4000
BRD = initial_BRD - 2000
for month in ['MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST']:
    BCR += income_25 - rata
    BRD += income_10
print(f'BCR: {BCR} lei sau {BCR/4.6} euro')
print(f'BRD: {BRD} lei sau {BRD/4.6} euro')
