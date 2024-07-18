#!/bin/bash
#
# This project aims to provide a simple tool for 
# backing up multiple reusable configuration files in an 
# automated way, bringing them to a centralized repository 
# and enabling the user to install them on their system.



#######################################
# Format text to bold
#
# Arguments:
#   text - Text you want to format
#######################################
function bold () {
	local start_bold=$(tput bold)
	local text="$1"
	local end_bold=$(tput sgr0)
	
	echo "${start_bold}${text}${end_bold}"
}


#######################################
# Get target directory path and create it if not exists.
#
# Arguments:
#   target_folder_name - Name of the folder where you want to put your files
#######################################
function get_in_workspace_target_directory_path () {
	local target_folder_name=$1
	local base_target_directory="$(basename "$(pwd)" )/$target_folder_name"
	local absolute_target_directory=""
	
	if [ -d "$HOME/Documents" ]; then
		absolute_target_directory="$HOME/Documents/$base_target_directory"
	fi
	
	if [ -d "$HOME/Documentos" ]; then
		absolute_target_directory="$HOME/Documentos/$base_target_directory"
	fi
	
	if [ ! -d "$absolute_target_directory" ]; then
		mkdir "$target_folder_name"
	fi
	
	echo "$absolute_target_directory"
}


#######################################
# Copy a file from the origin directory 
# and paste it into the target directory
#
# Arguments:
#   origin_file_path - self explanatory
#   target_directory_path - self explanatory
#######################################
function copy_from_origin_paste_in_target () {
	local origin_file_path="$1"
	local target_directory_path="$2" 
	
	sudo cp "$origin_file_path" "$target_directory_path"

	echo -e "\nCopied    ⚡: -> $( basename "$origin_file_path" ) <-"
	echo -e "Paste in  ✨: -> $( basename "$( pwd )")/$( basename "$target_directory_path" ) <-\n"
}



##############################################################
# -> Place to define origin directorys and target directorys
##############################################################


# -> Zsh / Oh-My-Zsh <- #

# 1. File Origin
zsh_zshrc_file_origin=~/.zshrc
# 2. Target Directory
zsh_zshrc_target_directory=$(get_in_workspace_target_directory_path "Oh-My-Zsh")


# -> Visual-Studio-Code <- #

# 1. File Origin
vscode_workbench_css_file_origin=/usr/share/code/resources/app/out/vs/workbench/workbench.desktop.main.css
# 2. Target Directory
vscode_workbench_css_target_directory=$(get_in_workspace_target_directory_path "Visual-Studio-Code")

# 1. File Origin
vscode_settings_json_file_origin=~/.config/Code/User/settings.json
# 2. Target Directory 
vscode_settings_json_target_directory=$(get_in_workspace_target_directory_path "Visual-Studio-Code")



##############################################################
# Place to store origin directorys and target directorys on arrays 
##############################################################

# -> Arrays must contain equal sizes. The elements between both will be iterated in pairs <- #

sources=( 
  "$zsh_zshrc_file_origin" 
  "$vscode_workbench_css_file_origin" 
  "$vscode_settings_json_file_origin"
)

# Array lenght
files_sources_array_lenght=${#sources[@]}


targets=(
	"$zsh_zshrc_target_directory"
	"$vscode_workbench_css_target_directory"
	"$vscode_settings_json_target_directory"
)

# Array lenght
file_targets_array_lenght=${#targets[@]}



##############################################################
# Run main operations
##############################################################

function main {
	# -> Verify if the number of file sources is equal to number of destination directorys. <- #
	local error_message="The number of file sources and \nfile destination directories must be equal."

	if [ "${file_targets_array_lenght}" != "${files_sources_array_lenght}" ]; then
		echo -e "$(bold "Parameter Error"):    \n"
		echo -e "$(bold "E"): ${error_message} \n"
									
		echo "$(bold "INFO:") Number of origins : ${files_sources_array_lenght}"
		echo "$(bold "INFO:") Number of destinations : ${file_targets_array_lenght}"
		
		return 
	fi


	# -> Doing what need to be done. <- #
	for i in $(seq 1 ${#sources[@]}); do
		copy_from_origin_paste_in_target ${sources[i]} ${targets[i]}
	done	
}


main
