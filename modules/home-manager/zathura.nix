{ config, lib, pkgs, user, ... }:

{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set font "Iosevka Nerd Font normal 9"
      set default-fg                "#bdbdbd"
      set default-bg 			          "#080808"

      set completion-bg		          "#80a0ff"
      set completion-fg		          "#bdbdbd"
      set completion-highlight-bg	  "#080808"
      set completion-highlight-fg	  "#bdbdbd"
      set completion-group-bg		    "#080808"
      set completion-group-fg		    "#80a0ff"

      set statusbar-fg		          "#bdbdbd"
      set statusbar-bg		          "#080808"

      set notification-bg		        "#080808"
      set notification-fg		        "#bdbdbd"
      set notification-error-bg	    "#080808"
      set notification-error-fg	    "#ff5454"
      set notification-warning-bg	  "#080808"
      set notification-warning-fg	  "#e3c78a"

      set inputbar-fg			          "#bdbdbd"
      set inputbar-bg 		          "#080808"

      set recolor                   "true"
      set recolor-lightcolor		    "#080808"
      set recolor-darkcolor		      "#bdbdbd"

      set index-fg			            "#bdbdbd"
      set index-bg			            "#080808"
      set index-active-fg		        "#bdbdbd"
      set index-active-bg		        "#080808"

      set render-loading-bg		      "#080808"
      set render-loading-fg		      "#bdbdbd"

      set highlight-color		        "#080808"
      set highlight-fg              "#ae81ff"
      set highlight-active-color	  "#ae81ff"
    '';
  };
}
