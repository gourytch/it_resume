FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=nointeractive

RUN apt-get update && \
    apt-get install -y \
        make \
        texlive-latex-recommended \
        texlive-fonts-recommended \
        texlive-lang-cyrillic \
        ghostscript
