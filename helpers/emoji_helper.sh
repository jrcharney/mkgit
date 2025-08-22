#!/usr/bin/env bash
# emoji_helper.sh - helper functions for consistent emoji usage with UTF-8 detection

# Ensure the script is only sourced once
if [[ -n "${EMOJI_HELPER_LOADED}" ]]; then
    return
fi
EMOJI_HELPER_LOADED=true

# Detect UTF-8 support
if [[ "$LANG" =~ UTF-8 ]]; then
    EMOJIS_SUPPORTED=true
else
    EMOJIS_SUPPORTED=false
fi

# Emoji variables
EMOJI_SUCCESS="✅"
EMOJI_WARNING="⚠️"
EMOJI_ERROR="❌"
EMOJI_INFO="ℹ️"
EMOJI_BRANCH="🌿"
EMOJI_GITHUB="🐙"
EMOJI_FOLDER="📁"
EMOJI_FILE="📄"

# Functions (only output emojis if supported)
emoji_success() { [[ "$EMOJIS_SUPPORTED" == true ]] && echo -e "$EMOJI_SUCCESS $*" || echo "$*"; }
emoji_warning() { [[ "$EMOJIS_SUPPORTED" == true ]] && echo -e "$EMOJI_WARNING $*" || echo "$*"; }
emoji_error()   { [[ "$EMOJIS_SUPPORTED" == true ]] && echo -e "$EMOJI_ERROR $*" || echo "$*"; }
emoji_info()    { [[ "$EMOJIS_SUPPORTED" == true ]] && echo -e "$EMOJI_INFO $*" || echo "$*"; }
emoji_branch()  { [[ "$EMOJIS_SUPPORTED" == true ]] && echo -e "$EMOJI_BRANCH $*" || echo "$*"; }
emoji_github()  { [[ "$EMOJIS_SUPPORTED" == true ]] && echo -e "$EMOJI_GITHUB $*" || echo "$*"; }
emoji_folder()  { [[ "$EMOJIS_SUPPORTED" == true ]] && echo -e "$EMOJI_FOLDER $*" || echo "$*"; }
emoji_file()    { [[ "$EMOJIS_SUPPORTED" == true ]] && echo -e "$EMOJI_FILE $*" || echo "$*"; }

