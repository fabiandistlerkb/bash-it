# shellcheck shell=bash
about-alias 'common git abbreviations'

alias g='git'
alias get='git'
alias got='git '

# add
alias ga='git add'
alias gall='git add -A'
#alias gap='git add -p'
#alias gav='git add -v'

# branch
alias gb='git branch'
# List all branches (local and remote)
alias gba='git branch --all'
# Delete a local branch (only if it has been merged)
alias gbd='git branch -d'
# Force delete a local branch (even if it hasn't been merged)
alias gbD='git branch -D'
# List all local branches
#alias gbl='git branch --list'
# List all branches (local and remote)
#alias gbla='git branch --list --all'
# List all remote branches
#alias gblr='git branch --list --remotes'
# Rename a branch
alias gbm='git branch --move'
# List all remote branches (duplicate of gblr for convenience)
#alias gbr='git branch --remotes'
# Create a new branch that tracks a specified remote branch
#alias gbt='git branch --track'
# for-each-ref
#alias gbc='git for-each-ref --format="%(authorname) %09 %(if)%(HEAD)%(then)*%(else)%(refname:short)%(end) %09 %(creatordate)" refs/remotes/ --sort=authorname DESC' # FROM https://stackoverflow.com/a/58623139/10362396

# commit
alias gc='git commit -v'                    # Commit with verbose output
alias gca='git commit -v -a'                # Commit all changes with verbose output
#alias gcaa='git commit -a --amend -C HEAD'  # Amend the last commit with uncommitted changes
alias gcam='git commit -v -am'              # Commit all changes with a message
alias gcamd='git commit --amend'            # Amend the last commit interactively
#alias gc!='git commit -v --amend'           # Amend the last commit with verbose output
#alias gca!='git commit -v -a --amend'       # Amend the last commit with all changes and verbose output
#alias gcn!='git commit -v --amend --no-edit' # Amend the last commit without editing the message
#alias gcm='git commit -v -m'                # Commit with a message
#alias gci='git commit --interactive'        # Interactive commit
#alias gcsam='git commit -S -am'             # Sign off and commit all changes with a message

# Checkout branches or files
alias gcb='git checkout -b'                 # Create and switch to a new branch
alias gco='git checkout'                    # Switch branches or checkout files
#alias gcobu='git checkout -b ${USER}/'      # Create a branch with the current username prefix
alias gcom='git checkout $(get_default_branch)' # Switch to the default branch
alias gcpd='git checkout $(get_default_branch); git pull; git branch -D' # Switch to default, pull updates, and delete current branch
alias gct='git checkout --track'            # Checkout and track a remote branch

# Clone repositories
alias gcl='git clone'                       # Clone a repository

# Clean the working directory
alias gclean='git clean -fd'                # Remove untracked files and directories

# Cherry-pick commits
alias gcp='git cherry-pick'                 # Apply changes from a specific commit
alias gcpx='git cherry-pick -x'             # Cherry-pick and add a reference to the original commit

# View differences
alias gd='git diff'                         # Show differences between working directory and index
alias gds='git diff --staged'               # Show differences for staged changes
alias gdt='git difftool'                    # Use a diff tool for comparisons

# Export repository content
alias gexport='git archive --format zip --output' # Create a zip archive of the repository or files

# Fetch updates from remote
alias gf='git fetch --all --prune'          # Fetch all branches and prune deleted ones
#alias gft='git fetch --all --prune --tags'  # Fetch branches, prune deleted, and include tags
alias gftv='git fetch --all --prune --tags --verbose' # Fetch with verbose output
#alias gfv='git fetch --all --prune --verbose' # Fetch with prune and verbose output
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/$(get_default_branch)' # Fetch and merge upstream changes
alias gup='git fetch && git rebase'         # Fetch and rebase changes

# View commit logs
alias gg='git log --graph --pretty=format:'\''%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset'\'' --abbrev-commit --date=relative' # Graphical log with custom format
alias ggf='git log --graph --date=short --pretty=format:'\''%C(auto)%h %Cgreen%an%Creset %Cblue%cd%Creset %C(auto)%d %s'\''' # Graphical log with short date
alias ggs='gg --stat'                       # Graphical log with statistics
alias ggup='git log --branches --not --remotes --no-walk --decorate --oneline' # List branches with unpushed commits
alias gll='git log --graph --pretty=oneline --abbrev-commit' # One-line graphical log
alias gnew='git log HEAD@{1}..HEAD@{0}'     # Show new commits since the last pull
alias gwc='git whatchanged'                 # Show file changes per commit
#alias ghist='git log --pretty=format:'\''%h %ad | %s%d [%an]'\'' --graph --date=short' # Log history without colors
alias gprogress='git log --pretty=format:'\''%C(yellow)%h %Cblue%ad %Creset%s%Cgreen [%cn] %Cred%d'\'' --decorate --date=short' # Log with progress details

# List files
alias gu='git ls-files . --exclude-standard --others' # Show untracked files
#alias glsut='gu'                       # Alias for `gu`
alias glsum='git diff --name-only --diff-filter=U' # Show files with unresolved conflicts

# Git GUI
#alias ggui='git gui'                   # Launch the Git GUI interface

# Navigate to repository root
alias ghm='cd "$(git rev-parse --show-toplevel)"' # Go to Git repository root
if ! _command_exists gh; then
	alias gh='ghm'                 # Alias `gh` to `ghm` if `gh` is not a command
fi

# Merge branches
alias gm='git merge'                   # Merge branches
alias gma='git merge --abort'          # Abort a merge
alias gmc='git merge --continue'       # Continue a merge after conflicts are resolved
#alias gms='git merge --squash'         # Squash merge changes

# Move or rename files
alias gmv='git mv'                     # Move or rename files

# Create patches
alias gpatch='git format-patch -1'     # Create a patch for the last commit

# Push changes to remote
#alias gp='git push'                    # Push changes to the remote repository
#alias gpd='git push --delete'          # Delete a remote branch
#alias gpf='git push --force-with-lease' # Force push with safe options
#alias gpff='git push --force'          # Force push (unsafe)
#alias gpo='git push origin HEAD'       # Push the current branch to origin
#alias gpom='git push origin $(get_default_branch)' # Push the default branch to origin
#alias gpu='git push --set-upstream'    # Set upstream branch and push
#alias gpunch='git push --force-with-lease' # Alias for `gpf`
#alias gpuo='git push --set-upstream origin' # Set upstream to origin
#alias gpuoc='git push --set-upstream origin $(git symbolic-ref --short HEAD)' # Set upstream for the current branch

# Pull changes from remote
alias gl='git pull'                    # Pull changes
#alias glp='git pull --prune'           # Pull changes and prune deleted branches
alias glum='git pull upstream $(get_default_branch)' # Pull changes from upstream
alias gpl='git pull'                   # Alias for `gl`
#alias gpp='git pull && git push'       # Pull and then push changes
alias gpr='git pull --rebase'          # Pull with rebase

# Manage remote repositories
alias gr='git remote'                  # Manage remotes
alias gra='git remote add'             # Add a new remote
alias grv='git remote -v'              # View remote URLs

# Remove files
alias grm='git rm'                     # Remove files from the repository
alias grmc='git rm --cached'           # Stop tracking files but keep them locally

# Rebase branches
alias grb='git rebase'                 # Rebase the current branch
alias grba='git rebase --abort'        # Abort a rebase
alias grbc='git rebase --continue'     # Continue a rebase
alias grbm='git rebase $(get_default_branch)' # Rebase onto the default branch
alias grbmi='git rebase $(get_default_branch) --interactive' # Interactive rebase onto the default branch
#alias grbma='GIT_SEQUENCE_EDITOR=: git rebase $(get_default_branch) --interactive --autosquash' # Auto-squash rebase onto the default branch
#alias gprom='git fetch origin $(get_default_branch) && git rebase origin/$(get_default_branch) && git update-ref refs/heads/$(get_default_branch) origin/$(get_default_branch)' # Rebase with latest remote changes

# Reset changes
alias gus='git reset HEAD~1'             # Unstage changes
#alias grh='git reset'                  # Reset changes (soft or mixed)
#alias grh!='git reset --hard'          # Hard reset changes
#alias gpristine='git reset --hard && git clean -dfx' # Completely clean the working directory

# Show repository status
alias gs='git status'                  # Show the status
alias gss='git status -s'              # Show a short status

# Shortlog
alias gcount='git shortlog -sn'        # Show commit counts by author
alias gsl='git shortlog -sn'           # Alias for `gcount`

# Show commit or object details
#alias gsh='git show'                   # Show details of a commit or object
#alias gshn='git show --name-only'      # Show names of changed files
#alias gshns='git show --name-status'   # Show names and statuses of changed files

# SVN integration
#alias gsd='git svn dcommit'            # Commit changes to SVN
#alias gsr='git svn rebase'             # Rebase changes from SVN

# Stash changes
alias gst='git stash'                  # Stash changes
alias gstb='git stash branch'          # Create a branch from stash
alias gstd='git stash drop'            # Drop a stash entry
alias gstl='git stash list'            # List all stashes
alias gstp='git stash pop'             # Apply and remove the latest stash
alias gstpo='git stash pop'            # Alias for `gstp`
alias gstpu='git stash push'           # Push changes to the stash
alias gstpum='git stash push -m'       # Push changes with a message
alias gsts='git stash push'            # Alias for `gstpu`
alias gstsm='git stash push -m'        # Alias for `gstpum`

# Submodule management
alias gsu='git submodule update --init --recursive' # Update and initialize submodules recursively

# Switch branches (Git v2.23+)
alias gsw='git switch'                 # Switch branches
alias gswc='git switch --create'       # Create and switch to a new branch
alias gswm='git switch $(get_default_branch)' # Switch to the default branch
alias gswt='git switch --track'        # Switch to and track a remote branch

# Manage tags
alias gt='git tag'                     # Manage tags
alias gta='git tag -a'                 # Create an annotated tag
alias gtd='git tag -d'                 # Delete a tag
alias gtl='git tag -l'                 # List tags

# OS-specific tag sorting
case $OSTYPE in
	darwin*)
		alias gtls="git tag -l | gsort -V" # MacOS: Sort tags using `gsort`
		;;
	*)
		alias gtls='git tag -l | sort -V'  # Other OS: Sort tags using `sort`
		;;
esac

# Functions
function gdv() {
	git diff --ignore-all-space "$@" | nano -R - # Show diff ignoring all spaces in nano (read-only)
}

function get_default_branch() {
	branch=$(git symbolic-ref refs/remotes/origin/HEAD)
	${branch#refs/remotes/origin/} # Get the default branch name of the repository
}
