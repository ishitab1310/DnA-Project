import mysql.connector

# Establish a connection to the database
connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='sql_utsav',
    database='flight_management_system'
)

# Create a cursor object
cursor = connection.cursor()

# Function for Retrieve Operations
def retrieve_operations():
    print("\nRetrieve Operations:")
    print("1. Retrieve a list of all passengers who made reservations on a specific flight.")
    print("2. Retrieve a list of all flights departing from a specific location on a given date.")
    print("3. Retrieve a list of all aircraft that require maintenance within the next week.")
    print("4. Retrieve the reservation ID and passenger name for baggage tracking.")
    print("5. Retrieve the name and phone number of employees for a particular flight to check for incidents during their shifts.")
    print("6. Retrieve the name and airport code of locations to display in a flight schedule.")
    print("7. Retrieve the aircraft’s unique ID and assigned flight for tracking purposes.")
    print("8. Passenger Loyalty Program")
    print("9. Search Operations")
    print("0. Back to Main Menu")

    choice = input("Enter your choice (0-9): ")

    if choice == '1':
        # TODO: Implement Retrieve Operation 1
        pass

    elif choice == '2':
        # TODO: Implement Retrieve Operation 2
        pass

    elif choice == '3':
        # TODO: Implement Retrieve Operation 3
        pass

    elif choice == '4':
        # TODO: Implement Retrieve Operation 4
        pass

    elif choice == '5':
        # TODO: Implement Retrieve Operation 5
        pass

    elif choice == '6':
        # TODO: Implement Retrieve Operation 6
        pass

    elif choice == '7':
        # TODO: Implement Retrieve Operation 7
        pass

    elif choice == '8':
        # TODO: Implement Retrieve Operation 8
        pass

    elif choice == '9':
        search_operations()

    elif choice == '0':
        # Back to Main Menu
        return

    else:
        print("Invalid choice. Please enter a number between 0 and 9.")

    # Recursive call for continuous retrieval operations
    retrieve_operations()

# Function for Search Operations
def search_operations():
    print("\nSearch Operations:")
    print("1. Retrieve the passengers whose name ends with 'Goel', reservation ID starts with 'EMT', or flight number starts with '6E'.")
    print("2. Retrieve the employees whose name starts with 'Aman', job title is 'Cabin crew', or department containing 'Field'.")
    print("3. Retrieve aircraft by number starting with '1002' or type containing 'AB'.")
    print("4. Retrieve a list of passengers in age group 25-40 who made reservations on flights going to Delhi on 18th November 20XX.")
    print("0. Back to Main Menu")

    choice = input("Enter your choice (0-4): ")

    if choice == '1':
        # TODO: Implement Search Operation 1
        pass

    elif choice == '2':
        # TODO: Implement Search Operation 2
        pass

    elif choice == '3':
        # TODO: Implement Search Operation 3
        pass

    elif choice == '4':
        # TODO: Implement Search Operation 4
        pass

    elif choice == '0':
        # Back to Main Menu
        return

    else:
        print("Invalid choice. Please enter a number between 0 and 4.")

    # Recursive call for continuous search operations
    search_operations()

# Main Menu
while True:
    print("\nMain Menu:")
    print("1. Retrieve Operations")
    print("2. Exit")

    main_choice = input("Enter your choice (1-2): ")

    if main_choice == '1':
        # Retrieve Operations
        retrieve_operations()

    elif main_choice == '2':
        # Exit
        break

    else:
        print("Invalid choice. Please enter 1 or 2.")

# Close the cursor and connection
cursor.close()
connection.close()

