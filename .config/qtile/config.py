import os
import re
import subprocess
import json

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

####THEME####
##COLORS##
colors= dict(
    dark= "#212121",
    grey= "#353c4a",
    light= "#f1ffff",
    white= "#FFFFFF",
    text= "#0f101a",
    active= "#baf7e8",
    inactive= "#4c566a",
    lightgrey="#6f6f6f"
    )

####WIDGETS####

def base(fg='text', bg='dark'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)

def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=0
    )

mod = "mod4"

keys = [

Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),

Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),

Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),

Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),

Key([mod,"control"], "space", lazy.layout.next(),desc="Move window focus to other window"),

Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),

Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),

Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),

Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),

Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),

Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),

Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),

Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

Key(["control"], "space", lazy.spawn('kitty'), desc="Launch terminal"),

Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),

Key([mod,"control"], "f", lazy.window.toggle_floating(), desc="Stack To Float, Float to stack"),

Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),

Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

Key([mod], "space", lazy.spawn('rofi -show drun -modi drun,window,run -show-icons -theme dmenu'), desc="Spawn Rofi run launcher"),

Key([mod,"shift"],"e", lazy.spawn('rofi -show emoji -modi emoji -theme gruvbox-dark'), desc="Rofi Emoji Picker"),

Key([mod], "b",lazy.spawn('brave --app="file:///home/random/.cache/StartTree/index.html"'),desc="Browser"),

Key([mod],"v",lazy.spawn('copyq menu'), desc="Clipboard popup"),

Key([mod,"control"], "j", lazy.spawn( "/home/random/.config/qtile/scripts/soundd.sh"), desc="Volume Down"),
      
Key([mod,"control"], "k",lazy.spawn("/home/random/.config/qtile/scripts/soundi.sh"), desc="Volume Up"),
     
Key([mod,"shift"], "a", lazy.spawn("/home/random/.config/qtile/scripts/brgti.sh"), desc="Increase Brightness"),

Key([mod, "shift"], "d",lazy.spawn("/home/random/.config/qtile/scripts/brgtd.sh"), desc="Decrease Brightness"),

Key([],"Print",lazy.spawn("flameshot gui"), desc="Screenshot Utility"),

Key([mod],"e",lazy.spawn("kitty /home/random/.config/vifm/scripts/vifmrun"), desc="Terminal File Manager" ),

Key([mod],"f",lazy.spawn("thunar"), desc="GUI File Manager"),

Key([mod,"control"],"n",lazy.spawn("kitty -e nmtui"), desc="Terminal Network Settings"),

Key([mod,"control"],"p",lazy.spawn("killall -q picom"), desc="Kill Compositor"),

Key([],"F3", lazy.spawn("picom"), desc="Start Compositor"),

Key([mod],"l",lazy.spawn("betterlockscreen -l dimblur"), desc="Lock Screen"),

Key([mod,"shift"],"r",lazy.spawn("killall -q ffmpeg"), desc="Kill FFMPEG Screen Recording"),

Key([mod,"control"],"m",lazy.spawn("/home/random/Documents/scripts/rofi-calc.sh"), desc="Rofi Calculator"),

Key([mod, "shift"],"g", lazy.spawn("qtile cmd-obj -o cmd -f hide_show_bar -a top"), desc="Hide Show Bar"),

Key([mod, "shift"], "f",lazy.window.toggle_minimize(),lazy.group.next_window(),lazy.window.bring_to_front(), desc="Toggle Between Floating Windows"),

Key([mod,"shift"], "z", lazy.spawn("/home/random/Documents/scripts/powermenu/powermenu.sh"), desc="Show Power Menu"),

Key([mod,"control"],"g", lazy.spawn("/home/random/Documents/scripts/rofi-color-picker/rofi-color-picker/rofi-color-picker"), desc="Show Color Picker"),

Key([mod,"control"],"i", lazy.spawn("/home/random/Documents/scripts/rofi-fontawesome/fontawesome-menu/fontawesome-menu -f /home/random/Documents/scripts/rofi-fontawesome/unicode-list.txt -o '-theme gruvbox-dark'"), desc="Show Icons"),

Key([mod], "F3", lazy.spawn("killall -q mpv"), desc="Kill all Music/Videos MPV"),


Key([mod,"control"], "t", lazy.spawn("brave --app='https://www.monkeytype.com'"), desc="MonkeyTyping Practice"),

Key([mod,"control"], "w", lazy.spawn("brave --app='https://web.whatsapp.com'"), desc="WhatsApp"),

Key([mod,"control"], "u", lazy.spawn("unipicker --copy --command 'rofi -dmenu -p Unicode -theme gruvbox-dark'"), desc="Unicode Selector"),

Key([mod,"control"], "l", lazy.spawn("lyrica --rofi"), desc="Song Lyrics"),

]

##DECLARING-GROUP##NERD-FONTS##
groups =[Group(i) for i in [ 
"","","", "", "", ""
]]

##GROUP-SWITCH-KEYBINDING##
##GROUP-KB##

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([Key([mod], actual_key, lazy.group[group.name].toscreen(), desc="Change Workspaces"),
    Key([mod, "shift"], actual_key, lazy.window.togroup(group.name), desc="Send Window to n Workspace"), ])


layout_conf = {
    'border_focus':"#ffffff",
    'border_width': 2,
    'border_normal': "#666666",
    'margin': 5
}

##DROPDOWN-DECORATIONS

dropdown_conf = {
    'opacity': 0.93,
    'warp_pointer': True,
    'x' : 0.255,
    'y' : 0.20,
    'width' : 0.51,
    'height': 0.60 , 
}

##GROUPD##

groups.append(
    ScratchPad('sp', [
            DropDown(
                'term',
                'kitty',
                 **dropdown_conf
            ),
            DropDown(
                'filemanager',
                'kitty /home/random/.config/vifm/scripts/vifmrun',
                **dropdown_conf
            ),
            DropDown(
                'htop',
                'kitty htop',
                **dropdown_conf
            ),
            DropDown(
                'youtube',
                'kitty ytfzf',
                 **dropdown_conf
            ),
             DropDown(
                'sound',
                'pavucontrol',
                **dropdown_conf
            ),
        ]
    )
)

####GROUP-KEYBOARD-BINDINGS####

keys.extend([

Key([mod], 't',lazy.group['sp'].dropdown_toggle('term') ),

Key( [mod,"control"], 'e', lazy.group['sp'].dropdown_toggle('filemanager') ),
        
Key( [mod], 'p', lazy.group['sp'].dropdown_toggle('htop') ),
         
Key( [mod], 'y', lazy.group['sp'].dropdown_toggle('youtube') ),
            
Key([mod], 's',lazy.group['sp'].dropdown_toggle('sound') )])

layouts = [
layout.Columns(**layout_conf),
layout.Max(),
]

widget_defaults = dict(
    font='Iosevka',
    fontsize=15,
    padding=3,
)
extension_defaults = widget_defaults.copy()
def workspaces():
    return [
        widget.GroupBox(
            **base(fg='light'),
            font='Iosevka',
            fontsize=18,
            margin_y=3,
            margin_x=0,
            padding_y=0,
            padding_x=10,
            borderwidth=2.5,
            active= colors['white'] ,
            inactive= colors['lightgrey'],
            rounded=False,
            disable_drag=False,
            highlight_method='line',
            urgent_alert_method='block',
            urgent_border=colors['text'],
            this_current_screen_border=colors['light'],
            this_screen_border=colors['dark'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            ),]

screens = [
    Screen(
         wallpaper='/home/random/.config/qtile/wallpaper.jpg',
         wallpaper_mode='stretch',
        top=bar.Bar(
            [
                *workspaces(),
                widget.CurrentLayoutIcon(**base(bg='dark',fg="light"), scale=0.60), 
                widget.WindowCount(**base(fg='light', bg='dark'), fontsize=14, text_format='[{num}]', show_zero=True, padding=1),
                widget.Clock(**base(bg='dark',fg="light"), format=' <span size="large" weight="bold">%b-%d</span><span size="x-large"> %l:%M:%S %p</span> ', padding=0),
                widget.TaskList(**base(bg='dark', fg='light'), fontsize=15, margin=0, highlight_method="block", markup_focused="<span size='x-large' underline='low'>{}</span>", title_width_method='uniform', icon_size=20, boderwidth=0,font="Iosevka Term Medium", border='#212121', urgent_border='#212121', rounded=False, txt_floating="🗗", txt_maximized="🗖", txt_minimized="" ),
                icon(bg='dark',fg="light",text='', fontsize=16),
                widget.Net(**base(bg='dark', fg="light"), interface='wlp1s0', padding=5, format='{down} ↓↑{up}'),
                separator(),
                widget.Battery(**base(bg='dark',fg="light"),charge_char=' ',unknown_char=' ',discharge_char=' ', format= '{char}{percent:2.0%}', update_interval=10, fontsize=15, padding=5),
                icon(bg='dark',fg="light",text='  ', fontsize=15),
                widget.PulseVolume(**base(bg='dark', fg="light")),
                icon(bg='dark', fg="light",text='  ', fontsize=16),  
                widget.Backlight(**base(bg='dark', fg="light"), padding=5, brightness_file="/sys/class/backlight/amdgpu_bl0/brightness", max_brightness_file="/sys/class/backlight/amdgpu_bl0/max_brightness"),
                widget.Systray(**base(bg='dark',fg='light')),
            ],
            30, opacity=0.72 
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="feh" ),
        Match(wm_class="web.whatsapp.com" ),
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ] , **layout_conf
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
