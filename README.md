# Homebrew Tap for Glance

This tap contains the Homebrew Cask for [Glance](https://github.com/TristanLaR/glance), a minimal markdown viewer.

## Installation

```bash
brew tap TristanLaR/tap
brew install --cask glance
```

## Usage

After installation, you can open markdown files with:

```bash
open -a Glance file.md
```

Or add to your shell config for quick access:

```bash
alias glance='open -a Glance'
```

Then use:

```bash
glance README.md
```
