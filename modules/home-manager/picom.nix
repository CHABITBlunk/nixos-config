{ config, pkgs, lib, ... }:
{
	services.picom = {
		enable = true;
		package = pkgs.picom;
		extraArgs = [ "--experimental-backends" ];
		settings = {
			# animations
			animations = true;
			animation-stiffness = 400;
			animation-window-mass = 0.8;
			animation-dampening = 40;
			animation-clamping = false;
			animation-for-open-window = "zoom";
			animation-for-unmap-window = "zoom";
			
			# shadows
			shadow = false;

			# fading
			fading = true;
			fade-in-step = 0.03;
			fade-out-step = 0.03;
			fade-delta = 4;

			# transparency/opacity
			inactive-opacity = 1.0;
			frame-opacity = 1.0;

			# corners
			corner-radius = 0;
			
			# general settings
			vsync = true;
			backend = "glx";
			detect-client-opacity = true;
			detect-rounded-corners = true;
			mark-wmwin-focused = true;
			mark-ovredir-focused = true;
			wintypes = {
				tooltip = { fade = true; shadow = false; opacity = 1.0; focus = true; full-shadow = false; };
				dock = { shadow = true; };
				dnd = { shadow = true; };
				popup_menu = { opacity = 1.0; };
				dropdown_menu = { opacity = 1.0; };
			};
		};
	};
}
