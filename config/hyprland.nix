{config, ...}:

{

wayland.windowManager.hyprland.settings = {
  "$mod" = "SUPER";
  "$fileManager" = "Thunar";
  "$terminal" = "kitty";
  "$menu" = "hyprlauncher";
  exec-once  = [
  "hyprpanel"
  "hyprpaper"
  "steam --console"
  "discord"
  "systemctl --user start hyprpolkitagent"
  "udiskie"
  "wl-paste --type text --watch cliphist store"
  "wl-paste --type image --watch cliphist store"
  ]

  monitor = "DP1,1920x1080@144,auto,auto";

  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  misc = {
    force_default_wallpaper = -1;
    disable_hyprland_logo = true;
  };

  decoration = {
    rounding = 10;
    active_opacity = 1;
    inactive_opacity = 0.8;

    shadow = {
      enabled = true;
      range = 4;
      render_power = 3;
      color = "rgba(1a1a1aee)";
    };

    blur = {
      enabled = true;
      size = 3;
      passes = 2;
      vibrancy = 0.1696;
    };
  };

   animations = {
    enabled = true;

    bezier = [
     "easeOutQuint, 0.23,1,0.32,1"
     "easeInOutCubic, 0.65,0.05,0.36,1"
     "linear, 0,0,1,1"
     "almostLinear, 0.5,0.5,0.75,1.0"
     "quick, 0.15,0,0.1,1"
    ];

    animation = [
     "global, 1, 10, default"
     "border, 1, 5.39, easeOutQuint"
     "windows, 1, 4.79, easeOutQuint"
     "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
     "windowsOut, 1, 1.49, linear, popin 87%"
     "fadeIn, 1, 1.73, almostLinear"
     "fadeOut, 1, 1.46, almostLinear"
     "fade, 1, 3.03, quick"
     "layers, 1, 3.81, easeOutQuint"
     "layersIn, 1, 4, easeOutQuint, fade"
     "layersOut, 1, 1.5, linear, fade"
     "fadeLayersIn, 1, 1.79, almostLinear"
     "fadeLayersOut, 1, 1.39, almostLinear"
     "workspaces, 1, 1.94, almostLinear, fade"
     "workspacesIn, 1, 1.21, almostLinear, fade"
     "workspacesOut, 1, 1.94, almostLinear, fade"
   ];
  };

  bind =
    [
      "$mod, D, exec, $menu"
      "$mod, RETURN, exec, $terminal"
      "$mod, Q, killactive"
      "$mod, E, exec, $fileManager"
      "$mod, L, exec, systemctl restart hyprpanel"
      "CTRL+ALT+DEL, exec, sudo systemctl restart sddm"
      "$main, left, movefocus, l"
      "$main, right, movefocus, r"
      "$main, up, movefocus, u"
      "$main, down, movefocus, d"
    ]
    ++ (
      builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
          "$mod, code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
        ]
      ) 9)
    );

  bindel = [
    "XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    "XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    "XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    "XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    "XF86MonBrightnessUp, exec, brightnessctl s 10%+"
    "XF86MonBrightnessDown, exec, brightnessctl s 10%-"
  ];

  windowrule = [
    "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$"
    "tag +games, class:^(gamescope)$"
    "tag +games, class:^(steam_app_\\d+)$"
    "tag +gamelaunch, title:^([Ll]utris)$"
    "tag +im, class:^([Dd]iscord)$"
    "tag +file-manager, class:^([Tt]hunar)$"
    "tag +codeeditor, class:^(VSCode|code-url-handler)$"
    "tag +screanshare, class:(obs-studio)$"
    "workspace 1, tag:browser*"
    "workspace 5, tag:codeeditor*"
    "workspace 2, tag:gamelaunch*"
    "workspace 3, tag:im*"
    "workspace 4, tag:games*"
    "workspace 6, tag:*screanshare*"
    "suppressevent maximize, class:.*"
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
services.hyprpaper.enable = true;
services.hyprpaper.settings = {
    ipc = "on";
    splash = true;
    splash_offset = 2.0;
    preload = "/home/rysieko/wallpaper.png";
    wallpaper = "DP-1,/home/rysieko/wallpaper.png";
  };
}  