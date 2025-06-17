from flask import Flask, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient

app = Flask(__name__)
CORS(app)

client = MongoClient("mongodb+srv://servicehub:pradhaa87@servicehub.tuu2kyf.mongodb.net/?retryWrites=true&w=majority&appName=servicehub")
db = client["signup"]
collection = db["data"]

@app.route("/signup", methods=["POST"])
def signup():
    data = request.json
    name = data["name"]
    phone = data["phone"]
    password = data["password"]

    if collection.find_one({"phone": phone}):
        return jsonify({"success": False, "message": "Phone number already exists"}), 400

    collection.insert_one({
        "name": name,
        "phone": phone,
        "password": password
    })

    return jsonify({"success": True, "message": "Signup successful"}), 200

@app.route("/signin", methods=["POST"])
def signin():
    data = request.json
    phone = data["phone"]
    password = data["password"]

    user = collection.find_one({"phone": phone})
    if user:
        if user["password"] == password:
            return jsonify({"success": True, "message": "Login successful"}), 200
        else:
            return jsonify({"success": False, "message": "Incorrect password"}), 401
    else:
        return jsonify({"success": False, "message": "User not found"}), 404

if __name__ == "__main__":
    app.run(debug=True)
