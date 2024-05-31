if [ "$(uname -m)" = "x86_64" ]; then
  alias obsidian="obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
fi
alias learn="open 'obsidian://open?vault=LearningMaterial'"
alias note="open 'obsidian://open?vault=notebooks'"
alias diary="open 'obsidian://open?vault=diary'; cd /Users/aromia/diary-git"
alias obsDev="open 'obsidian://open?vault=Dev_Notebook'"
