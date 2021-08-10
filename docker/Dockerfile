FROM continuumio/miniconda3

RUN mkdir /proj
WORKDIR /proj

RUN conda init --all

RUN echo "conda activate base" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

COPY requirements/conda-minimal.yaml /proj
COPY requirements/requirements.txt /proj
COPY docker/build.sh /proj

CMD ["/bin/sh","-c","/proj/build.sh"]
