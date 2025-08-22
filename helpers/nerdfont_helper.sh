#!/usr/bin/env bash
# nerdfont_helper.sh - map programming languages to short names, long names, and NerdFont icons

# Nerd Font helper functions for Git-related icons
nf_branch() { echo ""; }           # Git branch
nf_git() { echo ""; }              # Git logo
nf_merge() { echo ""; }            # Git merge
nf_compare() { echo ""; }          # Git compare
nf_diff()   { echo ""; }           # Git diff
nf_commit() { echo ""; }           # Git commit
nf_stash() { echo ""; }            # Git stash
nf_github() { echo ""; }           # GitHub logo
nf_tag() { echo ""; }              # Tag icon

# Returns a NerdFont icon for Git-related elements
map_nf_icon() {
    local type="$1"
    case "$type" in
        branch) echo "" ;;        # branch
        commit) echo "" ;;        # commit
        remote) echo "" ;;        # remote
        dirty)  echo "" ;;        # uncommitted changes
        clean)  echo "" ;;        # clean working dir
        merge)  echo "" ;;        # merge
        github) echo "" ;;        # GitHub
        *)      echo "" ;;        # unknown
    esac
}

# Generic author glyph
map_nf_author() {
    # Use a single generic glyph for now
    echo ""   # user/person glyph
}

# Commit type glyph mapping
map_nf_commit() {
    local type="$1"
    case "$type" in
        feat)     echo "" ;;  # Feature
        fix)      echo "" ;;  # Bug fix
        docs)     echo "" ;;  # Documentation
        refactor) echo "" ;;  # Refactor
        *)        echo "" ;;  # Generic commit
    esac
}

# Language Formats and Icons

map_language_short() {
    local lang="$1"
    case "$lang" in
        Python)       echo ".py" ;;
        Shell)        echo ".sh" ;;
        JavaScript)   echo ".js" ;;
        TypeScript)   echo ".ts" ;;
        C++)          echo ".cpp" ;;
        C)            echo ".c" ;;
        Java)         echo ".java" ;;
        Go)           echo ".go" ;;
        Ruby)         echo ".rb" ;;
        PHP)          echo ".php" ;;
        HTML)         echo ".html" ;;
        CSS)          echo ".css" ;;
        Rust)         echo ".rs" ;;
        Kotlin)       echo ".kt" ;;
        Swift)        echo ".swift" ;;
        Markdown)     echo ".md" ;;
        *)            echo "$lang" ;;
    esac
}

map_language_icon() {
    local lang="$1"
    case "$lang" in
        Python)       echo "" ;; # nf-dev-python
        Shell)        echo "" ;; # nf-dev-terminal
        JavaScript)   echo "" ;; # nf-dev-javascript
        TypeScript)   echo "" ;; # nf-dev-typescript
        C++)          echo "" ;; # nf-dev-cpp
        C)            echo "" ;; # nf-dev-c
        Java)         echo "" ;; # nf-dev-java
        Go)           echo "" ;; # nf-dev-go
        Ruby)         echo "" ;; # nf-dev-ruby
        PHP)          echo "" ;; # nf-dev-php
        HTML)         echo "" ;; # nf-dev-html
        CSS)          echo "" ;; # nf-dev-css
        Rust)         echo "" ;; # nf-dev-rust
        Kotlin)       echo "" ;; # nf-dev-kotlin
        Swift)        echo "" ;; # nf-dev-swift
        Markdown)     echo "" ;; # nf-dev-markdown
        *)            echo "" ;; # default: Python icon
    esac
}

primary_language() {
    # Accepts GitHub languages JSON
    local langjson="$1"
    local format="${2:-short}" # default: short

    local primary
    if [[ "$langjson" == "{}" ]]; then
        primary="none"
    else
        primary=$(echo "$langjson" | jq -r 'to_entries | max_by(.value) | .key')
    fi

    case "$format" in
        short) echo "$(map_language_short "$primary")" ;;
        long)  echo "$primary" ;;
        icon)  echo "$(map_language_icon "$primary")" ;;
        *)     echo "$primary" ;;
    esac
}

