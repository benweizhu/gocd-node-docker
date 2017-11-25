FROM gocd/gocd-agent-ubuntu-16.04:v17.11.0

USER go
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

USER root
RUN /bin/bash -c "echo \"[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh\" >> /etc/profile.d/npm.sh"

USER go
RUN /bin/bash -c "source $HOME/.nvm/nvm.sh && nvm install v6.10.0"
RUN echo "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh" >> $HOME/.bashrc
ENV PATH $HOME/.nvm/bin:$PATH

USER root