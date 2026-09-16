if status is-interactive
    fzf --fish | source
    starship init fish | source
    zoxide init fish | source
    bind \cg _navi_widget
end