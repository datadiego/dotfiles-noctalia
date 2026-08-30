# update
sudo dnf update -y

# utilidades
sudo dnf install pipx unzip xclip yq jq fzf stow eza tldr fastfetch micro stow btop brightnessctl fd curl wget -y

# alacritty
sudo dnf install -y alacritty

# starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Nerd fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -f -v

#tetro-tui
URL="https://github.com/Strophox/tetro-tui/releases/download/v3.1.0/tetro-tui_v3.1_x86_64-unknown-linux-gnu.zip"
TMP_DIR="$(mktemp -d)"
wget -q "$URL" -O "$TMP_DIR/tetro.zip"
unzip -q "$TMP_DIR/tetro.zip" -d "$TMP_DIR"
chmod +x "$TMP_DIR/tetro-tui"
sudo mv "$TMP_DIR/tetro-tui" /usr/local/bin/tetro-tui

rm -rf "$TMP_DIR"

# lsoff
curl -sL "$(curl -s https://api.github.com/repos/yutat23/lsoff/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4)" -o /tmp/lsoff
chmod +x /tmp/lsoff
sudo mv /tmp/lsoff /usr/local/bin/lsoff

# Codecs (RPM Fusion + ffmpeg completo para mkv, h264, hevc, etc)
sudo dnf install \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y

# try
sudo dnf install ruby -y
echo 'gem: -n ~/.local/bin' >>~/.gemrc
gem install try-cli --user-install
