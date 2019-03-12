This is the docker file for the http://pfarrerbuch.aksw.org/ page

run with

    docker run -d -v <some path>/id_rsa:/root/.ssh/id_rsa -v <some path>/known_hosts:/root/.ssh/known_hosts -e "MODEL_REPO=<your models repo>" --name pfarrerbuch aksw/pfarrerbuch

If a SSH authentication agent is running on the host it can also be mounted to `/var/run/ssh-agent.sock` instead of the private key (`id_rsa`).
See also [Forward SSH Authentication to Docker Container](https://natanael.arndt.xyz/2017/06/23/Forward-SSH-Authentication-To-Docker-Container).

Optionally `-e "BACKUP=false"` can be set to disable the backup cron job.

If you are using a different default model resp. base namespace you can customize the `OW_SITE_*` variables as shown below.

## Possible options

### Volumes

    -v <some path>/id_rsa:/root/.ssh/id_rsa *or*
    -v $SSH_AUTH_SOCK:/var/run/ssh-agent.sock
    -v <some path>/known_hosts:/root/.ssh/known_hosts
    -v <some path>/models:/models

#### Environment Variables

    -e "MODEL_REPO=<your models repo>"
    -e "BACKUP=false"
    -e "OW_SITE_MODEL=http://pfarrerbuch.aksw.org/"
    -e "OW_SITE_INDEX=http://pfarrerbuch.aksw.org/About"
    -e "OW_SITE_ERROR=http://pfarrerbuch.aksw.org/NotFound"

virtuoso-opensource_7.1_amd64.deb was built from the sourcecode of https://github.com/openlink/virtuoso-opensource
