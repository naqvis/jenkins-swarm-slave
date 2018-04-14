# Jenkins Swarm Slave

Docker image [`alinaqvi/jenkins-swarm-slave`](https://registry.hub.docker.com/u/alinaqvi/jenkins-swarm-slave/) for [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave based on [carlossg/jenkins-swarm-slave-docker
](https://github.com/carlossg/jenkins-swarm-slave-docker) 

*But*

1. Changed to openjdk 8 - Alpine to reduce image size
2. Using 3.9 version of Jenkins Swarm client

## Running

To run a Docker container passing [any parameters](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin#SwarmPlugin-AvailableOptions) to the slave

    docker run alinaqvi/jenkins-swarm-slave -master http://jenkins:8080 -username jenkins -password jenkins -executors 1

    Linking to the Jenkins master container there is no need to use `--master`

        docker run -d --name jenkins -p 8080:8080 csanchez/jenkins-swarm
	    docker run -d --link jenkins:jenkins alinaqvi/jenkins-swarm-slave -username jenkins -password jenkins -executors 1


# Building

    docker build -t alinaqvi/jenkins-swarm-slave .

