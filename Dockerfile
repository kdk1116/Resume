FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    texlive-latex-base texlive-xetex texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra \
    imagemagick ghostscript \
    && rm -rf /var/lib/apt/lists/*

# Configure ImageMagick to allow PDF handling
RUN sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/' /etc/ImageMagick-6/policy.xml

WORKDIR /app

COPY . /app

RUN chmod +x autoScreenshot.sh

CMD ["./autoScreenshot.sh"]
