#!/usr/bin/env bash

# Colors
c_red='\033[0;31m'
c_green='\033[0;32m'
c_bold_red='\033[1;31m'
c_bold_green='\033[1;32m'
c_bright_black_gray='\033[0;90m'
c_clear='\033[0m'

# Change options
change_opts=(
	"${c_green}1${c_clear}  feat ${c_bright_black_gray}(A new feature)${c_clear}"
	"${c_green}2${c_clear}  fix ${c_bright_black_gray}(A bug fix)${c_clear}"
	"${c_green}3${c_clear}  docs ${c_bright_black_gray}(Documentation only changes)${c_clear}"
	"${c_green}4${c_clear}  style ${c_bright_black_gray}(Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc.))${c_clear}"
	"${c_green}5${c_clear}  refactor ${c_bright_black_gray}(A code change that neither fixes a bug nor addss a feature)${c_clear}"
	"${c_green}6${c_clear}  perf ${c_bright_black_gray}(A code change that improves the performance)${c_clear}"
	"${c_green}7${c_clear}  test ${c_bright_black_gray}(Adding missing tests or correcting existing tests)${c_clear}"
	"${c_green}8${c_clear}  build ${c_bright_black_gray}(Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm))${c_clear}"
	"${c_green}9${c_clear}  ci ${c_bright_black_gray}(Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs))${c_clear}"
	"${c_green}10${c_clear} chore ${c_bright_black_gray}(Other changes that dont modify src or test files)${c_clear}"
	"${c_green}11${c_clear} revert ${c_bright_black_gray}(Reverts a previous commit)${c_clear}"
)

# Emoji options
emoji_opts=(
	"${c_green}0${c_clear}  (none)"
	"${c_green}1${c_clear}  :art:                        🎨      ${c_bright_black_gray}(Improve structure / format of the code.)${c_clear}"
	"${c_green}2${c_clear}  :zap:                        ⚡️      ${c_bright_black_gray}(Improve performance.)${c_clear}"
	"${c_green}3${c_clear}  :fire:                       🔥      ${c_bright_black_gray}(Remove code or files.)${c_clear}"
	"${c_green}4${c_clear}  :bug:                        🐛      ${c_bright_black_gray}(Fix a bug.)${c_clear}"
	"${c_green}5${c_clear}  :ambulance:                  🚑️      ${c_bright_black_gray}(Critical hotfix.)${c_clear}"
	"${c_green}6${c_clear}  :sparkles:                   ✨      ${c_bright_black_gray}(Introduce new features.)${c_clear}"
	"${c_green}7${c_clear}  :memo:                       📝      ${c_bright_black_gray}(Add or update documentation.)${c_clear}"
	"${c_green}8${c_clear}  :rocket:                     🚀      ${c_bright_black_gray}(Deploy stuff.)${c_clear}"
	"${c_green}9${c_clear}  :lipstick:                   💄      ${c_bright_black_gray}(Add or update the UI and style files.)${c_clear}"
	"${c_green}10${c_clear} :tada:                       🎉      ${c_bright_black_gray}(Begin a project.)${c_clear}"
	"${c_green}11${c_clear} :white_check_mark:           ✅      ${c_bright_black_gray}(Add, update, or pass tests.)${c_clear}"
	"${c_green}12${c_clear} :lock:                       🔒️      ${c_bright_black_gray}(Fix security issues.)${c_clear}"
	"${c_green}13${c_clear} :closed_lock_with_key:       🔐      ${c_bright_black_gray}(Add or update secrets.)${c_clear}"
	"${c_green}14${c_clear} :bookmark:                   🔖      ${c_bright_black_gray}(Release / Version tags.)${c_clear}"
	"${c_green}15${c_clear} :rotating_light:             🚨      ${c_bright_black_gray}(Fix compiler / linter warnings.)${c_clear}"
	"${c_green}16${c_clear} :construction:               🚧      ${c_bright_black_gray}(Work in progress.)${c_clear}"
	"${c_green}17${c_clear} :green_heart:                💚      ${c_bright_black_gray}(Fix CI Build.)${c_clear}"
	"${c_green}18${c_clear} :arrow_down:                 ⬇️      ${c_bright_black_gray}(Downgrade dependencies.)${c_clear}"
	"${c_green}19${c_clear} :arrow_up:                   ⬆️      ${c_bright_black_gray}(Upgrade dependencies.)${c_clear}"
	"${c_green}20${c_clear} :pushpin:                    📌      ${c_bright_black_gray}(Pin dependencies to specific versions.)${c_clear}"
	"${c_green}21${c_clear} :construction_worker:        👷      ${c_bright_black_gray}(Add or update CI build system.)${c_clear}"
	"${c_green}22${c_clear} :chart_with_upwards_trend    📈      ${c_bright_black_gray}(Add or update analytics or track code.)${c_clear}"
	"${c_green}23${c_clear} :recycle:                    ♻️      ${c_bright_black_gray}(Refactor code.)${c_clear}"
	"${c_green}24${c_clear} :heavy_plus_sign:            ➕      ${c_bright_black_gray}(Add a dependency.)${c_clear}"
	"${c_green}25${c_clear} :heavy_minus_sign:           ➖      ${c_bright_black_gray}(Remove a dependency.)${c_clear}"
	"${c_green}26${c_clear} :wrench:                     🔧      ${c_bright_black_gray}(Add or update configuration files.)${c_clear}"
	"${c_green}27${c_clear} :hammer:                     🔨      ${c_bright_black_gray}(Add or update development scripts.)${c_clear}"
	"${c_green}28${c_clear} :globe_with_meridians:       🌐      ${c_bright_black_gray}(Internationalization and localization.)${c_clear}"
	"${c_green}29${c_clear} :pencil2:                    ✏️      ${c_bright_black_gray}(Fix typos.)${c_clear}"
	"${c_green}30${c_clear} :poop:                       💩      ${c_bright_black_gray}(Write bad code that needs to be improved.)${c_clear}"
	"${c_green}31${c_clear} :rewind:                     ⏪️      ${c_bright_black_gray}(Revert changes.)${c_clear}"
	"${c_green}32${c_clear} :twisted_rightwards_arrows:  🔀      ${c_bright_black_gray}(Merge branches.)${c_clear}"
	"${c_green}33${c_clear} :package:                    📦️      ${c_bright_black_gray}(Add or update compiled files or packages.)${c_clear}"
	"${c_green}34${c_clear} :alien:                      👽️      ${c_bright_black_gray}(Update code due to external API changes.)${c_clear}"
	"${c_green}35${c_clear} :truck:                      🚚      ${c_bright_black_gray}(Move or rename resources (e.g.: files, paths, routes).)${c_clear}"
	"${c_green}36${c_clear} :page_facing_up:             📄      ${c_bright_black_gray}(Add or update license.)${c_clear}"
	"${c_green}37${c_clear} :boom:                       💥      ${c_bright_black_gray}(Introduce breaking changes.)${c_clear}"
	"${c_green}38${c_clear} :bento:                      🍱      ${c_bright_black_gray}(Add or update assets.)${c_clear}"
	"${c_green}39${c_clear} :wheelchair:                 ♿️      ${c_bright_black_gray}(Improve accessibility.)${c_clear}"
	"${c_green}40${c_clear} :bulb:                       💡      ${c_bright_black_gray}(Add or update comments in source code.)${c_clear}"
	"${c_green}41${c_clear} :beers:                      🍻      ${c_bright_black_gray}(Write code drunkenly.)${c_clear}"
	"${c_green}42${c_clear} :speech_balloon:             💬      ${c_bright_black_gray}(Add or update text and literals.)${c_clear}"
	"${c_green}43${c_clear} :card_file_box:              🗃️      ${c_bright_black_gray}(Perform database related changes.)${c_clear}"
	"${c_green}44${c_clear} :loud_sound:                 🔊      ${c_bright_black_gray}(Add or update logs.)${c_clear}"
	"${c_green}45${c_clear} :mute:                       🔇      ${c_bright_black_gray}(Remove logs.)${c_clear}"
	"${c_green}46${c_clear} :busts_in_silhouette:        👥      ${c_bright_black_gray}(Add or update contributor(s).)${c_clear}"
	"${c_green}47${c_clear} :children_crossing:          🚸      ${c_bright_black_gray}(Improve user experience / usability.)${c_clear}"
	"${c_green}48${c_clear} :building_construction:      🏗️      ${c_bright_black_gray}(Make architectural changes.)${c_clear}"
	"${c_green}49${c_clear} :iphone:                     📱      ${c_bright_black_gray}(Work on responsive design.)${c_clear}"
	"${c_green}50${c_clear} :clown_face:                 🤡      ${c_bright_black_gray}(Mock things.)${c_clear}"
	"${c_green}51${c_clear} :egg:                        🥚      ${c_bright_black_gray}(Add or update an easter egg.)${c_clear}"
	"${c_green}52${c_clear} :see_no_evil:                🙈      ${c_bright_black_gray}(Add or update a .gitignore file.)${c_clear}"
	"${c_green}53${c_clear} :camera_flash:               📸      ${c_bright_black_gray}(Add or update snapshots.)${c_clear}"
	"${c_green}54${c_clear} :alembic:                    ⚗️      ${c_bright_black_gray}(Perform experiments.)${c_clear}"
	"${c_green}55${c_clear} :mag:                        🔍️      ${c_bright_black_gray}(Improve SEO.)${c_clear}"
	"${c_green}56${c_clear} :label:                      🏷️      ${c_bright_black_gray}(Add or update types.)${c_clear}"
	"${c_green}57${c_clear} :seedling:                   🌱      ${c_bright_black_gray}(Add or update seed files.)${c_clear}"
	"${c_green}58${c_clear} :triangular_flag_on_post:    🚩      ${c_bright_black_gray}(Add, update, or remove feature flags.)${c_clear}"
	"${c_green}59${c_clear} :goal_net:                   🥅      ${c_bright_black_gray}(Catch errors.)${c_clear}"
	"${c_green}60${c_clear} :dizzy:                      💫      ${c_bright_black_gray}(Add or update animations and transitions.)${c_clear}"
	"${c_green}61${c_clear} :wastebasket:                🗑️      ${c_bright_black_gray}(Deprecate code that needs to be cleaned up.)${c_clear}"
	"${c_green}62${c_clear} :passport_control:           🛂      ${c_bright_black_gray}(Work on code related to authorization, roles and permissions.)${c_clear}"
	"${c_green}63${c_clear} :adhesive_bandage:           🩹      ${c_bright_black_gray}(Simple fix for a non-critical issue.)${c_clear}"
	"${c_green}64${c_clear} :monocle_face:               🧐      ${c_bright_black_gray}(Data exploration/inspection.)${c_clear}"
	"${c_green}65${c_clear} :coffin:                     ⚰️      ${c_bright_black_gray}(Remove dead code.)${c_clear}"
	"${c_green}66${c_clear} :test_tube:                  🧪      ${c_bright_black_gray}(Add a failing test.)${c_clear}"
	"${c_green}67${c_clear} :necktie:                    👔      ${c_bright_black_gray}(Add or update business logic)${c_clear}"
	"${c_green}68${c_clear} :stethoscope:                🩺      ${c_bright_black_gray}(Add or update healthcheck.)${c_clear}"
	"${c_green}69${c_clear} :bricks:                     🧱      ${c_bright_black_gray}(Infrastructure related changes.)${c_clear}"
	"${c_green}70${c_clear} :technologist:               🧑‍💻    ${c_bright_black_gray}(Improve developer experience)${c_clear}"
	"${c_green}71${c_clear} :money_with_wings:           💸      ${c_bright_black_gray}(Add sponsorships or money related infrastructure.)${c_clear}"
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
		change_opt=$(printf "%b\n" "${change_opts[@]}" | fzf --ansi --no-multi --no-mouse --height 40% --reverse)
		check_fzf_exit_status "change type" $?
	done
	change=$(echo "$change_opt" | xargs | cut --delimiter=" " --fields=2)
	printf '%bchange:%b %s\n' "$c_green" "$c_clear" "$change"

	# emoji
	while [[ -z $emoji_opt ]]; do
		printf "%bSelect an emoji:%b (Press %bESC%b or %bCTRL-C%b to exit)\n" "$c_bold_green" "$c_clear" "$c_red" "$c_clear" "$c_red" "$c_clear"
		emoji_opt=$(printf "%b\n" "${emoji_opts[@]}" | fzf --ansi --no-multi --no-mouse --height 40% --reverse)
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
