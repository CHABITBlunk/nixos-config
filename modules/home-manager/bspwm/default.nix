{ config, lib, pkgs, ... }:

{
	xsession = {
		enable = true;
		windowManager.bspwm = {
			enable = true;
			startupPrograms = [
				"sxhkd"
				"eww -c $HOME/.config/eww/bar open bardp"
				"eww -c $HOME/.config/eww/bar open barhdmi"
				"picom -b"
				"feh --bg-scale ${./bg/forbidden-city.jpeg}"
			];
			monitors = {
				# left
				DP-0 = ["一" "二" "三" "四" "五"];
				# right
				HDMI-0 = ["六" "七" "八" "九" "十"];
			};
			settings = {
				pointer_modifier = "mod4";
				border_width = 3;
				window_gap = 5;
				split_ratio = 0.5;
				focus_follows_pointer = true;
				borderless_monocle = false;
				gapless_monocle = false;
				normal_border_color = "#323437";
				focused_border_color = "#ae81ff";
				urgent_border_color = "#ff5454";
				active_border_color = "#484f58";
			};
		};
	};
	services.sxhkd = {
		enable = true;
		keybindings = {
			"super + Return" = "kitty -e tmux";
			"super + @space" = "rofi -show drun";
			"super + x" = "firefox";
			"super + z" = "zathura";
			"super + d" = "discord";
			"super + s" = "signal-desktop";
			"super + shift + {q,r}" = "bspc {quit,wm -r}";
			"super + shift + w" = "bspc node -k";
			"super + ctrl + Escape" = "pkill -USR1 -x sxhkd";
			"super + {t,shift + t,f,@space}" = "bspc node -t {tiled,pseudo_tiled,floating,monocle}";
			"super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";
			"super + {_,shift +}{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
			"super + {_,shift +}{1-9,0}" = "bspc {desktop -f,node -d} {\"一\",\"二\",\"三\",\"四\",\"五\",\"六\",\"七\",\"八\",\"九\",\"十\"}";
			"super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
			"super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
			"super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";
		};
	};
}
