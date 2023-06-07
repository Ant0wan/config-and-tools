#!/bin/bash

# Define an array to hold the options
options=("Option1" "Option2" "Option3")

# Convert the array into a space-separated string with ON/OFF flags
options_string=""
for i in "${!options[@]}"; do
  options_string+="$((i+1)) ${options[i]} OFF "
done
i=$((i+1))

# Use the options string in the --checklist dialog
echo "whiptail --checklist \"Select options:\" 10 30 $i ${options_string} --title \"Multiple Selection\" --backtitle \"Sample Script\" 3>&1 1>&2 2>&3"
choices=$(whiptail --checklist "Select options:" 10 30 $i ${options_string} --title "Multiple Selection" --backtitle "Sample Script" 3>&1 1>&2 2>&3)

# Print the selected choices
echo "Selected options: ${choices}"

