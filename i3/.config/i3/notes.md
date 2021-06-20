# Install missing packages:
dnf install $(cat requirements.txt)

# Fix speaker + headphones:
- alsamixer
- F6: Select sound card
- Disable Auto-mute