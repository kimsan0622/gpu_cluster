export GITLAB_DIR=/home/airc/gitlab

sudo docker run --detach \
  --network dockernet \
  --ip 10.1.92.5 \
  --hostname gitlab.airc.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume ${GITLAB_DIR}/config:/etc/gitlab \
  --volume ${GITLAB_DIR}/logs:/var/log/gitlab \
  --volume ${GITLAB_DIR}/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest
