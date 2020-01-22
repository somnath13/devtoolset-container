CentOS6 with devtoolset-6-toolchain
===================================

Building the docker image
-------------------------

First build the CentOS6 based image:

    $ cd 6-toolchain/
    $ docker build -t mysticvideo/devtoolset-6-toolchain-centos6 .

Display usage information:

    $ docker run --rm mysticvideo/devtoolset-6-toolchain-centos6

Start an interactive bash session as root:

    $ docker run -ti --rm -v $PWD:/opt/app-root/src:z mysticvideo/devtoolset-6-toolchain-centos6 bash -l

