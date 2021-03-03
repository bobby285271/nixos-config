{ config, pkgs, ... }:

{
    fonts = {
		enableDefaultFonts = true;
		fontconfig.enable = true;
		fontDir.enable = true;
		enableGhostscriptFonts = true;
		fonts = with pkgs; [
			noto-fonts
			noto-fonts-cjk
			noto-fonts-emoji
			wqy_microhei
			wqy_zenhei
		];
	};
}
