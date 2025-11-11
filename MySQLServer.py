import mysql.connector
from mysql.connector import Error

def create_connection():
    """
    Establish and return a connection to the MySQL database.
    Update the credentials below as needed.
    """
    try:
        connection = mysql.connector.connect(
            host="localhost",          # Database host
            user="myuser",             # Your MySQL username
            password="mypassword",     # Your MySQL password
            database="alx_book_store"  # Your existing database
        )

        if connection.is_connected():
            print("✅ Connected to MySQL database: alx_book_store")
            return connection

    except Error as e:
        print("❌ Error while connecting to MySQL:", e)
        return None


def close_connection(connection):
    """
    Close the given database connection.
    """
    if connection and connection.is_connected():
        connection.close()
        print("🔒 Connection closed.")


def test_connection():
    """
    Test the connection and show existing tables.
    """
    connection = create_connection()
    if connection:
        try:
            cursor = connection.cursor()
            cursor.execute("SHOW TABLES;")
            tables = cursor.fetchall()

            print("\n📋 Tables in alx_book_store:")
            for table in tables:
                print("-", table[0])

        except Error as e:
            print("❌ Error running query:", e)
        finally:
            close_connection(connection)


if __name__ == "__main__":
    test_connection()
