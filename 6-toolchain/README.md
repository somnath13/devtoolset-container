devtoolset-6-toolchain-centos6 - CentOS6 based Docker Image
===========================================================

Building the docker image
-------------------------

First build the CentOS6 based image:

    $ cd 6-toolchain/
    $ docker build -t mystic/devtoolset-6-toolchain-centos6 .


Building applications using make/GCC
------------------------------------

If you want to build C source code in ~/sources/myapp:

    $ cd ~/sources
    $ docker run -ti --rm -v $PWD:/home/mystic/work:z mystic/devtoolset-6-toolchain-centos6 bash -l
    bash-4.1$ cd myapp/
    bash-4.1$ make

To build in non-interactive mode:

    $ cd ~/sources/myapp
    $ docker run --rm -v $PWD:/home/mystic/work/myapp:z mystic/devtoolset-6-toolchain-centos6 make -C myapp

To start an interactive bash session as root:

    $ docker run -ti --rm -v $PWD:/opt/app-root/src:z mystic/devtoolset-6-toolchain-centos6 bash -l

