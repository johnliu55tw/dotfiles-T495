#!/bin/sh
SCRIPT_NAME='customize_keymap.sh'

KEY_MAPS=(
    '    key <AC06> { [ h, H, Left   ] };'
    '    key <AC07> { [ j, J, Down   ] };'
    '    key <AC08> { [ k, K, Up     ] };'
    '    key <AC09> { [ l, L, Right  ] };'
    '    key <AD06> { [ y, Y, Home   ] };'
    '    key <AB06> { [ n, N, End    ] };'
    '    key <BKSL> { [ backslash, bar, Delete ] };'
)

update_map()
{
    for MAP_STR in "${KEY_MAPS[@]}"; do
        KEY_CODE=$(echo $MAP_STR | sed -n -r 's/key <(.*?)>.*/\1/p')

        sed -i -r "0,/.*$KEY_CODE.*/s//$MAP_STR/" $1
    done
}

print_help()
{
    printf -- "Usage: $SCRIPT_NAME <layout file>\n"
}

main()
{
    if [ $# -eq 0 ]; then
        print_help
        exit 0
    fi

    SYMBOL_FILE=$1
    printf "Update symbol file: $SYMBOL_FILE\n" 

    BACKUP="$SYMBOL_FILE.bak"
    printf "Backup %s to %s\n" $SYMBOL_FILE $BACKUP
    cp -f $SYMBOL_FILE $BACKUP

    update_map $SYMBOL_FILE
}

main $*
