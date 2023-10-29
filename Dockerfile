# Use the specified Rust version
FROM rust:1.70

# Install zsh and other necessary tools
RUN apt-get update && \
    apt-get install -y zsh curl git && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    chsh -s $(which zsh)

RUN cargo install diesel_cli --no-default-features --features postgres

# Copy your custom .zshrc file into the container
COPY .zshrc /root/.zshrc

# Run your project
CMD ["zsh"]
