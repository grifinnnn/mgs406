from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# Connect to the database
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="dba",
    password="CH3m!$try",
    database="helpdesk"
)

# Route for the home page
@app.route("/")
def home():
    return render_template("home.html")

# Route for the ticket submission page
@app.route("/submit", methods=["GET", "POST"])
def submit():
    if request.method == "POST":
        # Retrieve the form data
        submitted_by = request.form.get("submitted_by")
        priority = request.form.get("priority")
        description = request.form.get("description")
        
        # Insert a new ticket into the database
        c = conn.cursor()
        c.execute("INSERT INTO tickets (date_submitted, submitted_by, priority, description, status) VALUES (CURDATE(), %s, %s, %s, 'Open')", (submitted_by, priority, description))
        conn.commit()
        
        # Redirect to the ticket page
        return redirect(url_for("tickets"))
    else:
    # Render the ticket submission page
        return render_template("submit.html")

# Route for the ticket information page
@app.route("/tickets")
def tickets():
    # Query the database for open or in progress tickets
    c = conn.cursor()
    c.execute("SELECT * FROM tickets WHERE status = 'Open' OR status = 'In Progress'")
    tickets = c.fetchall()
    
    # Render the ticket information page with the open or in progress tickets table
    return render_template("tickets.html", tickets=tickets)

# Route for updating ticket status
@app.route("/update-status", methods=["POST"])
def update_status():
    # Retrieve the form data
    ticket_id = request.form.get("ticket_id")
    new_status = request.form.get("new_status")
    
    # Update the ticket status in the database
    c = conn.cursor()
    c.execute("UPDATE tickets SET status=%s WHERE id=%s", (new_status, ticket_id))
    conn.commit()
    
    # Redirect to the ticket information page
    return redirect(url_for("tickets"))

# Route for resolving a ticket
@app.route("/resolve", methods=["POST"])
def resolve():
    # Retrieve the form data
    ticket_id = request.form.get("ticket_id")
    
    # Update the ticket status in the database to "Resolved"
    c = conn.cursor()
    c.execute("UPDATE tickets SET status='Resolved' WHERE id=%s", (ticket_id,))
    conn.commit()
    
    # Redirect to the ticket information page
    return redirect(url_for("tickets"))

if __name__ == "__main__":
    app.run(debug=True)

# Close the database connection
conn.close()
