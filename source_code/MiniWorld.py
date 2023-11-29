import pymysql

table_name = 'Airplane'

# Establish a connection to the database
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='sql_utsav',
    db='flight_management_system',
    cursorclass=pymysql.cursors.DictCursor
)

try:
    # Create a cursor object
    cursor = connection.cursor()

    # Example SQL query
    sql_query = f"SELECT * FROM {table_name}"

    # Execute the query
    cursor.execute(sql_query)

    # Fetch the results
    results = cursor.fetchall()

    # Display the results
    for row in results:
        print(row)

except Exception as e:
    print(f"Error: {e}")

finally:
    # Close the cursor and connection
    cursor.close()
    connection.close()

