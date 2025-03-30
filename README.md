# Dotfiles

This repository contains configuration files for various tools and environments. To set up these configurations on your system, follow the instructions below.

## Setup

To apply the configurations using GNU Stow, run the following commands:

1. **Stow Zsh, Bash, and Aerospace configurations:**

   ```bash
   stow zsh bash aerospace
   ```

   This will create symlinks for the Zsh, Bash, and Aerospace configuration files in their respective locations.

2. **Stow Configurations for Applications:**

   ```bash
   stow -t ~/.config config
   ```

   This will create symlinks for application configurations under `~/.config`.

## Notes

- Make sure you have [GNU Stow](https://www.gnu.org/software/stow/) installed on your system.
- Before running the stow commands, ensure that there are no existing configurations or symlinks that might be overwritten.

## License

This repository is licensed under the [MIT License](LICENSE).

## Contact

For questions or issues, please contact [ozan.ztuerk@gmail.com](mailto:ozan.ztuerk@gmail.com).
