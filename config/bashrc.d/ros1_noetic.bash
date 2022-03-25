#/usr/bin/env bash

# Terminal for build setup
noetic_devel_setup() {
  export ROS_DISTRO=noetic

  local ros_ws="$HOME/ws_$ROS_DISTRO"
  source /opt/ros/$ROS_DISTRO/setup.bash

  # Update Prompt
  PS1="\e[1;92m\u@\h\e[0m \[\e[93m\]\w\[\e[91m\]\$(__git_ps1)\[\e[0m \e[1;34m\]<$ROS_DISTRO🔧>\e[0m\n$ "

  # Create  directory
  mkdir -p $ros_ws
  cd $ros_ws
}

# Termianl for excution setup
noetic_exec_setup() {
  export ROS_DISTRO=noetic

  ros_ws="$HOME/ws_$ROS_DISTRO"
  source "$ros_ws/devel/setup.bash"

  # Update Prompt
  PS1="\e[1;92m\u@\h\e[0m \[\e[93m\]\w\[\e[91m\]\$(__git_ps1)\[\e[0m \e[1;95m\]<$ROS_DISTRO🎬>\e[0m\n$ "

  # Create directory
  mkdir -p $ros_ws/src
  cd $ros_ws/src
}

# Open tmux panes
noetic_open() {
  local ROS_DISTRO="noetic"
  local session_name="${ROS_DISTRO}_ide"
  tmux new-session -s $session_name \; \
    split-window -v \; \
    select-pane -t 0 \; \
    send-keys -t 0 "${ROS_DISTRO}_devel_setup" C-m \; \
    send-keys -t 1 "${ROS_DISTRO}_exec_setup" C-m \;
}

# Close tmux panes
noetic_close() {
  local ROS_DISTRO="noetic"
  local session_name="${ROS_DISTRO}_ide"
  tmux kill-session -t $session_name
}
