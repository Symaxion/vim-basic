FROM debian

RUN ln -sv .vim/vimrc ~/.vimrc && \
    apt-get update && \
    apt-get install -y vim git

VOLUME /root/.vim

CMD ["vim"]
