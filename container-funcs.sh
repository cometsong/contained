#!/usr/bin/env bash
#=============================================================================#
#            Bash Functions for Docker and Singularity Containers             #
#=============================================================================#

declare -x DOCKER_ACCOUNT=cometsong
declare -l DOCKER_REPO_PREFIX="${DOCKER_ACCOUNT}/"

dock_ls_imgs(){
  # Lists image repo:tag names without header line
  docker images --format "{{.Repository}}:{{.Tag}}" $* #| tail -n +2
}

dock_ll_imgs(){
  # Lists tsv images: id  size  repo:tag
  docker images --format "table {{.ID}}\t{{.Size}}\t{{.Repository}}:{{.Tag}}" $*
}

dockrunit() {
  # Usage: dockrunit <image_name> [command[s]]
  (($#)) && \
  docker run --entrypoint "/bin/bash" -it $*
}

dock_rmi_dangling() {
  declare args="${*:-''}"
  docker rmi $args $(docker images -f "dangling=true" -q)
}

dock_build_img(){
  # N.B.: this assumes:
  #   1) folder names match image names
  declare ImgDir="${1?'Usage: dock_build_img <image_folder_name> [tag(latest)]'}"
  declare ImgTag=":${2:-latest}"
  declare DockImg=${DOCKER_REPO_PREFIX}${ImgDir,,}${ImgTag}
  echo docker build -t ${DockImg} ${ImgDir}/
  if [[ $? = 0 ]]; then
    # test resulting image's container commands...
    echo;echo "Test running: docker run ${DockImg}"
    (docker run ${DockImg})
    if [[ $? = 0 ]]; then
      echo;echo "Successful run of: $(dock_ls_imgs ${DockImg})";
      docker images ${DockImg};
    fi
  fi
}


#~~~~~~~~~~~~~~~~~~~~~~~ Convert Docker to Singularity ~~~~~
dock_sing_filenames(){
  # show all docker images in format:
  #   { image }__{ tag }__{ source }
  docker images \
    --format "{{.Repository}}__{{.Tag}}" \
    |sort -b -k4 \
    |gawk '{FS="/";print $2"__"$1}'
}

dock2singular() {
  declare singver=":v$(singularity version | cut -d\- -f1)" || ":latest"
  declare dock2sing="quay.io/singularity/docker2singularity$singver"
  docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ${PWD}/:/output \
    --privileged \
    -t \
    --rm \
    $dock2sing $*;
};
#  echo "To Finish image:"
#  echo '> ' docker push ${DockerImage}
#  echo '> ' dock2singular -n ${SifImage} ${DockerImage}
#  echo '> ' singularity pull ${SifImage} docker://${DockerImage}
#  echo '> ' singularity push ${SifImage} library://${DockerAccount}/${CollectionName}/${ImageName}:${ImageTag}
