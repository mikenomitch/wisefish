echo === SUBMIT BUILD TO REGISTRY ===
gcloud builds submit --tag=gcr.io/${PROJECT_ID}/wisefish:release .

echo === APPLY LATEST CHANGES ===
kubectl apply -f k8s/wisefish-deployment.yaml
