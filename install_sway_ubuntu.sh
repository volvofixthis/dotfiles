#!/usr/bin/env bash

set -Eeuo pipefail

if [[ ${EUID} -eq 0 ]]; then
  printf 'Run this script as your normal user; it will use sudo for apt.\n' >&2
  exit 1
fi

if [[ ! -r /etc/os-release ]]; then
  printf 'Cannot identify this operating system (missing /etc/os-release).\n' >&2
  exit 1
fi

# shellcheck source=/etc/os-release
source /etc/os-release
if [[ ${ID:-} != ubuntu ]]; then
  printf 'This installer targets Ubuntu (detected: %s).\n' "${PRETTY_NAME:-unknown OS}" >&2
  exit 1
fi

if ! command -v sudo >/dev/null 2>&1; then
  printf 'sudo is required to install Ubuntu packages.\n' >&2
  exit 1
fi

SCRIPT_DIR=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")

# Packages used by the Sway/Waybar configuration and its common scripts.
APT_PACKAGES=(
  golang cargo
  stow
  sway swaybg swayidle swaylock waybar
  kitty thunar thunar-archive-plugin file-roller thunar-volman
  gvfs gvfs-backends udisks2 tumbler tumbler-plugins-extra ffmpegthumbnailer
  rofi xwayland mako-notifier
  wl-clipboard grim slurp
  brightnessctl playerctl
  jq curl imagemagick
  network-manager-gnome blueman lxsession
  xdg-utils xdg-user-dirs libnotify-bin
  libglib2.0-bin gsettings-desktop-schemas
  papirus-icon-theme
  fonts-dejavu-core fonts-firacode fonts-font-awesome fonts-hack-ttf fonts-noto-color-emoji
  btop cava mpv gnome-system-monitor lm-sensors pulseaudio-utils pipewire-bin
)

# These are used by some scripts/config variants, but are not packaged in every
# Ubuntu release or enabled repository. Install them when Ubuntu offers them.
OPTIONAL_APT_PACKAGES=(
  clipman sway-notification-center swww wallust wlogout nwg-look wl-kbptr
  swappy pamixer
)
available_optional=()
missing_optional=()

sudo apt-get update
if ! command -v add-apt-repository >/dev/null 2>&1; then
  sudo apt-get install -y software-properties-common
fi
sudo add-apt-repository -y universe
sudo apt-get update
sudo apt-get install -y --no-install-recommends "${APT_PACKAGES[@]}"

for package in "${OPTIONAL_APT_PACKAGES[@]}"; do
  if apt-cache show "$package" 2>/dev/null | grep -q '^Package:'; then
    available_optional+=("$package")
  else
    missing_optional+=("$package")
  fi
done

if ((${#available_optional[@]})); then
  sudo apt-get install -y --no-install-recommends "${available_optional[@]}"
fi

cd "$SCRIPT_DIR"
stow --dir="$SCRIPT_DIR" --target="$HOME" --restow sway

printf '\nSway dependencies installed and the sway/Waybar configs stowed.\n'

if ((${#missing_optional[@]})); then
  printf 'Not available from the enabled Ubuntu apt repositories: %s\n' "${missing_optional[*]}"
fi

printf '%s\n' \
  'The config also refers to custom commands (for example telegram-asahi) and' \
  'Hyprland-only commands/paths (hyprctl and ~/.config/hypr). Those need their' \
  'own installation or Sway-specific replacements.'
