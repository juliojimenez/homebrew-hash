# Homebrew Tap for Hash Shell

This is the official [Homebrew](https://brew.sh/) tap for [hash shell](https://github.com/juliojimenez/hash).

## Installation

```bash
brew install juliojimenez/hash/hash-shell
```

Or tap first, then install:

```bash
brew tap juliojimenez/hash
brew install hash-shell
```

## Usage

After installation:

```bash
hash-shell
```

### Set as Default Shell

1. Add hash-shell to allowed shells:
   ```bash
   sudo bash -c 'echo "$(brew --prefix)/bin/hash-shell" >> /etc/shells'
   ```

2. Change your default shell:
   ```bash
   chsh -s $(brew --prefix)/bin/hash-shell
   ```

## Configuration

Create a `~/.hashrc` file for customization. See the [documentation](https://github.com/juliojimenez/hash/blob/main/docs/HASHRC.md) for details.

## Updating

```bash
brew update
brew upgrade hash-shell
```

## Uninstalling

```bash
brew uninstall hash-shell
brew untap juliojimenez/hash
```

## Links

- [Hash Shell Repository](https://github.com/juliojimenez/hash)
- [Documentation](https://github.com/juliojimenez/hash#see-also)
- [Releases](https://github.com/juliojimenez/hash/releases)
