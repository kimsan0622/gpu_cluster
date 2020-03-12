export GITLAB_IP=10.1.92.5
export GITLAB_DIR=/home/airc/gitlab

mkdir ${GITLAB_DIR}/config
mkdir ${GITLAB_DIR}/logs
mkdir ${GITLAB_DIR}/data

# gitlab/gitlab-ce:latest
# gitlab/gitlab-ee:latest
docker run --detach \
  --network dockernet \
  --ip ${GITLAB_IP} \
  --hostname gitlab.airc.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume ${GITLAB_DIR}/config:/etc/gitlab \
  --volume ${GITLAB_DIR}/logs:/var/log/gitlab \
  --volume ${GITLAB_DIR}/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest
