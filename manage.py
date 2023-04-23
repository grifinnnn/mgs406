from flask import Flask, render_template
import sqlite3

app = Flask(__name__)

# Route for the home page
@app.route("/")
def home():
    return render_template("home.html")

# Route for the employee registration page
@app.route("/registration")
def registration():
    return render_template("registration.html")

# Route for the employee information page
@app.route("/information")
def information():
    # Connect to the database
    conn = sqlite3.connect("employees.db")
    c = conn.cursor()
    
    # Query the database for all employees
    c.execute("SELECT * FROM employee")
    employees = c.fetchall()
    
    # Close the database connection
    conn.close()
    
    # Render the information page with the employees table
    return render_template("information.html", employees=employees)

if __name__ == "__main__":
    app.run(debug=True)
