# Module Import
import subprocess
import mariadb #nesse exemplo foi usado um banco de dados mariadb.
import sys 
from datetime import datetime

# Print List of Contacts
def print_keys(cur):
    """Retrieves the list of users and keys from the database and prints to stdout"""

    # Initialize Variables
    keys = []

    # Retrieve Contacts
    query = "query"

    print(query)
    cur.execute(query)

    # Prepare Contacts
    try:
        file = open("caminho do arquivo\chaves.xml","w")
        for (user_key) in cur:
            keys.append(f"{user_key}")
            file.write(str(user_key) + "\n")
            print(user_key)

        time = datetime.now()
        update_time = time.strftime("%d/%m/%Y %H:%M")
        file.write(update_time)


        # List Contacts
        #print("\n".join(keys))
    finally:
        file.close()

# Instantiate Connection
try:
    conn = mariadb.connect(
        host="ip",
        port=1234,
        user="usuario com permissao de acesso ao banco de dados",
        password="senha",
        database="base de dados")

    # Instantiate Cursor
    cur = conn.cursor()

    print_keys(cur)

    # Close Connection
    conn.close()
    

except mariadb.Error as e:
    print(f"Error connecting to the database: {e}")
    sys.exit(1)
    
#subprocess.call("powershell.exe caminho do arquivo\scriptFinal.ps1", shell=True)