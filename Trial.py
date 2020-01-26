import random

# Open the file with all the concepts to repeat


def filter_data(content_data=None, chapter=None):

    filtered_content = [
        item.strip() for item in content_data if chapter.lower() in item.lower()]
    return filtered_content


def create_rec_file(filename):
    with open('recapitulare.txt', 'r') as f:
        content = f.readlines()
    lista_subiecte = []
    for i in content:
        lista_subiecte.append(i.strip())
    lista_subiecte = lista_subiecte[::-1]
    # random.shuffle(lista_subiecte)
    with open(filename, 'w') as f:
        for i in lista_subiecte:
            f.write(i + '\n')


rec_version = 'recapitulare2.txt'
create_rec_file(rec_version)
with open(rec_version, 'r+') as g:
    chapter = input('''Chapter variants: 
        None
        1.1 General
        1.2 Pandas
        1.3 Numpy
        1.6 SQLite3
        1.7 Collections
        2. SQL
        3. SPARK
        6. GIT
        8. LINUX
        9. SKLEARN
        >''')
    notes = []
    ex_left = 0
    content = g.readlines()
    content = filter_data(content_data=content, chapter=chapter)
    while len(content) > 0:
        ex_left = len(content)
        exercise = content.pop()
        print(f'There are {ex_left} exercises left. ')
        print(exercise)
        try:
            note = int(input("your rating for this exercise is: "))
            notes.append(note)
        except Exception:
            print("you're stupid")
        print(f"Your current average rating was: {sum(notes)/len(notes)}")
