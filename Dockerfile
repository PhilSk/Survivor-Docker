FROM ubuntu:18.04

RUN apt-get update

# Colors and italics for tmux
COPY xterm-256color-italic.terminfo /root
RUN tic /root/xterm-256color-italic.terminfo
ENV TERM=xterm-256color-italic

# Common packages
RUN apt-get update && apt-get install -y \
      curl \
      git  \
      tmux \
      wget \
      zsh 

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s /usr/bin/zsh

RUN curl https://raw.githubusercontent.com/PhilSk/Survivor-Docker/master/.tmux.conf -s -L -o - > /etc/tmux.conf

CMD ["tmux source /etc/tmux.conf"]
CMD ["zsh"]
