#!/bin/zsh

if [ "$TMUX" ]; then

# Renames tmux window to server ssh is being used to connect to
  function ssh() {
    if [ -n "$TMUX" ] # set only if within running tmux
    then
      window_index=$(tmux display-message -p '#I')

      # arbitrary environment variable name to remember ssh args like server
      # hostname so we can connect again.
      session_variable_name="window_${window_index}_ssh_args"

      # save in tmux session variable
      tmux setenv $session_variable_name "${@[-1]}"

      # set window title
      tmux rename-window ${@[-1]}

      # run ssh
      ssh $*

      # unset variable so new panes don't continue ssh-ing to this server
      tmux setenv -u $session_variable_name
    else
      ssh $*
    fi

    # rename title back
    tmux rename-window zsh
  }

# Renames tmux window to server ssh is being used to connect to
# Doesn't save key in known_hosts
  function sshnh() {
    if [ -n "$TMUX" ] # set only if within running tmux
    then
      window_index=$(tmux display-message -p '#I')

      # arbitrary environment variable name to remember ssh args like server
      # hostname so we can connect again.
      session_variable_name="window_${window_index}_ssh_args"

      # save in tmux session variable
      tmux setenv $session_variable_name "${@[-1]}"

      # set window title
      tmux rename-window ${@[-1]}

      # run ssh
      ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*

      # unset variable so new panes don't continue ssh-ing to this server
      tmux setenv -u $session_variable_name
    else
      ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*
    fi

    # rename title back
    tmux rename-window zsh
  }

  function sshnhr() {
    if [ -n "$TMUX" ] # set only if within running tmux
    then
      window_index=$(tmux display-message -p '#I')

      # arbitrary environment variable name to remember ssh args like server
      # hostname so we can connect again.
      session_variable_name="window_${window_index}_ssh_args"

      # save in tmux session variable
      tmux setenv $session_variable_name "${@[-1]}"

      # set window title
      tmux rename-window ${@[-1]}

      # run ssh
      ssh -l root -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*

      # unset variable so new panes don't continue ssh-ing to this server
      tmux setenv -u $session_variable_name
    else
      ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*
    fi

    # rename title back
    tmux rename-window zsh
  }
else
  alias sshnh='ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
  alias sshnhr='ssh -l root -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
fi
