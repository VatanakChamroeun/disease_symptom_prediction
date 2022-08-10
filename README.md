# Disease Symptom Prediction
<img width="1792" alt="Screen Shot 2022-08-10 at 6 55 29 PM" src="https://user-images.githubusercontent.com/63393872/183895104-6e52551b-0ea6-44d4-979f-11e0e5615be4.png">

## References
- Raw Dataset: https://www.kaggle.com/datasets/itachi9604/disease-symptom-description-dataset/download?datasetVersionNumber=2
- Cleaned Dataset: https://drive.google.com/drive/folders/1cw5vHv9IjLwBaYeiM3a4iBL7mu94rYN1?usp=sharing

## Read csv
To read csv file:
```s
pd.read_csv(DatasetType.csv_name.path())
```

## Save graph
To save graph as image to asset folder:
```s
SaveGraphService(x=df['x'], y=df['y'], file_name='hello_world').render()
```
