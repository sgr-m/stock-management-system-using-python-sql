import mysql.connector
from datetime import date

# Establish a connection to the MySQL database
conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="StockManagement"
    )
cursor = conn.cursor()

def display_products():
    cursor.execute("SELECT * FROM Products")
    products = cursor.fetchall()
    print("\nProducts:")
    for product in products:
        print(product)

def display_suppliers():
    cursor.execute("SELECT * FROM Suppliers")
    suppliers = cursor.fetchall()
    print("\nSuppliers:")
    for supplier in suppliers:
        print(supplier)

def display_transactions():
    cursor.execute("SELECT * FROM Transactions")
    transactions = cursor.fetchall()
    print("\nTransactions:")
    for transaction in transactions:
        print(transaction)

def add_transaction(product_id, supplier_id, transaction_type, quantity):
    today = date.today()
    transaction_date = today.strftime("%Y-%m-%d")
    cursor.execute("INSERT INTO Transactions (ProductID, SupplierID, TransactionType, Quantity, TransactionDate) VALUES (%s, %s, %s, %s, %s)",
                   (product_id, supplier_id, transaction_type, quantity, transaction_date))
    conn.commit()
    print("\nTransaction added successfully.")

# Main program loop
while True:
    print("\nStock Management System")
    print("1. Display Products")
    print("2. Display Suppliers")
    print("3. Display Transactions")
    print("4. Add Transaction")
    print("0. Exit")

    choice = input("Enter your choice (0-4): ")

    if choice == '1':
        display_products()
    elif choice == '2':
        display_suppliers()
    elif choice == '3':
        display_transactions()
    elif choice == '4':
        product_id = int(input("Enter Product ID: "))
        supplier_id = int(input("Enter Supplier ID: "))
        transaction_type = input("Enter Transaction Type (In/Out): ").capitalize()
        quantity = int(input("Enter Quantity: "))
        add_transaction(product_id, supplier_id, transaction_type, quantity)
    elif choice == '0':
        break
    else:
        print("Invalid choice. Please enter a valid option.")

# Close the connection
cursor.close()
conn.close()