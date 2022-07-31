from enum import Enum


class DatasetType(Enum):
    dataset = "dataset.csv"
    symptom_description = "symptom_Description.csv"
    symptom_precaution = "symptom_precaution.csv"
    symptom_severity = "Symptom-severity.csv"
    testing = "Testing.csv"
    training = "Training.csv"

    def original_path(self, prefix: str = "..") -> str:
        return prefix + "/" + "datasets/original" + "/" + self.value

    def cleaned_path(self, prefix: str = "..") -> str:
        return prefix + "/" + "datasets/cleaned" + "/" + self.value

    # source: SourceType
    def path(self, source, prefix: str = "..") -> str:
        return prefix + "/" + source.value + "/" + self.value

    def values() -> list:
        return [path for path in DatasetType]
