FROM debian:testing

ENV HOME /root
RUN apt-get update && apt-get upgrade
RUN apt-get install -y zsh git tmux

################## BEGIN INSTALLATION ######################
RUN git clone git://github.com/bwithem/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh
RUN sed -i -E "s/^plugins=\((.*)\)$/plugins=(\1 tmux)/" ~/.zshrc
WORKDIR /root

RUN echo "set -g prefix C-a; bind C-a send-prefix; unbind C-b; bind - split-window -h \; split-window -h \; select-pane -t 0 \;  split-window -h \; select-pane -t 3 \;  split-window -v \; select-pane -t 2 \; split-window -v \; select-pane -t 1 \; split-window -v \; select-pane -t 0 \; split-window -v \; select-pane -t 0 \; ; bind = setw synchronize-panes" > .tmux.conf

CMD ["tmux source .tmux.conf"]
CMD ["zsh"]