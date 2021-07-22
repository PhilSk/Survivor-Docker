FROM nvcr.io/nvidia/pytorch:21.03-py3

RUN apt-get update

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
