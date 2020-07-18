FROM debian

RUN ln -sv .vim/vimrc ~/.vimrc && \
    apt-get update && \
    apt-get install -y vim

VOLUME /root/.vim

CMD ["vim"]
