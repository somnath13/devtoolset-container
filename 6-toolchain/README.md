CentOS6 based Docker Image
===============================

devtoolset-6-toolchain-centos6
-------------------------------

First build the CentOS6 based image:

    $ cd 6-toolchain/
    $ docker build -t mystic/devtoolset-6-toolchain-centos6 .

If you want to build C source code in ~/sources/myapp:

    $ cd ~/sources
    $ docker run -ti --rm -v $PWD:/opt/app-root/src:z mystic/devtoolset-6-toolchain-centos6 bash
    bash-4.1$ cd myapp/
    bash-4.1$ make

To build in non-interactive mode:

    $ cd ~/sources/myapp
    $ docker run -ti --rm -v $PWD:/opt/app-root/src:z mystic/devtoolset-6-toolchain-centos6 make


