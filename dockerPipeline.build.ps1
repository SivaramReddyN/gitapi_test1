#Parameters
param(
    $name = "PodeServer",
    $dockerTag = "Latest"
)

$DockerImageName = "$($name):$($dockerTag)"

#Stop and Remove docker image.
task StopContainerAndRemoveImage {
    docker rm (docker ps -aq) -f; docker rmi (docker image ls -qa) -f
}

#Stop docker container.
task StopContainer {
    docker stop $name
}

#Remove docker container.
task RemoveContainer {
    docker ps -aq | ForEach-Object { docker rm $_ }
}

#Build  docker image.
task BuildImage {
    docker build --tag $DockerImageName .
}

#Run  docker image.
task RunContainer {
    docker run -d --name $name -p 8080:8080 $DockerImageName
}

task . StopContainer, RemoveContainer, BuildImage, RunContainer