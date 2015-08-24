FROM bradrydzewski/base

WORKDIR /home/ubuntu
USER ubuntu
ADD rbenv.sh /etc/drone.d/

RUN sudo apt-get install -y python-pip
RUN sudo pip install awscli

RUN export PATH=$PATH:/home/ubuntu/.rbenv/bin                                         && \
    cd ~/.rbenv/plugins/ruby-build                                                    && \
    git pull                                                                          && \
    export RBENV_VERSION=2.1.5                                                        && \
    eval "$(rbenv init -)"                                                            && \
    CC=gcc rbenv install 2.1.5                                                        && \
    rbenv rehash                                                                      && \
    rbenv global 2.1.5                                                                && \
    rbenv rehash                                                                      && \
    gem install bundler                                                               && \
    rbenv rehash

