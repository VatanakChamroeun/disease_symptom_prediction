import numpy as np
from flask import Flask, request, jsonify
from flask_cors import CORS
import pickle
import pandas as pd
import numpy as np
import json
import jsonpickle
from json import JSONEncoder

app = Flask(__name__)
CORS(app)

# model = pickle.load(open('./models/model.pkl', 'rb'))


@app.route('/api/predict', methods=['POST'])
def predict():
    data = request.get_json()
    df = pd.DataFrame(columns=['Symptom_1', 'Symptom_2', 'Symptom_3', 'Symptom_4', 'Symptom_5', 'Symptom_6', 'Symptom_7', 'Symptom_8',
                               'Symptom_9', 'Symptom_10', 'Symptom_11', 'Symptom_12', 'Symptom_13', 'Symptom_14', 'Symptom_15', 'Symptom_16', 'Symptom_17'])
    df = df.append(data, ignore_index=True)
    df = df.fillna(0)
    vals = df.values
    df_serverity = pd.read_csv('./datasets/original/Symptom-severity.csv')
    symptoms = df_serverity['Symptom'].unique()
    for i in range(len(symptoms)):
        vals[vals == symptoms[i]] = df_serverity[df_serverity['Symptom']
                                                 == symptoms[i]]['weight'].values[0]

    for row in range(len(vals)):
        for cols in range(len(vals[row])):
            if type(vals[row][cols]) == str:
                vals[row][cols] = 0

    df = pd.DataFrame(vals, columns=df.columns)
    print(df.head())
    model = pickle.load(open('./models/model.pkl', 'rb'))
    output = model.predict(df)

    return output[0]


@app.route('/api/severity', methods=['GET'])
def severity():
    df_serverity = pd.read_csv('./datasets/original/Symptom-severity.csv')
    symptoms = df_serverity['Symptom'].unique()
    return jsonpickle.encode({"symptoms": symptoms.tolist()})


class NpEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, np.integer):
            return int(obj)
        if isinstance(obj, np.floating):
            return float(obj)
        if isinstance(obj, np.ndarray):
            return obj.tolist()
        return json.JSONEncoder.default(self, obj)


if __name__ == '__main__':
    app.run(debug=True)
