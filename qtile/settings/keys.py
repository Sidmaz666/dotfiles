from libqtile.config import Key
from libqtile.command import lazy
mod = "mod4"
keys = [
        #keys
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod,"control"], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "Left", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
  #  Key([mod,"control"], "d", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key(["control"], "space", lazy.spawn('kitty'), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod,"control"], "f", lazy.window.toggle_floating(), desc="Stack To Float, Float to stack"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "space", lazy.spawn('rofi -show drun -show-icons -theme sm'),
        desc="Spawn Rofi run launcher"),
    Key([mod,"shift"],"e", lazy.spawn('rofi -show emoji -modi emoji -theme gruvbox-dark'),
        desc="Rofi Emoji Picker"),
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
Key([mod,"shift"], "k", lazy.spawn("/home/kurama/.config/qtile/scripts/qtile_kb_rofi.sh -c /home/kurama/.config/qtile/settings/keys.py /home/kurama/.config/qtile/settings/groups.py"), desc="S h o w k e y b i n d i n g s!"),
Key([mod,"control"],"m",lazy.spawn("/home/kurama/Documents/scripts/rofi-calc.sh"), desc="Rofi Calculator"),
Key([mod, "shift"],"g", lazy.spawn("/home/kurama/Documents/scripts/toggleBar.sh"), desc="Hide Show Bar"),
#Key([mod, "control"],"g", lazy.spawn("killall -qe toggleBar.sh"), desc="Disable Zen Mode"),
]
