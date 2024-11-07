default:
    just --list

version := "2.6.9"
# version := "2.8.2"

download-enchant:
    [ -f enchant.h ] || wget https://github.com/AbiWord/enchant/archive/refs/tags/v{{ version }}.tar.gz -O enchant-{{ version }}.tar.gz
    [ -f enchant.h ] || tar -xvf enchant-{{ version }}.tar.gz
    # cp enchant-{{ version }}/lib/enchant.h .
    [ -f enchant.h ] || cp enchant-{{ version }}/src/enchant.h .

build: download-enchant
    emacs -Q --batch \
        --eval '(add-to-list '\''load-path ".")' \
        --eval '(require '\''jinx)' \
        --eval '(jinx--load-module)'
