FROM holyshared/typesafety:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Noritaka Horio <holy.shared.design@gmail.com>"
ARG hack_user
ARG hack_group
ARG GITHUB_CREDENTIALS_TOKEN
RUN adduser --disabled-password --gecos "" ${hack_user} && passwd -l ${hack_user}
#RUN echo "${hack_user} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${hack_user}
#RUN chmod 440 /etc/sudoers.d/${hack_user} && \
  #chown root:root /etc/sudoers.d/${hack_user} && \
  #chown -R ${hack_user}:${hack_group} /home/${hack_user}
USER ${hack_user}
ENV HOME /home/${hack_user}
WORKDIR /home/${hack_user}
RUN mkdir project
WORKDIR project
ADD src src
ADD test test
ADD composer.json composer.json
ADD hh_autoload.json hh_autoload.json
ADD .hhconfig .hhconfig
RUN mkdir ${HOME}/.composer && \
  printf '{ "github-oauth": { "github.com": "%s" } }' $GITHUB_CREDENTIALS_TOKEN > ${HOME}/.composer/auth.json
RUN composer install --no-interaction
