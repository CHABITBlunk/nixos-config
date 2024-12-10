{
  programs.zsh = {
    enable = true;
    initExtra = ''
      path+=("$HOME/.cargo/bin")
      path+=("$HOME/go/bin")
      if [ -e "$HOME/.zsh/antigen.zsh" ]; then curl -L git.io/antigen > $HOME/.zsh/antigen.zsh; fi
      source ~/antigen.zsh
      source ~/.config/zsh/github-zsh-syntax-highlighting.zsh
      antigen use oh-my-zsh

      antigen bundle git
      antigen bundle command-not-found

      antigen bundle zsh-users/zsh-autosuggestions
      antigen bundle zsh-users/zsh-syntax-highlighting

      antigen theme gentoo

      antigen apply

      set -o vi

      alias vim="nvim"
      alias ls="exa"

    ''
}
