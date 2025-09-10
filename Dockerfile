FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    texlive-latex-base texlive-xetex texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra \
    imagemagick ghostscript \
    && rm -rf /var/lib/apt/lists/*
# This is a little hacky but it will find the policy.xml and change it to read/write, by default linux distros have pdf support disabled
RUN sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/' /etc/ImageMagick-6/policy.xml

WORKDIR /app

COPY . /app

RUN chmod +x autoScreenshot.sh

CMD ["./autoScreenshot.sh"]
