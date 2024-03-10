{ config, pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-a";
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      bind -n M-h previous-window
      bind -n M-l next-window
      bind | split-window -h
      bind _ split-window -v


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
