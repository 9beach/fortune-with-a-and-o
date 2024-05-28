INST_PATH="/opt/homebrew/Cellar/fortune/9708/share/games/fortunes"

if ! [ -d "$INST_PATH" ]; then
	INST_PATH="/usr/local/Cellar/fortune/9708/share/games/fortunes"
fi

if ! [ -d "$INST_PATH" ]; then
	echo "Homebrew 'fortune' is not installed."
	exit 1
fi

cp -r off "$INST_PATH"
