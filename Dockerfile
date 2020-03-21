FROM centos
RUN yum install nano -y
WORKDIR /code_directory
CMD ["/bin/bash"]
