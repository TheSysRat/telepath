#!/bin/bash

# Function to weclome

welcome() {
    echo ''
    echo ''
    echo -e "\e[38;5;118m████████╗███████╗██╗     ███████╗██████╗  █████╗ ████████╗██╗  ██╗"
    echo -e "\e[38;5;119m╚══██╔══╝██╔════╝██║     ██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║  ██║"
    echo -e "\e[38;5;120m   ██║   █████╗  ██║     █████╗  ██████╔╝███████║   ██║   ███████║"
    echo -e "\e[38;5;154m   ██║   ██╔══╝  ██║     ██╔══╝  ██╔═══╝ ██╔══██║   ██║   ██╔══██║"
    echo -e "\e[38;5;118m   ██║   ███████╗███████╗███████╗██║     ██║  ██║   ██║   ██║  ██║" 
    echo -e "\e[38;5;119m   ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝"
    echo ''
    echo -e "\e[38;5;196m            _                                                  _ \e[0m"
    echo -e "\e[38;5;202m __ _  _ __| |_ ___ _ __    _ __  __ _ _______ __ _____ _ _ __| |\e[0m"
    echo -e "\e[38;5;226m/ _| || (_-<  _/ _ \ '  \  | '_ \/ _\` (_-<_-< V  V / _ \ '_/ _\` |\e[0m"
    echo -e "\e[38;5;46m\__|\_,_/__/\__\___/_|_|_| | .__/\__,_/__/__/\_/\_/\___/_| \__,_|\e[0m"
    echo -e "\e[38;5;21m                           |_|                                   \e[0m"
    echo -e "\e[38;5;93m __ _ ___ _ _  ___ _ _ __ _| |_ ___ _ _                          \e[0m"
    echo -e "\e[38;5;201m/ _\` / -_) ' \/ -_) '_/ _\` |  _/ _ \ '_|                         \e[0m"
    echo -e "\e[38;5;196m\__, \___|_||_\___|_| \__,_|\__\___/_|                           \e[0m"
    echo -e "\e[38;5;202m|___/                                                            \e[0m"
    echo  ''
    echo -e "\e[90m                                              created by \e[31mThe\e[93mSys\e[31mRAT\e[0m"
    echo ''
    echo ''
}

# Function to display usage small information

usage_little() {
    echo ''
    echo "Usage: $0 -i <input_file> [-b <begin_string>] [-e <end_string>] -o <output_file> [-l] [-u] [-s <special_operations>] [-p <settings_file>] [-h]"
    echo ''
}

# Function to display help

usage() {
    echo "Usage: $0 -i <input_file> [-b <begin_string>] [-e <end_string>] -o <output_file> [-l] [-u] [-s <special_operations>] [-p <settings_file>] [-h]"
    echo "Options:"
    echo "  -i <input_file>            Specify the input file."
    echo "  -b <begin_string>          String to prepend to each line."
    echo "  -e <end_string>            String to append to each line."
    echo "  -o <output_file>           Specify the output file."
    echo "  -l                         Convert lines to lowercase."
    echo "  -u                         Convert lines to uppercase."
    echo "  -s <special_operations>    Perform special operations:"
    echo "                               1: Change 'a' to '@' and 'A' to '@'"
    echo "                               2: Change 'e' to '3' and 'E' to '3'"
    echo "                               3: Change 'i' to '1' and 'I' to '1'"
    echo "                               4: Change 'i' to '!' and 'I' to '!'"
    echo "                               5: Change 'o' to '0' and 'O' to '0'"
    echo "                               6: Change 's' to '5' and 'S' to '5'"
    echo "                               7: Change 'c' to '(' and 'C' to '('"
    echo "                               8: Change 'b' to '8' and 'B' to '8'"
    echo "                               9: Change 'a' to '4' and 'A' to '4'"
    echo "                               0: Change 'l' to '1' and 'L' to '1'"
    echo "  -p <settings_file>         Batch processing using settings file."
    echo "  -h                         Display this help message."
    exit 1
}

# Initialize arguments

begin_string=""
end_string=""
input_file=""
output_file=""
lowercase=false
uppercase=false
special_operations=""
settings_file=""

# Special operations mapping 

special_ops_map=(
    "a@"
    "e3"
    "i1"
    "i!"
    "o0"
    "s5"
    "c("
    "b8"
    "a4"
    "l1"
)

clear
welcome
sleep 1

# Parse arguments

while getopts ":i:b:e:o:lus:p:h" opt; do
    case $opt in
        i) input_file="$OPTARG" ;;
        b) begin_string="$OPTARG" ;;
        e) end_string="$OPTARG" ;;
        o) output_file="$OPTARG" ;;
        l) lowercase=true ;;
        u) uppercase=true ;;
        s) special_operations="$OPTARG" ;;
        p) settings_file="$OPTARG" ;;
        h) usage ;;
        *) usage ;;
    esac
done

# Ensure required arguments are provided

if [ -z "$input_file" ] || [ -z "$output_file" ]; then
    usage_little
fi

# Check if the input file exists

if [ ! -f "$input_file" ]; then
    echo "Input file does not exist. For more information use ./telepath.sh -h"
    exit 1
fi

# Function to apply special operations

apply_special_operations() {
    local line="$1"
    for (( i=0; i<${#special_operations}; i++ )); do
        case ${special_operations:i:1} in
            1) line="${line//a/@}"; line="${line//A/@}" ;;
            2) line="${line//e/3}"; line="${line//E/3}" ;;
            3) line="${line//i/1}"; line="${line//I/1}" ;;
            4) line="${line//i/!}"; line="${line//I/!}" ;;
            5) line="${line//o/0}"; line="${line//O/0}" ;;
            6) line="${line//s/5}"; line="${line//S/5}" ;;
            7) line="${line//c/(}"; line="${line//C/(}" ;;
            8) line="${line//b/8}"; line="${line//B/8}" ;;
            9) line="${line//a/4}"; line="${line//A/4}" ;;
            0) line="${line//l/1}"; line="${line//L/1}" ;;
        esac
    done
    echo "$line"
}

# Function to process single lines based on options

process_lines() {
    local input="$1"
    local output="$2"
    local b_string="$3"
    local e_string="$4"
    local l_case="$5"
    local u_case="$6"
    local s_operations="$7"
    local total_lines=$(wc -l < "$input")
    local current_line=0

    while IFS= read -r line; do
        current_line=$((current_line + 1))
        progress_bar $current_line $total_lines

        if $l_case; then
            line=$(echo "$line" | tr '[:upper:]' '[:lower:]')
        elif $u_case; then
            line=$(echo "$line" | tr '[:lower:]' '[:upper:]')
        fi
        if [ -n "$s_operations" ]; then
            special_operations="$s_operations"
            line=$(apply_special_operations "$line")
        fi
        echo "${b_string}${line}${e_string}" >> "$output"
    done < "$input"
}

# Progress bar function

progress_bar() {
    local current=$1
    local total=$2
    local percent=$((current * 100 / total))
    local completed=$((percent / 2))
    local remaining=$((50 - completed))
    
    # Set text color to yellow
    printf "\033[1;33m\r["

    # Print progress bar
    for ((i=0; i<completed; i++)); do printf "#"; done
    for ((i=0; i<remaining; i++)); do printf "."; done

    # Print completion percentage and counts in yellow
    printf "]\033[1;33m %d%% (%d/%d)\033[0m" $percent $current $total
}

# Tempate file batch processing function

batch_processing() {
    local settings="$1"
    local input="$2"
    local output="$3"
    local total_settings_lines=$(wc -l < "$settings")
    local current_setting=0

    while IFS= read -r options; do
        current_setting=$((current_setting + 1))
        echo -e "\033[1;90m\nProcessing settings line $current_setting of $total_settings_lines: $options\033[0m"
        progress_bar $current_setting $total_settings_lines

        local b_string=""
        local e_string=""
        local l_case=false
        local u_case=false
        local s_operations=""

        # Parse options from the settings file line
        for option in $options; do
            key=${option%%=*}
            value=${option#*=}
            case $key in
                b) b_string="$value" ;;
                e) e_string="$value" ;;
                l) l_case=true ;;
                u) u_case=true ;;
                s) s_operations="$value" ;;
            esac
        done

        process_lines "$input" "$output" "$b_string" "$e_string" "$l_case" "$u_case" "$s_operations"
    done < "$settings"
}

# Clear output file before starting

> "$output_file"

if [ -n "$settings_file" ]; then
    batch_processing "$settings_file" "$input_file" "$output_file"
else
    process_lines "$input_file" "$output_file" "$begin_string" "$end_string" "$lowercase" "$uppercase" "$special_operations"
fi

# Verify the number of lines in the input and output files

input_lines=$(wc -l < "$input_file")
settings_lines=0
if [ -n "$settings_file" ]; then
    settings_lines=$(wc -l < "$settings_file")
    expected_output_lines=$((input_lines * settings_lines))
else
    expected_output_lines=$input_lines
fi
output_lines=$(wc -l < "$output_file")

if [ "$expected_output_lines" -eq "$output_lines" ]; then
    echo ''
    echo ''
    echo -e "\033[1;97m---------------------------------------\033[0m"
    echo -e "\033[1;97mTotal number of lines : $output_lines\033[0m"
else
    echo -e "\nMismatch in number of lines. Expected: $expected_output_lines, Output: $output_lines"
fi
