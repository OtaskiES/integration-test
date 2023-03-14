# Let's use the image base-notebook to build our image on top of it

FROM jupyterhub/the-littlest-jupyterhub

COPY ./Dockerfile

RUN apt-get update \
    && echo "Updated apt-get" \
    && apt-get install -y git \
    && echo "Installed git"

RUN git clone https://github.com/jupyterhub/the-littlest-jupyterhub.git

RUN make ./Dockerfile  

CMD docker build -t tljh-systemd . -f integration-tests/Dockerfile
