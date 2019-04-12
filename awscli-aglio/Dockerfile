FROM circleci/python:3.6.1

RUN sudo pip install awscli \
 && cd ~/ \
 && wget https://nodejs.org/dist/latest-v0.12.x/node-v0.12.18-linux-x64.tar.xz \
 && tar xf node* \
 && mv node-v0.12.18-linux-x64 node \
 && rm *.xz \
 && export PATH=$PWD/node/bin:$PATH \
 && npm install -g aglio@2.3.0 \
 && npm install -g aglio-theme-onlicar \
 && echo 'export PATH=$HOME/node/bin:$PATH' > ~/.bashrc

ENV PATH /home/circleci/node/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/bash"]
