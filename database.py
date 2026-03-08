import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="172.18.242.215",
        user="root",
        password="root",
        database="GymFlow"
    )
