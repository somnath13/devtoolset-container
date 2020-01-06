CentOS6 based Docker Image
===============================

devtoolset-6-toolchain-centos6
-------------------------------

First build the CentOS6 based image:

    $ cd 6-toolchain/
    $ docker build -t mystic/devtoolset-6-toolchain-centos6 .

If you want to build C source code in ~/sources/myapp:

    $ cd ~/sources
    $ docker run -ti --rm -v $PWD:/home/mystic/work:z mystic/devtoolset-6-toolchain-centos6 bash -l
    bash-4.1$ cd myapp/
    bash-4.1$ make

To build in non-interactive mode as UID=500 and GID=500:

    $ cd ~/sources
    $ docker run -ti --rm -u 500:500 -v $PWD:/home/mystic/work:z mystic/devtoolset-6-toolchain-centos6 make -C myapp

To start an interactive bash session as root:

    $ docker run -ti --rm -u 0:0 -v $PWD:/home/mystic/work:z mystic/devtoolset-6-toolchain-centos6 bash -l

