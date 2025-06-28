from flask import Flask, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
CORS(app)

# MongoDB connection
client = MongoClient("mongodb+srv://servicehub:pradhaa87@servicehub.pscwbtm.mongodb.net/")
db = client["Servicehub_People"]
collection = db["users"]

@app.route("/signup", methods=["POST"])
def signup():
    data = request.json
    name = data.get("name")
    phone = data.get("phone")
    password = data.get("password")

    # Input validation
    if not all([name, phone, password]):
        return jsonify({"success": False, "message": "All fields are required"}), 400

    # Check if phone number already exists
    if collection.find_one({"phone": phone}):
        return jsonify({"success": False, "message": "Phone number already exists"}), 400

    # Hash the password before storing
    hashed_password = generate_password_hash(password)

    # Insert user into MongoDB
    collection.insert_one({
        "name": name,
        "phone": phone,
        "password": hashed_password
    })

    return jsonify({"success": True, "message": "Signup successful"}), 200

@app.route("/signin", methods=["POST"])
def signin():
    data = request.json
    phone = data.get("phone")
    password = data.get("password")

    if not all([phone, password]):
        return jsonify({"success": False, "message": "All fields are required"}), 400

    user = collection.find_one({"phone": phone})

    if user:
        if check_password_hash(user["password"], password):
            return jsonify({"success": True, "message": "Login successful"}), 200
        else:
            return jsonify({"success": False, "message": "Incorrect password"}), 401
    else:
        return jsonify({"success": False, "message": "User not found"}), 404

if __name__ == "__main__":
    # Allow access from any device on same network (e.g., your mobile)
    app.run(host="0.0.0.0", port=5000, debug=True)
