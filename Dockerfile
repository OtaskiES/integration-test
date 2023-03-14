# Let's use the image base-notebook to build our image on top of it
FROM jupyterhub/the-littlest-jupyterhub

RUN git clone https://github.com/jupyterhub/the-littlest-jupyterhub.git

RUN docker build -t tljh-systemd . -f integration-tests/Dockerfile
