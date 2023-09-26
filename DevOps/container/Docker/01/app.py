from flask import Flask, jsonify, request

app = Flask(__name__)

# Sample data as a dictionary (you can replace this with your data)
data = {
    1: {"name": "Alice", "age": 30},
    2: {"name": "Bob", "age": 25},
    3: {"name": "Charlie", "age": 35},
}

# Endpoint to retrieve all data
@app.route('/api/data', methods=['GET'])
def get_all_data():
    return jsonify(data)

# Endpoint to retrieve data by ID
@app.route('/api/data/<int:id>', methods=['GET'])
def get_data_by_id(id):
    if id in data:
        return jsonify(data[id])
    else:
        return jsonify({"message": "Data not found"}), 404

# Endpoint to add new data
@app.route('/api/data', methods=['POST'])
def add_data():
    new_id = max(data.keys(), default=0) + 1
    new_data = request.get_json()
    data[new_id] = new_data
    return jsonify({"message": "Data added successfully", "id": new_id}), 201

# Endpoint to update data by ID
@app.route('/api/data/<int:id>', methods=['PUT'])
def update_data(id):
    if id in data:
        updated_data = request.get_json()
        data[id] = updated_data
        return jsonify({"message": "Data updated successfully"})
    else:
        return jsonify({"message": "Data not found"}), 404

# Endpoint to delete data by ID
@app.route('/api/data/<int:id>', methods=['DELETE'])
def delete_data(id):
    if id in data:
        del data[id]
        return jsonify({"message": "Data deleted successfully"})
    else:
        return jsonify({"message": "Data not found"}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
