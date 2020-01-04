import random

# Open the file with all the concepts to repeat
def create_rec_file(filename):
    with open('recapitulare.txt', 'r') as f:
        content = f.readlines()
    lista_subiecte = []
    for i in content:
        lista_subiecte.append(i.strip())
    random.shuffle(lista_subiecte)
    with open(filename, 'w') as f:
        for i in lista_subiecte:
            f.write(i + '\n')

rec_version = 'recapitulare2.txt'
create_rec_file(rec_version)
with open(rec_version, 'r+') as g:
    notes = []
    ex_left = 0
    content = g.readlines()
    while len(content) > 0:
        ex_left = len(content)
        exercise = content.pop().strip()
        print(f'There are {ex_left} exercises left. ')
        print(exercise)
        try:
            note = int(input("your rating for this exercise is: "))
            notes.append(note)
        except Exception:
            print("you're stupid")
        print(f"Your current average rating was: {sum(notes)/len(notes)}")