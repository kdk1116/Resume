# Use an official lightweight Linux image
FROM ubuntu:20.04

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install required tools and libraries
RUN apt-get update && apt-get install -y \
    texlive-latex-base texlive-xetex texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra \
    imagemagick ghostscript \
    && rm -rf /var/lib/apt/lists/*

# Configure ImageMagick to allow PDF handling
RUN sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/' /etc/ImageMagick-6/policy.xml

# Set the working directory
WORKDIR /app

# Copy LaTeX and script files into the container
COPY . /app

# Ensure the script is executable
RUN chmod +x autoScreenshot.sh

# Run the script
CMD ["./autoScreenshot.sh"]
