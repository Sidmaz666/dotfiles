####IMPORTING-QTILE-LIBRARIES####
##GROUPS-KEYS-LAYOUTS-SCREEN-MOUSE##

import os
import re
import subprocess
import json

from libqtile import qtile
from typing import List 
from libqtile.config import Key, Group, ScratchPad, DropDown, Key, Drag, Click, Screen, Match
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook

####KEYS-START####

##SUPER/WINDOWS-KEY##

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

## Key([mod,"control"], "d", lazy.layout.normalize(), desc="Reset all window sizes"),

Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

Key(["control"], "space", lazy.spawn('kitty'), desc="Launch terminal"),

Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),

Key([mod,"control"], "f", lazy.window.toggle_floating(), desc="Stack To Float, Float to stack"),

Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),

Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

Key([mod], "space", lazy.spawn('rofi -show drun -show-icons -theme sm'), desc="Spawn Rofi run launcher"),

Key([mod,"shift"],"e", lazy.spawn('rofi -show emoji -modi emoji -theme gruvbox-dark'), desc="Rofi Emoji Picker"),

Key([mod], "b",lazy.spawn('brave'),desc="Browser"),

Key([mod],"v",lazy.spawn('copyq menu'), desc="Clipboard popup"),

Key([mod,"control"], "j", lazy.spawn( "pactl set-sink-volume @DEFAULT_SINK@ -5%"), desc="Volume Down"),
      
Key([mod,"control"], "k",lazy.spawn( "pactl set-sink-volume @DEFAULT_SINK@ +5%"), desc="Volume Up"),
     
Key([mod,"shift"], "a", lazy.spawn("brightnessctl set +10%"), desc="Increase Brightness"),

Key([mod, "shift"], "d",lazy.spawn("brightnessctl set 10%-"), desc="Decrease Brightness"),

Key([mod],"F1",lazy.spawn("SoundWireServer -nogui")),

Key([mod],"F2",lazy.spawn("killall -q SoundWireServer"), desc="SoundWire Server Start"),

Key([],"Print",lazy.spawn("flameshot gui"), desc="Screenshot Utility"),

Key([mod],"e",lazy.spawn("kitty .config/vifm/scripts/vifmrun"), desc="Terminal File Manager" ),

Key([mod],"f",lazy.spawn("thunar"), desc="GUI File Manager"),

Key([mod,"control"],"n",lazy.spawn("kitty -e nmtui"), desc="Terminal Network Settings"),

Key([mod,"control"],"p",lazy.spawn("killall -q picom"), desc="Kill Compositor"),

Key([],"F3", lazy.spawn("picom"), desc="Start Compositor"),

Key([mod],"l",lazy.spawn("betterlockscreen -l"), desc="Lock Screen"),

Key([mod,"control"],"d",lazy.spawn("sh /home/kurama/.config/qtile/scripts/cbg.sh"), desc="Change Background"),

Key([mod,"shift"],"r",lazy.spawn("killall -q ffmpeg"), desc="Kill FFMPEG Screen Recording"),

Key([mod,"control"],"h",lazy.spawn("/home/kurama/Documents/scripts/spiced-macho/spiced-macho.sh"), desc="Show Man Pages as PDF in Browser"),

Key([mod,"shift"], "k", lazy.spawn("/home/kurama/.config/qtile/scripts/qtile_kb_rofi.sh -c /home/kurama/.config/qtile/config.py"), desc="S h o w k e y b i n d i n g s!"),

Key([mod,"control"],"m",lazy.spawn("/home/kurama/Documents/scripts/rofi-calc.sh"), desc="Rofi Calculator"),

Key([mod, "shift"],"g", lazy.spawn("/home/kurama/Documents/scripts/toggleBar.sh"), desc="Hide Show Bar"),

#Key([mod, "control"],"g", lazy.spawn("killall -qe toggleBar.sh"), desc="Disable Zen Mode"),

]


####STARTUP-HOOK####

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

####START-GROUPS#####

####THEME####
##COLORS##
colors= dict(
    dark= "#212121",
    grey= "#353c4a",
    light= "#f1ffff",
    text= "#0f101a",
    focus= "#a151d3",
    active= "#baf7e8",
    inactive= "#4c566a",
    urgent=  "#F07178",
    color1=  "#b8b814",
    color2= "#eb4747",
    color3= "#39ac39",
    color4= "#c639a3" )

####LAYOUTS####

##LAYOUT-COLOR-WINDOW-DECORATION##

layout_conf = {
    'border_focus':"#ffffff",
    'border_width': 2,
    'border_normal': "#666666",
    'margin': 5
}

##ACTIVE-LAYOUTS##

layouts = [

layout.Columns(**layout_conf),
layout.Max(),

#layout.Max(),
#layout.MonadTall(**layout_conf),
#layout.MonadWide(**layout_conf),
#layout.Bsp(**layout_conf),
#layout.Matrix(columns=2, **layout_conf),
#layout.RatioTile(**layout_conf),
#layout.Tile(**layout_conf),
#layout.TreeTab(sections=[""], section_top=0, panel_width=35),
#layout.VerticalTile(**layout_conf),
#layout.Zoomy(columnwidth=50, margin=0, property_big='1.0', property_name='ZOOM',property_small='0.1'),
]
####SCREENS####

#def status_bar(widgets):
#    return bar.Bar(widgets, 23, opacity=0.75)

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

def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
       # text="\u25E2",
       text="❮",
        fontsize=23,
        padding=3
    )

def powerline1(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
       # text="\u25E4",
       text= " ❯",
        fontsize=23,
        padding=3
    )

def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['color3'],
            inactive=colors['light'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['color2'],
            this_current_screen_border=colors['text'],
            this_screen_border=colors['dark'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=False),]

#secondary_widgets = [
#*workspaces(),
#separator(),
#powerline1('light', 'dark'),
# widget.WindowName(**base(fg='light'), fontsize=14),
#widget.WindowCount(**base(fg='active', bg='dark'), fontsize=14, text_format='{num} ', show_zero=True),
#widget.CurrentLayoutIcon(**base(bg='dark', fg='light'), scale=1),
#widget.CurrentLayout(**base(bg='dark', fg='light'), padding=5),
#powerline1('light', 'dark'),
#widget.Clock(**base(bg='dark', fg='light'), format='%c '),

#widget.TaskList(**base(bg='dark',fg='light'), fontsize=18, margin=0, highlight_method="block", markup_focused="<span underline='low'>{}</span>", title_width_method='uniform', boderwidth=0,font="Iosevka", border='#00111a', urgent_border='dark' ),

#separator(),

#widget.Notify(**base(bg='dark', fg="light"), padding=5, max_chars=10,default_timeout=3, action=True),

#widget.WindowCount(**base(fg='light', bg='dark'), fontsize=14, text_format='{num} ', show_zero=True),
    
#widget.CurrentLayoutIcon(**base(bg='dark', fg='light'), scale=0.7),

#widget.CurrentLayout(**base(bg='dark', fg='light'), padding=5),

#]

widget_defaults = dict(
    font='Iosevka',
    fontsize= 18,
    padding= 1,
)

extension_defaults = widget_defaults.copy()

##SCREEN-BAR

screens = [Screen(
# Set Wallpaper Natively
#  wallpaper='',
#  wallpaper_mode='fill',

top=bar.Bar([

 widget.Image(**base(bg='dark') ,filename="~/.config/qtile/icons/menu.png", scale = "True",margin_x=5, margin=3,mouse_callbacks = {"Button1": lambda: os.system("rofi -show drun -show-icons -theme sm")}),

*workspaces(),
 
widget.CurrentLayoutIcon(**base(bg='dark',fg="light"), scale=0.75), widget.WindowCount(**base(fg='light', bg='dark'), fontsize=14, text_format='[{num}]', show_zero=True, padding=1),

powerline1('light','dark'),

widget.Memory(**base(fg='light',bg='dark'), fontsize=15, format=' [{MemUsed:.0f}{mm}/6.8G] : ', padding=1 ),

 widget.CPU(**base(fg='light',bg='dark'), fontsize=15, padding=1,format='({load_percent}%)'),

powerline1('light','dark'),
       
widget.Clock(**base(bg='dark',fg="light"), format=' %b-%d~%l:%M:%S %p ', padding=0),

#powerline1('light','dark'),
#powerline1('color3','dark'),
#separator(),
#widget.WindowName(**base(fg='light'), fontsize=14),
#powerline1('light','dark'),

widget.TaskList(**base(bg='dark', fg='light'), fontsize=15, margin=0, highlight_method="block", markup_focused="<span weight='bold' underline='low'>{}</span>", title_width_method='uniform', boderwidth=0,font="Iosevka", border='#212121', urgent_border='#000000', rounded=False, txt_floating="🗗", txt_maximized="🗖", txt_minimized="" ),

#widget.CPU(**base(fg='light',bg='dark'), fontsize=15, padding=1),
#powerline1('light','dark'),
#powerline1('color1', 'dark'),
#powerline1('color2','dark'),
#powerline('light','dark'),
#powerline('focus','dark'),
#powerline('light','dark'),
#icon(bg="dark", fg="light", text=' '),  # Icon: nf-fa-feed

widget.Net(**base(bg='dark', fg="light"), interface='wlp1s0', padding=1, format='{down} ↓↑{up}'),
 

#widget.CurrentLayout(**base(bg='dark', fg="light"), padding=5),

powerline('active', 'dark'),
   
widget.Battery(**base(bg='dark',fg="light"),charge_char='',unknown_char=' ',discharge_char='', format= '{char} {percent:2.0%}', update_interval=10 ,padding=5),

powerline('light','dark'),
   
icon(bg='dark', fg="light",text='🔅'),  # Icon: nf-fa-feed

widget.Backlight(**base(bg='dark', fg="light"), padding=5, brightness_file="/sys/class/backlight/amdgpu_bl0/brightness", max_brightness_file="/sys/class/backlight/amdgpu_bl0/max_brightness"),

powerline('light','dark'),

icon(bg='dark',fg="light",text='🔊'),  # Icon: nf-fa-feed

widget.Volume(**base(bg='dark', fg="light")),

powerline('light','dark'),
 
# powerline('color3', 'dark'),

widget.Systray(background=colors['dark'], padding=5),
], 23, opacity=0.75 ))]

#bottom=status_bar(secondary_widgets))]

##FORMULTIPLE-MONITORS##

#xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"

#command = subprocess.run(
#xrandr,
#shell=True,
#stdout=subprocess.PIPE,
#stderr=subprocess.PIPE,
#)

#if command.returncode != 0:
#    error = command.stderr.decode("UTF-8")
#    logger.error(f"Failed counting monitors using {xrandr}:\n{error}")
#    connected_monitors = 1
#else:
#    connected_monitors = int(command.stdout.decode("UTF-8"))
#
#if connected_monitors > 1:
#    for _ in range(1, connected_monitors):
#        screens.append(Screen(top=status_bar(secondary_widgets)))

##DECLARING-GROUP##NERD-FONTS##

groups =[Group(i) for i in [ " ", " ", " ", " "," ", " ", ]]

##GROUP-SWITCH-KEYBINDING##
##GROUP-KB##

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([Key([mod], actual_key, lazy.group[group.name].toscreen(), desc="Change Workspaces"),
    Key([mod, "shift"], actual_key, lazy.window.togroup(group.name), desc="Send Window to n Workspace"), ])

####DROPDOWN-GROUPS####

##DROPDOWN-DECORATIONS

dropdown_conf = {
    'opacity': 0.8,
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
                'kitty /home/kurama/.config/vifm/scripts/vifmrun',
                **dropdown_conf
            ),
            DropDown(
                'htop',
                'kitty htop',
                **dropdown_conf
            ),
            DropDown(
                'anime',
                'kitty /home/kurama/Documents/scripts/extra/ani-cli',
                 **dropdown_conf
            ),
             DropDown(
                'sound',
                'pavucontrol',
                **dropdown_conf
            )
        ]
    )
)

####GROUP-KEYBOARD-BINDINGS####

keys.extend([

Key([mod], 't',lazy.group['sp'].dropdown_toggle('term') ),

Key( [mod,"control"], 'e', lazy.group['sp'].dropdown_toggle('filemanager') ),
        
Key( [mod], 'p', lazy.group['sp'].dropdown_toggle('htop') ),
         
Key( [mod,"control"], 'u', lazy.group['sp'].dropdown_toggle('anime') ),
            
Key([mod], 's',lazy.group['sp'].dropdown_toggle('sound') )])

###MOUSE####

mouse = [

Drag( [mod],"Button1",lazy.window.set_position_floating(),start=lazy.window.get_position()),

Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),

Click([mod], "Button2", lazy.window.bring_to_front())]


##FLOATING-LAYOUT-RULES##

floating_layout = layout.Floating(
float_rules=[{ 'wmclass': 'feh' },
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),
    Match(wm_class='makebranch'),
    Match(wm_class='maketag'),
    Match(wm_class='ssh-askpass'),
    Match(title='branchdialog'),
    Match(title='pinentry'),],
border_focus="#ffffff")



main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = True
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = 'smart'
wmname = 'qtile'
