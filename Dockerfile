FROM centos
RUN yum install git -y
WORKDIR ["/code_directory"]
RUN ["git", "clone", "https://github.com/alexanderdum/tmp.git", "."]
CMD ["/bin/bash"]
