#!/bin/bash
# For LS_COLORS, print type and description in the relevant color.

IFS=:
for ls_color in $LS_COLORS; do
    color="${ls_color#*=}"
    type="${ls_color%=*}"

    # Add descriptions for named types.
    case "$type" in
    bd) desc="block device" ;;
    ca) desc="file with capability" ;;
    cd) desc="character device" ;;
    di) desc="directory" ;;
    do) desc="door" ;;
    ex) desc="executable file" ;;
    fi) desc="regular file" ;;
    ln) desc="symbolic link" ;;
    mh) desc="multi-hardlink" ;;
    mi) desc="missing file" ;;
    no) desc="normal non-filename text" ;;
    or) desc="orphan symlink" ;;
    ow) desc="other-writable directory" ;;
    pi) desc="named pipe, AKA FIFO" ;;
    rs) desc="reset to no color" ;;
    sg) desc="set-group-ID" ;;
    so) desc="socket" ;;
    st) desc="sticky directory" ;;
    su) desc="set-user-ID" ;;
    tw) desc="sticky and other-writable directory" ;;
    *)  desc="" ;;
    esac

    # Separate each color with a newline.
    if [[ $color_prev ]] && [[ $color != $color_prev ]]; then
        echo
    fi

    printf "\e[%sm%s%s\e[m " "$color" "$type" "${desc:+ ($desc)}"

    # For next loop
    color_prev="$color"
done
echo