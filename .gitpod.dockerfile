# Use a lightweight Linux image
FROM gitpod/workspace-full

# Re-synchronize the OS package index
RUN sudo apt-get update

# Install basic tools
RUN sudo apt-get install -y pdftk ghostscript imagemagick

# Change ImageMagick policy
RUN sudo sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-6/policy.xml

# Install Gnuplot
RUN sudo apt-get install -y gnuplot

# Install LaTeX
RUN sudo apt-get install -y texlive-full

# Install Neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz \
    && tar -xzf nvim-linux64.tar.gz \
    && mv nvim-linux64 $HOME/.local/bin \
    && ln -s $HOME/.local/bin/nvim-linux64/bin/nvim $HOME/.local/bin/nvim \
    && rm -rf nvim-linux64.tar.gz nvim-linux64

# Install Neovim extras
RUN sudo apt-get install -y ripgrep fd-find xclip

# Install z -jump around
RUN git clone https://github.com/rupa/z.git \
    && mv z/z.sh $HOME/.local/bin \
    && rm -rf z

# Alias
RUN echo "alias fd='fdfind'" >> ~/.bashrc
RUN echo "source $HOME/.local/bin/z.sh" >> ~/.bashrc

# Clone Neovim files
RUN git clone https://github.com/cirofabianbermudez/nvim.git /home/gitpod/.config/nvim

# Clen up unnecessary files
RUN sudo rm -rf /var/lib/apt/lists/*
