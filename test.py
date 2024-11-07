import requests
from pymongo import MongoClient

# MongoDB setup
client = MongoClient('mongodb://localhost:27017/')
db = client['your_database']
collection = db['jobs_collection']

# Authentication to get access token
auth_url = 'https://api-nexus.laboredge.com:9000/api/secured/oauth/token'
auth_headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization': 'Basic <your_base64_encoded_credentials>'
}
auth_data = {
    'username': 'your_username',
    'password': 'your_password',
    'client_id': 'your_client_id',
    'grant_type': 'password',
    'organizationCode': 'your_organization_code'
}

auth_response = requests.post(auth_url, headers=auth_headers, data=auth_data)
auth_response.raise_for_status()  # Check for errors
access_token = auth_response.json().get('access_token')

# Fetch jobs data
jobs_url = 'https://api-nexus.laboredge.com:9000/api/job-service/v1/ats/external/jobs/search'
job_headers = {
    'Authorization': f'Bearer {access_token}',
    'Content-Type': 'application/json'
}
job_data = {
    'pagingDetails': { 'start': 0 },
    'jobStatusCode': 'OPEN'
}

try:
    job_response = requests.post(jobs_url, headers=job_headers, json=job_data)
    job_response.raise_for_status()
    jobs = job_response.json().get('records', [])

    # Store jobs in MongoDB
    if jobs:
        collection.insert_many(jobs)
        print(f"Inserted {len(jobs)} jobs into MongoDB.")
    else:
        print("No jobs found or response is empty.")

except requests.exceptions.RequestException as e:
    print(f"Error occurred: {e}")
    print("Response text:", job_response.text)
