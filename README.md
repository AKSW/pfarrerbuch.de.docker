This is the docker file for the http://pfarrerbuch.aksw.org/ page

run with

    docker run -d -v <somepath>/id_rsa:/root/.ssh/id_rsa -v <somepath>/known_hosts:/root/.ssh/known_hosts -e "MODEL_REPO=<your models>" --name pfarrerbuch aksw/pfarrerbuch

If a SSH authentication agent is running on the host it can also be mounted to `/var/run/ssh-agent.sock` instead of the private key (`id_rsa`).
See also [Forward SSH Authentication to Docker Container](https://natanael.arndt.xyz/2017/06/23/Forward-SSH-Authentication-To-Docker-Container).

Optionally `-e "BACKUP=false"` can be set to disable the backup cron job
