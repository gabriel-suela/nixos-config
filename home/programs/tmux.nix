{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-a";
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.catppuccin
    ];
    extraConfig = ''
      set -g pane-active-border-style 'fg=#F0C674,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'
      set -g status-style 'fg=colour9'
      set -g status-position top
      set -g status-left ""
      set -g status-justify left
      set-option -g focus-events on
      set -sg terminal-overrides ",*:RGB"

      set -g set-clipboard on
      set -g escape-time 0
      set -g history-limit 1000000
      set-window-option -g mode-keys vi
      set-option -g renumber-windows on
      set -g mouse on

      bind | split-window -h
      bind _ split-window -v

      bind '_' split-window -v -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"

      bind -n M-k resize-pane -U 5
      bind -n M-j resize-pane -D 5
      bind -n M-h resize-pane -L 5
      bind -n M-l resize-pane -R 5


      setw -g window-status-current-style 'fg=colour9 bg=#1F1F1F bold'
      setw -g window-status-current-format ' #I #W #F '
      setw -g window-status-style 'fg=colour1 dim'
      setw -g window-status-format ' #I #[fg=colour9]#W #[fg=colour9]#F '
      setw -g window-status-bell-style 'fg=colour2 bg=colour1 bold'
      
      
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
      | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
      "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
      "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

    '';
  };
}
