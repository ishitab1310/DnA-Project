import mysql.connector
from faker import Faker

# Establish a connection to the database
connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='sql_utsav',
    database='flight_management_system'
)

# Create a cursor object
cursor = connection.cursor()

# Function to generate random data for testing
def generate_random_data(table_name, num_tuples):
    fake = Faker()
    data = []

    if table_name == 'Airplane':
        for _ in range(num_tuples):
            data.append((fake.random_int(min=100, max=999), fake.word(), fake.random_int(min=10000, max=100000), fake.random_int(min=50, max=300)))

    elif table_name == 'Maintenance_History':
        for _ in range(num_tuples):
            data.append((fake.random_int(min=1, max=100), fake.random_int(min=100, max=999), fake.word(), fake.random_int(min=100, max=1000), fake.date(), fake.random_int(min=1, max=100), fake.random_int(min=1, max=100)))

    # Add conditions for other tables similarly...

    return data

# Function to insert random tuples into the specified table
def insert_random_tuples(table_name, num_tuples):
    data = generate_random_data(table_name, num_tuples)
    try:
        placeholders = ', '.join(['%s'] * len(data[0]))
        query = f"INSERT INTO {table_name} VALUES ({placeholders})"
        cursor.executemany(query, data)
        print(f"Inserted {num_tuples} random tuples into {table_name}")
        connection.commit()
    except Exception as e:
        print(f"Failed to insert into {table_name}")
        print(">>>>>>>>>>>>>", e)

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
    print("1. Insert Random Data")
    print("2. Retrieve Operations")
    print("3. Analysis Reports")
    print("4. Modification Operations")
    print("5. Bonus Requirement")
    print("0. Exit")

    main_choice = input("Enter your choice (0-5): ")

    if main_choice == '1':
        # Insert Random Data
        insert_random_tuples('Airplane', 5)
        insert_random_tuples('Maintenance_History', 5)
        insert_random_tuples('Employee', 5)
        insert_random_tuples('Location', 5)
        insert_random_tuples('Flight', 5)
        insert_random_tuples('Reservation', 5)
        insert_random_tuples('Passenger', 5)
        insert_random_tuples('Baggage', 5)
        insert_random_tuples('Feedback', 5)
        insert_random_tuples('Log', 5)

    elif main_choice == '2':
        # Retrieve Operations
        retrieve_operations()

    elif main_choice == '3':
        # Analysis Reports
        print("\nAnalysis Reports:")
        print("1. Analyze the redemption of loyalty points for various rewards and benefits.")
        print("2. Assess baggage handling efficiency using Reservation ID, passenger name, and associated baggage ID.")
        print("3. Analyze flight schedules for route optimization, peak travel times, and route expansion opportunities using Location names, airport codes, and departure and arrival times.")
        print("0. Back to Main Menu")

        analysis_choice = input("Enter your choice (0-3): ")

        if analysis_choice == '1':
            # TODO: Implement Analysis Report 1
            pass

        elif analysis_choice == '2':
            # TODO: Implement Analysis Report 2
            pass

        elif analysis_choice == '3':
            # TODO: Implement Analysis Report 3
            pass

        elif analysis_choice == '0':
            # Back to Main Menu
            continue

        else:
            print("Invalid choice. Please enter a number between 0 and 3.")

    elif main_choice == '4':
        # Modification Operations
        print("\nModification Operations:")
        print("1. Insertion")
        print("2. Update")
        print("3. Deletion")
        print("0. Back to Main Menu")

        modification_choice = input("Enter your choice (0-3): ")

        if modification_choice == '1':
            # Insertion Operations
            print("\nInsertion Operations:")
            print("1. Add passenger details when making a new reservation.")
            print("2. Add a new aircraft to the inventory.")
            print("3. Schedule a new maintenance check for an aircraft.")
            print("0. Back to Modification Menu")

            insertion_choice = input("Enter your choice (0-3): ")

            if insertion_choice == '1':
                # TODO: Implement Insertion Operation 1
                pass

            elif insertion_choice == '2':
                # TODO: Implement Insertion Operation 2
                pass

            elif insertion_choice == '3':
                # TODO: Implement Insertion Operation 3
                pass

            elif insertion_choice == '0':
                # Back to Modification Menu
                continue

            else:
                print("Invalid choice. Please enter a number between 0 and 3.")

        elif modification_choice == '2':
            # Update Operations
            print("\nUpdate Operations:")
            print("1. Modify flight timings and policies.")
            print("2. Update employee job title or department (post promotion).")
            print("3. Update maintenance log with the results of a maintenance check.")
            print("0. Back to Modification Menu")

            update_choice = input("Enter your choice (0-3): ")

            if update_choice == '1':
                # TODO: Implement Update Operation 1
                pass

            elif update_choice == '2':
                # TODO: Implement Update Operation 2
                pass

            elif update_choice == '3':
                # TODO: Implement Update Operation 3
                pass

            elif update_choice == '0':
                # Back to Modification Menu
                continue

            else:
                print("Invalid choice. Please enter a number between 0 and 3.")

        elif modification_choice == '3':
            # Deletion Operations
            print("\nDeletion Operations:")
            print("1. Remove passengers who canceled their reservations.")
            print("2. Remove aircraft that have been sold/retired.")
            print("0. Back to Modification Menu")

            deletion_choice = input("Enter your choice (0-2): ")

            if deletion_choice == '1':
                # TODO: Implement Deletion Operation 1
                pass

            elif deletion_choice == '2':
                # TODO: Implement Deletion Operation 2
                pass

            elif deletion_choice == '0':
                # Back to Modification Menu
                continue

            else:
                print("Invalid choice. Please enter a number between 0 and 2.")

        elif modification_choice == '0':
            # Back to Main Menu
            continue

        else:
            print("Invalid choice. Please enter a number between 0 and 3.")

    elif main_choice == '5':
        # Bonus Requirement
        print("\nBonus Requirement:")
        print("1. Recursive relationship: Relationship type with the same participating entity type in distinct roles: Employee (Captain/Crew)")
        print("0. Back to Main Menu")

        bonus_choice = input("Enter your choice (0-1): ")

        if bonus_choice == '1':
            # TODO: Implement Bonus Requirement 1
            pass

        elif bonus_choice == '0':
            # Back to Main Menu
            continue

        else:
            print("Invalid choice. Please enter 0 or 1.")

    elif main_choice == '0':
        # Exit
        break

    else:
        print("Invalid choice. Please enter a number between 0 and 5.")

# Close the cursor and connection
cursor.close()
connection.close()
