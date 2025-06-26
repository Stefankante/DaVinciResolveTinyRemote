# DaVinciResolveTinyRemote
A Tiny piece of software enable you to make USB / Bluetooth Panel Network Access

DaVinci Resolve Tiny Remote is a lightweight solution that enables you to connect your DaVinci Resolve USB or Bluetooth control panels to a workstation over a network. 
This is incredibly useful if your grading panels are in a different room than your main workstation, 
a common scenario where standard KVM switches fall short by only transmitting mouse and keyboard data, not panel information.

While DaVinci Resolve itself offers remote panel capabilities, it requires installing the entire suite just to access this function. 
DaVinci Resolve Tiny Remote streamlines this by stripping down the necessary files to a mere 1.4MB installation, focusing solely on the remote panel daemon.

Please Note: This software is not built from scratch; Extracted essential set of files from the original DaVinci Resolve installation.

Compatibility & Performance

DaVinci Resolve Tiny Remote has been successfully tested on:

X86-64 Windows X-Lite Micro 10
Windows 11 ARM
Dell WYSE 3040 Thin Client: This particular setup is ideal for quiet environments as it consumes less than 15W of power and operates without a fan. 
Its 8GB flash storage necessitates a minimal Windows installation, such as Windows X-Lite Micro 10.

![IMG_0297](https://github.com/user-attachments/assets/ab7a1658-a783-4715-b590-f2ae8a24467d)

![Screenshot 2568-06-26 at 10 58 29](https://github.com/user-attachments/assets/37e58230-74ca-4511-a2ad-7a1e4bc36aa6)

Installation Guide

Getting DaVinci Resolve Tiny Remote up and running is straightforward:

Unzip the downloaded package.
- Install "VC_redist.x64": This is a required dependency for Resolve. 
You can download it from Microsoft's official site: https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170 (approximately 26MB).
- Run "DaVinciResolveTinyRemote.bat":
  This batch file automates the setup
      It creates C:\Program Files\Blackmagic Design\DaVinci Resolve\ and copies DaVinciPanelDaemon.exe into it.
      It also creates C:\Users\XXX\AppData\Roaming\Blackmagic Design\DaVinci Resolve\Support\logs, which is necessary for the daemon to function correctly.
      also creates shortcuts on your desktop: DaVinciRemotePanel.bat and DaVinciRemoteAdvPanel.bat, for easy execution.
ENJOY!!!!!!

FOR MORE Spicy seasoning to make more use of this computer.
- https://www.usb-over-network.com/usb-over-network-download.html from FabulaTech to share every ports of the device over network.
- run "shell:startup" and put DaVinciRemotePanel.bat or DaVinciRemoteAdvPanel.bat to make it auto start with windows
- TAILSCALE or WIREGUARD on windows, While Mini/Advance panel already has LAN port, the hassle to make it transmit to somewhere else outside your network without
  using VPN router or Pi might rather timeconsuming. by using VPN service like TAILSCALE or WIREGUARD might streamlined the workflow for grading over internet
