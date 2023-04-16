from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'Welcome to my Flask app!'

@app.route('/greetings/')
def greetings():
    return 'Please specify which greeting you would like to see by entering /greetings/christmas or /greetings/newyear.'

@app.route('/greetings/christmas')
def christmas():
    return 'Merry Christmas!'

@app.route('/greetings/newyear')
def newyear():
    return 'Happy New Year!'

if __name__ == '__main__':
    app.run()
