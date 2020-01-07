FROM centos:centos6
LABEL MAINTAINER Som Ghosh <ghosh.som@gmail.com>

ENV SUMMARY="Red Hat Developer Toolset 6 Toolchain container image based on CentOS6" \
    DESCRIPTION="Platform for building C/C++ applications using Red Hat \
Developer Toolset 6. Red Hat Developer Toolset is a Red Hat \
offering for developers on the Red Hat Enterprise Linux platform. \
It provides a complete set of development and performance analysis tools \
that can be installed and used on multiple versions of Red Hat \
Enterprise Linux. Executables built with the Red Hat Developer Toolset \
toolchain can then also be deployed and run on multiple versions of \
Red Hat Enterprise Linux."

LABEL com.redhat.component="devtoolset-6-toolchain-container" \
      name="mystic/devtoolset-6-toolchain-centos6" \
      version="6" \
      summary="$SUMMARY" \
      description="$DESCRIPTION"

RUN yum install -y centos-release-scl-rh && \
    INSTALL_PKGS="devtoolset-6-toolchain automake autoconf cmake" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum -y clean all --enablerepo='*'

# Copy extra files to the image.
COPY ./root/ /

# Set environment variables
ENV MYUSER=mystic \
    HOME=/home/mystic \
    WORKDIR=/home/mystic/work \
    PATH=/home/mystic/work/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p ${WORKDIR} && \
    groupadd -g 1001 ${MYUSER} && \
    useradd -g 1001 -u 1001 ${MYUSER} && \
    chmod u+x /usr/bin/usage && \
    rpm-file-permissions

WORKDIR ${WORKDIR}

# Enable the SCL for all bash scripts.
ENV BASH_ENV=/opt/app-root/etc/scl_enable \
    ENV=/opt/app-root/etc/scl_enable \
    PROMPT_COMMAND=". /opt/app-root/etc/scl_enable"

# Set the default CMD to print the usage of the language image
ENTRYPOINT ["container-entrypoint"]
CMD ["usage"]
