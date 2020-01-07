###################################################
# SQLITE3
import sqlite3

the_connection = sqlite3.connect(':memory:')  # Connection to a datebase (file or memory)
the_cursor = the_connection.cursor()

the_cursor.execute("""
  CREATE TABLE employees ( 
            first text, 
            last text,  
            pay integer 
            )""")

the_cursor.execute(f"INSERT INTO employees VALUES (?, ?, ?)", ('Marian', 'POPA', 45000))
the_cursor.execute(f"INSERT INTO employees VALUES (?, ?, ?)", ('Dragos', 'BRATU', 80000))
the_cursor.execute(f"INSERT INTO employees VALUES (?, ?, ?)", ('Vlad', 'URSU', 50000))

the_cursor.execute("SELECT * FROM employees WHERE last=:last", {"last": 'BRATU'})
print(the_cursor.fetchall())

the_cursor.execute("""
  UPDATE employees 
  SET pay = :pay  
  WHERE first =:first 
  AND last = :last
  """,
  {'first': 'Dragos', 'last': 'BRATU', 'pay': 100000})

with the_connection:
  the_cursor.execute("""
    DELETE FROM employees 
    WHERE first=:first 
    AND last=:last""",
    {"first": 'Marian', 'last': 'POPA'})

the_cursor.execute("SELECT * FROM employees")
print(the_cursor.fetchall())
the_connection.close()
###################################################