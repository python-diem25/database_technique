from database import get_connection

def create_user(name, email):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
    INSERT INTO User (name, email)
    VALUES (%s, %s)
    """
    cursor.execute(query, (name, email))
    conn.commit()

    print("User created successfully!")
    cursor.close()
    conn.close()


def list_users():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT user_id, name, email FROM User")
    users = cursor.fetchall()

    print("\nRegistered Users:")
    for u in users:
        print(f"ID: {u[0]} | Name: {u[1]} | Email: {u[2]}")

    cursor.close()
    conn.close()
