import os
import subprocess

# local folder
DATA_DIR = "data/csv"

# kaggle doc :
DATASET = "olistbr/brazilian-ecommerce"

def download_kaggle_dataset():
    os.makedirs(DATA_DIR, exist_ok=True)
    print(f"Téléchargement du dataset {DATASET} vers {DATA_DIR} ...")
    
    
    subprocess.run([
        "kaggle", "datasets", "download", "-d", DATASET,
        "-p", DATA_DIR, "--unzip"
    ], check=True)

if __name__ == "__main__":
    download_kaggle_dataset()
    print("Ingestion terminée ✅")
