# DaVinciResolveTinyRemote
A Tiny piece of software enable you to make USB / Bluetooth Panel Network Access

It all start when I needed to connect panel to the workstation in difference room.
Normal KVM only transmits Mouse and Keyboard but not the panel data. Commercial solution will be icron usb extender or even use LAN port on Mini/Adv panel.
Davinci Resolve already has Remote panel ability to share panel data over network but you have to install entire DaVinci Resolve just to access this function.

This give me idea of stripped just the script responsible for Remote Panel daemon resulting in merely 1.4MB piece of software to installed.

DISCAIMER : I didn't make this software from the ground up, this is just stripping original files from Resolve itself just essential for this purpose.

This software has been tested on X86-64 Windows X-Lite Micro 10 and also Windows11 ARM.

Tested on Dell WYSE 3040 Thin Client.


![IMG_0297](https://github.com/user-attachments/assets/ab7a1658-a783-4715-b590-f2ae8a24467d)
This PC consume less than 15W of power and cool operation without fan suited for quiet environment.
The Flash storage only has 8GB so please use tiniest windows possible, Windows X-Lite Micro 10 in my case.


HOW TO INSTALL : 
- Unzip the package
- Install "VC_redist.x64" required default of Resolve (26MB) from here https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170 
- Run the "DaVinciResolveTinyRemote.bat"
  The .BAT file will create C:\Program Files\Blackmagic Design\DaVinci Resolve\ and copy DaVinciPanelDaemon.exe into it
  also create C:\Users\XXX\AppData\Roaming\Blackmagic Design\DaVinci Resolve\Support\logs (required by the daemon)
  and lastly create shortcut of DaVinciRemotePanel.bat and DaVinciRemoteAdvPanel.bat on desktop so you can easily execute it.
- NOW ENJOY !!!!!

FOR MORE Spicy seasoning to make more use of this computer.
- https://www.usb-over-network.com/usb-over-network-download.html from FabulaTech to share every ports of the device over network.
- run "shell:startup" and put DaVinciRemotePanel.bat or DaVinciRemoteAdvPanel.bat to make it auto start with windows
- TAILSCALE or WIREGUARD on windows, While Mini/Advance panel already has LAN port, the hassle to make it transmit to somewhere else outside your network without
  using VPN router or Pi might rather timeconsuming. by using VPN service like TAILSCALE or WIREGUARD might streamlined the workflow for grading over internet
