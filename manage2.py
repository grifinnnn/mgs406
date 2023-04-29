from flask import Flask, render_template
import mysql.connector

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
    conn = mysql.connector.connect(
        host="127.0.0.1",
        user="dba",
        password="CH3m!$try",
        database="employees"
    )
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
