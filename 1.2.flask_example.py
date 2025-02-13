from flask import Flask, jsonify
import pandas as pd
from sqlalchemy import create_engine, text

app = Flask(__name__)

# Database connection details
DB_NAME = 'commerce'
DB_USER = 'yzpt'
DB_PASSWORD = 'pwd'
DB_HOST = 'localhost'
DB_PORT = '5432'

# Create SQLAlchemy engine
engine = create_engine(f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}')

@app.route('/clients', methods=['GET'])
def get_clients():
    try:
        # Read data from database
        sql = text('SELECT * FROM clients')
        clients = pd.read_sql(sql, engine)
        
        # Convert DataFrame to dictionary
        return jsonify(clients.to_dict(orient='records'))
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/produits', methods=['GET'])
def get_produits():
    try:
        # Read data from database
        sql = text('SELECT * FROM produits')
        produits = pd.read_sql(sql, engine)
        
        # Convert DataFrame to dictionary
        return jsonify(produits.to_dict(orient='records'))
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)
    
    