#!/usr/bin/env bash

# Colors
c_red='\033[0;31m'
c_green='\033[0;32m'
c_bold_red='\033[1;31m'
c_bold_green='\033[1;32m'
c_clear='\033[0m'

# Change options
change_opts=(
	"1  feat (A new feature)"
	"2  fix (A bug fix)"
	"3  docs (Documentation only changes)"
	"4  style (Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc.))"
	"5  refactor (A code change that neither fixes a bug nor addss a feature)"
	"6  perf (A code change that improves the performance)"
	"7  test (Adding missing tests or correcting existing tests)"
	"8  build (Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm))"
	"9  ci (Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs))"
	"10 chore (Other changes that dont modify src or test files)"
	"11 revert (Reverts a previous commit)"
)

# Emoji options
emoji_opts=(
	"0  (none)"
	"1  :art:                        🎨      (Improve structure / format of the code.)"
	"2  :zap:                        ⚡️      (Improve performance.)"
	"3  :fire:                       🔥      (Remove code or files.)"
	"4  :bug:                        🐛      (Fix a bug.)"
	"5  :ambulance:                  🚑️      (Critical hotfix.)"
	"6  :sparkles:                   ✨      (Introduce new features.)"
	"7  :memo:                       📝      (Add or update documentation.)"
	"8  :rocket:                     🚀      (Deploy stuff.)"
	"9  :lipstick:                   💄      (Add or update the UI and style files.)"
	"10 :tada:                       🎉      (Begin a project.)"
	"11 :white_check_mark:           ✅      (Add, update, or pass tests.)"
	"12 :lock:                       🔒️      (Fix security issues.)"
	"13 :closed_lock_with_key:       🔐      (Add or update secrets.)"
	"14 :bookmark:                   🔖      (Release / Version tags.)"
	"15 :rotating_light:             🚨      (Fix compiler / linter warnings.)"
	"16 :construction:               🚧      (Work in progress.)"
	"17 :green_heart:                💚      (Fix CI Build.)"
	"18 :arrow_down:                 ⬇️      (Downgrade dependencies.)"
	"19 :arrow_up:                   ⬆️      (Upgrade dependencies.)"
	"20 :pushpin:                    📌      (Pin dependencies to specific versions.)"
	"21 :construction_worker:        👷      (Add or update CI build system.)"
	"22 :chart_with_upwards_trend    📈      (Add or update analytics or track code.)"
	"23 :recycle:                    ♻️      (Refactor code.)"
	"24 :heavy_plus_sign:            ➕      (Add a dependency.)"
	"25 :heavy_minus_sign:           ➖      (Remove a dependency.)"
	"26 :wrench:                     🔧      (Add or update configuration files.)"
	"27 :hammer:                     🔨      (Add or update development scripts.)"
	"28 :globe_with_meridians:       🌐      (Internationalization and localization.)"
	"29 :pencil2:                    ✏️      (Fix typos.)"
	"30 :poop:                       💩      (Write bad code that needs to be improved.)"
	"31 :rewind:                     ⏪️      (Revert changes.)"
	"32 :twisted_rightwards_arrows:  🔀      (Merge branches.)"
	"33 :package:                    📦️      (Add or update compiled files or packages.)"
	"34 :alien:                      👽️      (Update code due to external API changes.)"
	"35 :truck:                      🚚      (Move or rename resources (e.g.: files, paths, routes).)"
	"36 :page_facing_up:             📄      (Add or update license.)"
	"37 :boom:                       💥      (Introduce breaking changes.)"
	"38 :bento:                      🍱      (Add or update assets.)"
	"39 :wheelchair:                 ♿️      (Improve accessibility.)"
	"40 :bulb:                       💡      (Add or update comments in source code.)"
	"41 :beers:                      🍻      (Write code drunkenly.)"
	"42 :speech_balloon:             💬      (Add or update text and literals.)"
	"43 :card_file_box:              🗃️      (Perform database related changes.)"
	"44 :loud_sound:                 🔊      (Add or update logs.)"
	"45 :mute:                       🔇      (Remove logs.)"
	"46 :busts_in_silhouette:        👥      (Add or update contributor(s).)"
	"47 :children_crossing:          🚸      (Improve user experience / usability.)"
	"48 :building_construction:      🏗️      (Make architectural changes.)"
	"49 :iphone:                     📱      (Work on responsive design.)"
	"50 :clown_face:                 🤡      (Mock things.)"
	"51 :egg:                        🥚      (Add or update an easter egg.)"
	"52 :see_no_evil:                🙈      (Add or update a .gitignore file.)"
	"53 :camera_flash:               📸      (Add or update snapshots.)"
	"54 :alembic:                    ⚗️      (Perform experiments.)"
	"55 :mag:                        🔍️      (Improve SEO.)"
	"56 :label:                      🏷️      (Add or update types.)"
	"57 :seedling:                   🌱      (Add or update seed files.)"
	"58 :triangular_flag_on_post:    🚩      (Add, update, or remove feature flags.)"
	"59 :goal_net:                   🥅      (Catch errors.)"
	"60 :dizzy:                      💫      (Add or update animations and transitions.)"
	"61 :wastebasket:                🗑️      (Deprecate code that needs to be cleaned up.)"
	"62 :passport_control:           🛂      (Work on code related to authorization, roles and permissions.)"
	"63 :adhesive_bandage:           🩹      (Simple fix for a non-critical issue.)"
	"64 :monocle_face:               🧐      (Data exploration/inspection.)"
	"65 :coffin:                     ⚰️      (Remove dead code.)"
	"66 :test_tube:                  🧪      (Add a failing test.)"
	"67 :necktie:                    👔      (Add or update business logic)"
	"68 :stethoscope:                🩺      (Add or update healthcheck.)"
	"69 :bricks:                     🧱      (Infrastructure related changes.)"
	"70 :technologist:               🧑‍💻    (Improve developer experience)"
	"71 :money_with_wings:           💸      (Add sponsorships or money related infrastructure.)"
)

# check for dependencies
check_dependencies() {
	if ! command -v "$1" &>/dev/null; then
		printf "%b%s command not found%b. Please install it using your favorite package manager and try again.\n" "$c_bold_red" "$1" "$c_clear"
		exit 1
	fi
}
check_dependencies "git"
check_dependencies "fzf"

# check if its a valid git repo
repo_info="$(git rev-parse --git-dir --is-bare-repository --is-inside-git-dir --is-inside-work-tree 2>/dev/null)"
if [ -z "$repo_info" ]; then
	printf "%bNot a valid git repository%b\n" "$c_bold_red" "$c_clear"
	exit 1
fi
# Additional checks to see if its a valid git repo
if [[ ! ($repo_info =~ .*".git".* || $repo_info =~ .*"true".*) ]]; then
	printf "%bNot a valid git repository%b\n" "$c_bold_red" "$c_clear"
	exit 1
fi

# check if there are any staged changes.
staged_changes_command="git diff --cached --quiet --exit-code"
eval "$staged_changes_command"
staged_changes_status=$?
if [[ $staged_changes_status -eq 0 ]]; then
	printf "%bLooks like there aren't any staged changes.%b\n" "$c_bold_red" "$c_clear"
	while [[ -z $stage_confirmation || (! $stage_confirmation =~ ^[YN]$) ]]; do
		printf "Would you like to add all your changes? %b(Y)%bes %b(N)%bo: " "$c_green" "$c_clear" "$c_red" "$c_clear"
		read -r stage_confirmation
		stage_confirmation=$(echo "$stage_confirmation" | xargs | tr '[:lower:]' '[:upper:]')
		if [[ -z $stage_confirmation ]]; then
			printf "%bConfirmation cannot be empty. Please try again%b\n" "$c_bold_red" "$c_clear"
		elif [[ ! $stage_confirmation =~ ^[YN]$ ]]; then
			printf "%bInvalid option. Please try again%b\n" "$c_bold_red" "$c_clear"
		fi
	done
	if [[ $stage_confirmation == "Y" ]]; then
		stage_command="git add ."
		printf "Executing command: %b%s%b\n" "$c_green" "$stage_command" "$c_clear"
		eval "$stage_command"
	else
		printf "%bExiting%b\n" "$c_bold_red" "$c_clear"
		exit 0
	fi
	# check if there are any changes after running the stage command
	eval "$staged_changes_command"
	staged_changes_status=$?
	if [[ $staged_changes_status -eq 0 ]]; then
		printf "%bLooks like nothing was staged after executing the previous command. Please stage your changes and try again%b\n" "$c_bold_red" "$c_clear"
		exit 1
	else
		staged_files=$(git diff --cached --name-only)
		printf "The following files were staged after executing the previous command: \n%b%s%b\n" "$c_green" "$staged_files" "$c_clear"
	fi
fi

check_fzf_exit_status() {
	exit_status=$2
	if [[ $exit_status -eq 130 ]]; then
		printf "%bExiting%b\n" "$c_bold_red" "$c_clear"
		exit 0
	elif [[ $exit_status -eq 1 ]]; then
		printf "%bInvalid $1, Please try again%b\n" "$c_bold_red" "$c_clear"
	fi
}

restart=0
while [[ $restart -eq 0 ]]; do
	# change type
	while [[ -z $change_opt ]]; do
		printf "%bSelect a change type:%b (Press %bESC%b or %bCTRL-C%b to exit)\n" "$c_bold_green" "$c_clear" "$c_red" "$c_clear" "$c_red" "$c_clear"
		change_opt=$(printf "%s\n" "${change_opts[@]}" | fzf --no-multi --no-mouse --height 40% --reverse)
		check_fzf_exit_status "change type" $?
	done
	change=$(echo "$change_opt" | xargs | cut --delimiter=" " --fields=2)
	printf '%bchange:%b %s\n' "$c_green" "$c_clear" "$change"

	# emoji
	while [[ -z $emoji_opt ]]; do
		printf "%bSelect an emoji:%b (Press %bESC%b or %bCTRL-C%b to exit)\n" "$c_bold_green" "$c_clear" "$c_red" "$c_clear" "$c_red" "$c_clear"
		emoji_opt=$(printf "%s\n" "${emoji_opts[@]}" | fzf --no-multi --no-mouse --height 40% --reverse)
		check_fzf_exit_status "emoji" $?
	done
	emoji=$(echo "$emoji_opt" | xargs | cut --delimiter=" " --fields=2)
	if [[ $emoji == "(none)" ]]; then
		emoji=""
	else
		emoji="$emoji " # add trailing space for concatenating with commit message
	fi
	printf "%bemoji:%b %s\n" "$c_green" "$c_clear" "$emoji"

	# commit message
	while [[ -z $commit_message ]]; do
		printf "%bEnter a commit message:%b (Press %bCTRL-C%b to exit)\n" "$c_bold_green" "$c_clear" "$c_red" "$c_clear"
		read -r commit_message
		if [[ -z $commit_message ]]; then
			printf "%bcommit message cannot be empty, Please try again%b\n" "$c_bold_red" "$c_clear"
		fi
	done

	# commit description
	printf "%bEnter an optional commit description:%b (Press %bENTER%b to skip) (Press %bCTRL-C%b to exit)\n" "$c_bold_green" "$c_clear" "$c_green" "$c_clear" "$c_red" "$c_clear"
	read -r commit_description

	commit_message="$change: $emoji$commit_message"
	commit_command="git commit -m \"${commit_message}\""
	if [[ -n $commit_description ]]; then
		commit_command="$commit_command -m \"${commit_description}\""
	fi
	printf "Review the commit command: %b%s%b\n" "$c_green" "$commit_command" "$c_clear"

	# commit
	while [[ -z $confirmation || (! $confirmation =~ ^[YNR]$) ]]; do
		printf "Ready to commit? (Enter %b(Y)%bes to Commit, %b(N)%bo to Cancel, %b(R)%b to Restart): " "$c_green" "$c_clear" "$c_red" "$c_clear" "$c_green" "$c_clear"
		read -r confirmation
		confirmation=$(echo "$confirmation" | xargs | tr '[:lower:]' '[:upper:]')
		if [[ -z $confirmation ]]; then
			printf "%bConfirmation cannot be empty. Please try again%b\n" "$c_bold_red" "$c_clear"
		elif [[ ! $confirmation =~ ^[YNR]$ ]]; then
			printf "%bInvalid option. Please try again%b\n" "$c_bold_red" "$c_clear"
		fi
	done
	if [[ $confirmation == "Y" ]]; then
		restart=1
		printf "Executing command: %b%s%b\n" "$c_green" "$commit_command" "$c_clear"
		eval "$commit_command"
	elif [[ $confirmation == "N" ]]; then
		restart=1
		printf "%bCancelled%b\n" "$c_bold_red" "$c_clear"
		exit 0
	else # reset variables for restart
		restart=0
		change_opt=""
		emoji_opt=""
		commit_message=""
		commit_description=""
		confirmation=""
	fi
done

# push command
remote_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
push_command="git push origin $remote_branch"
printf "Review the push command: %b%s%b\n" "$c_green" "$push_command" "$c_clear"
while [[ -z $push_confirmation || (! $push_confirmation =~ ^[YN]$) ]]; do
	printf "Ready to push? %b(Y)%bes %b(N)%bo: " "$c_green" "$c_clear" "$c_red" "$c_clear"
	read -r push_confirmation
	push_confirmation=$(echo "$push_confirmation" | xargs | tr '[:lower:]' '[:upper:]')
	if [[ -z $push_confirmation ]]; then
		printf "%bConfirmation cannot be empty. Please try again%b\n" "$c_bold_red" "$c_clear"
	elif [[ ! $push_confirmation =~ ^[YN]$ ]]; then
		printf "%bInvalid option. Please try again%b\n" "$c_bold_red" "$c_clear"
	fi
done
if [[ $push_confirmation == "Y" ]]; then
	printf "Executing command: %b%s%b\n" "$c_green" "$push_command" "$c_clear"
	eval "$push_command"
else
	printf "%bExiting%b\n" "$c_bold_red" "$c_clear"
	exit 0
fi
