# TODO: Interpolate env vars here
# https://console.aws.amazon.com/ecs/home?region=us-east-1#/repositories/create/new

$(aws ecr get-login --no-include-email --region us-east-1)
cd ./frontend && npm run build && cd ..
docker build -t platemail .
docker tag platemail:latest 594906412132.dkr.ecr.us-east-1.amazonaws.com/platemail:latest
docker push 594906412132.dkr.ecr.us-east-1.amazonaws.com/platemail:latest
