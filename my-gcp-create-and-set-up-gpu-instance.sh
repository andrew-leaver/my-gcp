export IMAGE_FAMILY="tf-latest-cu92" # image family from the previous step; tf-latest-cpu is default
export ZONE="us-west1-b"
export INSTANCE_NAME="my-tf-gpu-instance"

# 'type=nvidia-tesla-v100' will get us a V100

gcloud compute instances create $INSTANCE_NAME \
  --zone=$ZONE \
  --image-family=$IMAGE_FAMILY \
  --image-project=deeplearning-platform-release \
  --maintenance-policy=TERMINATE \
  --accelerator='type=nvidia-tesla-k80,count=1' \
  --metadata='install-nvidia-driver=True'
