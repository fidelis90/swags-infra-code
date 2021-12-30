# Dockerfile 

- referenced from official docker documentation 

- Usage 
  - docker build : builds an image from a dockerfile and a context
  - the context is the set of files at a specified location PATH or URL 
  - pATH: local on system URL: GIT REPO 
  - docker build . 
  - always use a .dockerignore 
  - docker build -f /path/to/a/Dockerfile 
  - docker build -t : to specify the repo and tag at which to save the new image if the build succeds 

- tHE DOCKER daemon executes the instructions in the Dockerfile line by line one by one 
- then finally outputting the ID of your new image 
- the docker daemon will automatically clean up the context you sent 

- each instruction is run independently, and causes a new image to be vreated 
- RUN cd /tmp  will not have any effect on the next instructions 

## Format 

Instruction arguments 

- The instruction is not case sensitive, however convention is for them to be uppercase to distinguish them from the arguments 

- a dockerfile must begin with a FROM 
  - FROM: specifies the base image 

- Instructions in Dockerfile 
  - ADD
    - ADD <src> [<src> ...] <dest>
    - Copies new files, directories, or remote file URLs from <src> and adds them to the filesystem of the image at the path <dest>

  - COPY 
  - ENV 
    - ENV <key> <value>
    - ENV <key>=<value> [<key>=<value> ...]
    - The ENV instruction sets the environment variable <key> to the value <value>.
    - 
  - FROM 
    - FROM <image>
    - FROM <image>:<tag>
    - FROM can appear multiple times within a single Dockerfile in order to create multiple images.

  - MAINTAINER 
    - MAINTAINER <name>: set the author field of the generated image 

  - RUN 
    - RUN <command> (shell form, runs command in a shell by default /bin/sh -c on linux or cmd /S /C on windows)
    - RUN ["<executable>", "<param>", "<param>"] (exec form)
    - the exec form makes it possible to avoid shell string munging 
      - RUN ["echo", "$HOME"] : THIS WILL not do variable substitution on HOME 

  - CMD 
    - CMD ["<executable>", "<param>", "<param>"] (exec form) PREFERRED FORM 
    - CMD ["<param1>","<param2>"] (as default parameters to ENTRYPOINT)
    - CMD <command> <param1> <param2> (shell form)
    - There can be only one CMD in a dockerfile
    - We use this to specify default programs that should run when users do not input arguments in the cli

  - LABEL 
    - LABEL <key>=<value> [<key>=<value> ...]
    - The LABEL instruction adds metadata to an image.

  - EXPOSE 
    -  EXPOSE <port> [<port> ...]
    - Informs Docker that the container listens on the specified network port(s) at runtime.
    - EXPOSE does not make the ports of the container accessible to the host.

  - ENTRYPOINT 
    - ENTRYPOINT ["<executable>", "<param1>", "<param2>"] (exec form, preferred)
    - Allows you to configure a container that will run as an executable.
    - use this when there is a program that must be executed when container starts 

  - CMD AND ENTRYPOINT
    - We can use both instructions together 
    - ENTRYPOINT ["<executable>"]
    - CMD ["<param>"]
    - ENTRYPOINT ["echo", "hello"]CMD ["Swags"]
    - means everytime you run the container, hello swags will be outputted 
    - swags can be overriden, if another parameter is specified on the cli 
    - to override the entrypoint executable at startup, we use the --entrypoint <executable> 

  - STOPSIGNAL 
  - USER 
    - USER <username | UID>
    - The USER instruction sets the user name or UID to use when running the image and for any RUN, CMD and ENTRYPOINT instructions that follow it in the Dockerfile.

  - VOLUME 
    - VOLUME ["<path>", ...]
    - Creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers.

  - WORKDIR
    - WORKDIR </path/to/workdir>
    - Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow it.
    - It can be used multiple times in the one Dockerfile. If a relative path is provided, it will be relative to the path of the previous WORKDIR instruction.

  - ONBUILD 
    - ONBUILD <Dockerfile INSTRUCTION>