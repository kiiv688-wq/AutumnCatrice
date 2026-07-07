# 🍂 AutumnCatrice | Hyprland Dotfiles

> A minimalist, functional Hyprland setup inspired by autumn aesthetics and feline comfort.  
> Built with Lua modules, optimized for heavy dev/gaming workflows.

![Preview](screenshots/2.avif)

*📸 More screenshots in the `/screenshots` folder*

---

## ✨ Features

- 🧩 **Modular Lua config** for Hyprland — easy to maintain and extend
- 🎨 **Cohesive visual design** — Orchis-Dark + Tela-Yellow + custom gradients
- ⚡ **Productivity-focused** — keybinds for everything, cliphist, hyprpicker, hyprshot
- 🎮 **Gaming-ready** — `allow_tearing = true`, low-latency setup, PrismLauncher integration
- 🖥️ **Full boot-to-desktop theme** — GRUB (poly-dark) → SDDM (mono-code) → Hyprland
- 🧠 **Battle-tested** — stable under heavy loads (120+ GB RAM usage for Java workloads)

---

## 📦 Components

| Component | Purpose | Config Location |
|-----------|---------|----------------|
| **Hyprland** | Tiling Wayland compositor | `hypr/` (Lua modules) |
| **Waybar** | Status bar with custom modules | `waybar/` |
| **Wofi** | App launcher (drun mode) | `wofi/` |
| **Dunst** | Notification daemon | `dunst/` |
| **Hyprlock** | Lock screen with clock + avatar | `hyprlock.conf` |
| **Hyprpaper** | Wallpaper manager | `hyprpaper.conf` |
| **Kvantum + qt5ct/qt6ct** | Qt app theming | `Kvantum/`, `qt5ct/`, `qt6ct/` |
| **nwg-look** | GTK theme selector | `nwg-look/` |

**External themes:**
- **GRUB:** [poly-dark](https://github.com/shvchk/poly-dark)
- **SDDM:** [mono-code](https://github.com/Mono-Code-Scheme/sddm)

---

## 🚀 Quick Install

### Prerequisites
- Arch Linux (or Arch-based distro)
- `git`, `wget`, `pacman`, AUR helper (`yay` or `paru`)

### 1. Clone the repository
```bash
git clone https://github.com/kiiv688-wq/AutumnCatrice.git ~/AutumnCatrice
cd ~/AutumnCatrice
```

### 2. Backup existing configs (optional but recommended)
```bash
mkdir -p ~/.config/backup_$(date +%Y%m%d)
for dir in dunst hypr Kvantum nwg-look qt5ct qt6ct waybar wofi; do
    [ -d ~/.config/$dir ] && mv ~/.config/$dir ~/.config/backup_$(date +%Y%m%d)/
done
```

### 3. Create symlinks
```bash
# Core Hyprland setup
ln -sf ~/AutumnCatrice/hypr ~/.config/hypr

# UI components
ln -sf ~/AutumnCatrice/dunst ~/.config/dunst
ln -sf ~/AutumnCatrice/waybar ~/.config/waybar
ln -sf ~/AutumnCatrice/wofi ~/.config/wofi

# Qt/KDE theming
ln -sf ~/AutumnCatrice/Kvantum ~/.config/Kvantum
ln -sf ~/AutumnCatrice/qt5ct ~/.config/qt5ct
ln -sf ~/AutumnCatrice/qt6ct ~/.config/qt6ct
ln -sf ~/AutumnCatrice/nwg-look ~/.config/nwg-look
```

### 4. Install external themes (GRUB + SDDM)
```bash
# GRUB: poly-dark
wget -O- https://github.com/shvchk/poly-dark/raw/master/install.sh | bash -s -- --lang English
sudo grub-mkconfig -o /boot/grub/grub.cfg

# SDDM: mono-code
sudo pacman -S qt5-quickcontrols2
git clone https://github.com/Mono-Code-Scheme/sddm ~/temp-sddm
cd ~/temp-sddm && python install.py
echo -e "[Theme]\nCurrent=monocode" | sudo tee /etc/sddm.conf
rm -rf ~/temp-sddm
```

### 5. Install required fonts
```bash
# Official repository
sudo pacman -S ttf-fira-code noto-fonts ttf-dejavu

# AUR packages (use yay/paru)
yay -S ttf-caskaydia-cove-nerd ttf-font-awesome-6 ttf-jetbrains-mono-nerd inter-font ttf-bebas-neue

# Update font cache
fc-cache -fv
```

### 6. Install required packages
```bash
# Core
sudo pacman -S hyprland waybar wofi dunst hyprpaper hyprlock hyprshot hyprpicker cliphist orchis-theme

# Utilities
sudo pacman -S kitty thunar pavucontrol wpctl brightnessctl playerctl

# Qt/GTK theming
sudo pacman -S kvantum qt5ct qt6ct nwg-look kvantum-qt5

# AUR (optional but recommended)
yay -S tela-icon-theme kvantum-theme-orchis-git
```

### 7. Reboot or restart session
```bash
# For Hyprland: just reload
hyprctl reload

# For full theme application: logout/login or reboot
```

---

## ⚙️ What to Customize

| File | What to edit | Why |
|------|-------------|-----|
| `hypr/modules/monitors.lua` | `output`, `mode`, `position` | Match your display(s) |
| `hypr/modules/env.lua` | NVIDIA/VA-API vars | Adjust for your GPU |
| `hypr/modules/autostart.lua` | Startup apps | Add/remove daemons |
| `hypr/modules/input.lua` | `kb_layout`, `device` name | Match your keyboard/mouse |
| `hyprlock.conf` | Wallpaper path, user info | Personalize lock screen |
| `hyprpaper.conf` | Wallpaper path | Set your background |
| `waybar/config.jsonc` | `hwmon-path` for temperature, unused modules | Adapt to your hardware |
| `dunst/dunstrc` | Font family | If you prefer different fonts |
| `wofi/style.css` | Colors, sizing | Tweak launcher appearance |

---

## 🔤 Fonts Reference

| Font | Used in | Install command |
|------|---------|----------------|
| `CaskaydiaCove Nerd Font` | Waybar icons | `yay -S ttf-caskaydia-cove-nerd` |
| `Font Awesome 6 Free` | Waybar icons | `yay -S ttf-font-awesome-6` |
| `JetBrains Mono Nerd` | Wofi, terminal | `yay -S ttf-jetbrains-mono-nerd` |
| `Inter` | Dunst notifications | `yay -S inter-font` |
| `Bebas Neue Regular` | Hyprlock clock | `yay -S ttf-bebas-neue` |
| `Fira Code Regular` | Hyprlock username | `sudo pacman -S ttf-fira-code` |
| `Noto Sans` | Fallback | `sudo pacman -S noto-fonts` ✅ |
| `DejaVu` | Fallback | `sudo pacman -S ttf-dejavu` ✅ |

**Verify installation:**
```bash
fc-list | grep -iE "caskaydia|jetbrains|inter|bebas|fontawesome"
```

---

## 🧪 Verification Script

Run `./verify-install.sh` to check your setup:

```bash
#!/bin/bash
echo "🔍 Checking symlinks..."
for dir in hypr dunst waybar wofi Kvantum qt5ct qt6ct nwg-look; do
    [ -L ~/.config/$dir ] && echo "✅ ~/.config/$dir" || echo "❌ ~/.config/$dir MISSING"
done

echo -e "\n🔍 Checking fonts..."
for font in "CaskaydiaCove" "JetBrains Mono" "Inter" "Bebas Neue" "Font Awesome"; do
    fc-list | grep -qi "$font" && echo "✅ $font" || echo "❌ $font MISSING"
done

echo -e "\n🔍 Checking key binaries..."
for bin in hyprland waybar wofi dunst hyprpaper hyprlock; do
    command -v $bin &>/dev/null && echo "✅ $bin" || echo "❌ $bin NOT INSTALLED"
done

echo -e "\n✨ Done! If you see ❌, install missing components before restarting."
```

---

## ❓ Troubleshooting

### Waybar shows "□□□" instead of icons
→ Missing Nerd Font. Install `ttf-caskaydia-cove-nerd` and run `fc-cache -fv`.

### Qt apps don't follow GTK theme
→ Ensure `Kvantum`, `qt5ct`, `qt6ct` are symlinked and set `QT_QPA_PLATFORMTHEME=qt6ct` in `env.lua`.

### SDDM shows default theme after install
→ Check `/etc/sddm.conf` contains:
```ini
[Theme]
Current=monocode
```
→ Test with: `sddm --test-mode --theme /usr/share/sddm/themes/monocode`

### GRUB theme not applied
→ Run `sudo grub-mkconfig -o /boot/grub/grub.cfg` after installing poly-dark.

### Hyprland won't start / Lua errors
→ Check syntax: `luac -p ~/.config/hypr/hyprland.lua`
→ View logs: `journalctl -b 0 | grep -i hypr`

### Temperature module shows "N/A" in Waybar
→ Find correct `hwmon` path:
```bash
ls /sys/class/hwmon/hwmon*/temp1_input
```
→ Update `waybar/config.jsonc` with the correct path.

---

## 🎨 Design Philosophy

- **Minimalism first**: No visual noise, every element has a purpose
- **Consistency**: Same color palette (`#2C2C2C` base, `#959596` accent) across all components
- **Functionality over flair**: Keybinds for everything, no mouse required for common tasks
- **Iterative refinement**: This setup evolved over months of daily use — not a "rice for screenshots"

## 🖼️ Gallery

| Desktop | Fastfetch + btop | Lock Screen |
|---------|-----------------|-------------|
| ![Desktop](screenshots/2.avif) | ![System](screenshots/3.avif) | ![Lock](screenshots/4.avif) |

| GRUB | SDDM | Wofi |
|------|------|------|
| ![GRUB](screenshots/5.avif) | ![SDDM](screenshots/6.avif) | ![Wofi](screenshots/7.avif) |

*Note: GRUB/SDDM screenshots are phone photos; others are direct `hyprshot` captures.*

---

## 💬 About the 115 GB Java RAM Usage

Yes, that's intentional! 🌋

```text
Me: *types `//replace lava 0` in a 12-billion-block Minecraft world*
Java: "I will now consume all available memory, thank you"
```

This screenshot shows a real WorldEdit. Linux + Hyprland handled the load without stuttering, and RAM freed back to normal after completion.

**Not a leak — just ambitious terraforming.** 😎