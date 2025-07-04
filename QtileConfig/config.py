# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
    # -------------------- Locker --------------------
    Key([mod], "l", lazy.spawn("i3lock -c 000000"), desc="Lock the screen"),


    # -------------------- Windows management --------------------
    # Management
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "r", lazy.reload_config(), desc="Reload the config"),   

    # Movement
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "Left",  lazy.layout.left(),  desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Up",    lazy.layout.up(),    desc="Move focus upward"),
    Key([mod], "Down",  lazy.layout.down(),  desc="Move focus downward"),
    
    # Resize
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Left",  lazy.layout.grow_left(),  desc="Grow window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "Up",    lazy.layout.grow_up(),    desc="Grow window upward"),
    Key([mod, "shift"], "Down",  lazy.layout.grow_down(),  desc="Grow window downward"),

    # Reposition
    Key([mod, "control"], "Left",  lazy.layout.shuffle_left(),  desc="Move window to the left"),
    Key([mod, "control"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control"], "Up",    lazy.layout.shuffle_up(),    desc="Move window upward"),
    Key([mod, "control"], "Down",  lazy.layout.shuffle_down(),  desc="Move window downward"),  


    # -------------------- Apps --------------------
    # Terminal
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Calculator
    Key([mod], "c", lazy.spawn("gnome-calculator"), desc="Launc calculator"),

    # Explorer
    Key([mod], "e", lazy.spawn("thunar")),

    # Microsoft edge dev
    Key([mod], "b", lazy.spawn("microsoft-edge-dev")),
    Key([mod, "control"], "b", lazy.spawn("microsofta-edge-dev --new-window")),
    Key([mod, "shift"], "b", lazy.spawn("microsoft-edge-dev --inprivate")),

    # VsCode
    Key([mod], "v", lazy.spawn("code")),

    # Rofi
    Key([mod], "m", lazy.spawn("rofi -show-icons -show drun")),
    Key([mod, "shift"], "m", lazy.spawn("rofi -show-icons -show run")),

    # Flameshot
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui")),

    # Ferdium 
    Key([mod], "f", lazy.spawn("ferdium")),

    # Pantallas
    Key([mod, "shift"], "p", lazy.spawn("arandr")),

    # Audio
    Key([mod, "shift"], "a", lazy.spawn("pavucontrol")),
    
    # WhatsApp
    Key([mod, "shift"], "w", lazy.spawn("microsoft-edge-dev --new-window https://web.whatsapp.com/")),

    # Spotify
    Key([mod], "s", lazy.spawn("microsoft-edge-dev --new-window https://open.spotify.com/")),


    # -------------------- Volume buttons --------------------
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),

    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
   
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
   

    # -------------------- Play buttons --------------------
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Toggle Play/Pause"),
    
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Previous track"),
     
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Next track"),


    # -------------------- Birghtness buttons --------------------
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

groups = [Group(i) for i in ["󰜫 Web", "  Src", " Code", " Dev", " Work", " Shell", "󰍡 ", " ", " "]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

layout_conf = {
    'border_normal': '#202020',
    'border_focus': '#808080',
    'border_width': 3,
    'margin': [10, 5, 10, 5],
}

layouts = [
    layout.Columns(**layout_conf),
    layout.Max(**layout_conf),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_conf),
    layout.MonadWide(**layout_conf),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='JetBrainsMono Nerd Font',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.GroupBox(
                    foreground=['#FFFFFF', '#FFFFFF'],
                    background=['#202020', '#202020'],
                    font='JetBrainsMono Nerd Font',
                    fontsize=15,
                    margin_y=2,
                    margin_x=5,
                    padding_y=8,
                    padding_x=8,
                    borderwidth=1,
                    active=['#FFFFFF', '#FFFFFF'],
                    inactive=['#AAAAAA', '#AAAAAA'],
                    rounded=False,
                    highlight_method='block',
                    urgent_alert_method='block',
                    urgent_border=['#F07178', '#F07178'],
                    this_current_screen_border=['#404040', '#404040'],
                    this_screen_border=['#353c4a', '#353c4a'],
                    other_current_screen_border=['#101010', '#101010'],
                    other_screen_border=['#151515', '#151515'],
                    disable_drag=True
                ),
                widget.TextBox(
                    fontsize=15,
                    padding=15,
                    text="󰘵"),
                # widget.Prompt(),
                widget.WindowName(
                    fontsize=15,
                ),
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(
                    fontsize=14,
                    background=['#202020', '#202020'],
                    padding=15,
                    format=" %d / %m / %Y  󰕯 %A   %I:%M %p"
                ),
            ],
            25,
            opacity=0.85
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
        Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.GroupBox(
                    foreground=['#FFFFFF', '#FFFFFF'],
                    background=['#202020', '#202020'],
                    font='UbuntuMono Nerd Font',
                    fontsize=15,
                    margin_y=2,
                    margin_x=0,
                    padding_y=8,
                    padding_x=8,
                    borderwidth=1,
                    active=['#FFFFFF', '#FFFFFF'],
                    inactive=['#AAAAAA', '#AAAAAA'],
                    rounded=False,
                    highlight_method='block',
                    urgent_alert_method='block',
                    urgent_border=['#F07178', '#F07178'],
                    this_current_screen_border=['#404040', '#404040'],
                    this_screen_border=['#353c4a', '#353c4a'],
                    other_current_screen_border=['#101010', '#101010'],
                    other_screen_border=['#151515', '#151515'],
                    disable_drag=True
                ),
                widget.TextBox(
                    fontsize=15,
                    padding=15,
                    text="󰘵"),
                # widget.Prompt(),
                widget.WindowName(
                    fontsize=15,
                ),
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(
                    fontsize=14,
                    background=['#202020', '#202020'],
                    padding=15,
                    format=" %d / %m / %Y  󰕯 %A   %I:%M %p"
                ),
            ],
            25,
            opacity=0.85
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_focus='#DDDDDD'
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
