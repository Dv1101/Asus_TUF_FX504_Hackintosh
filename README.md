 <!-- Markdown for HTML lol: https://michelf.ca/projects/php-markdown/extra/#markdown-attr -->
# Hackintosh Guide for **Asus FX504GE** and **GD** models

**This guide it's updated to OpenCore 0.7.9 and tested on my main device.**
<!-- shields -->
<div>
    <!-- downloads -->
    <a href="https://github.com/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore/releases">
        <img src="https://img.shields.io/github/downloads/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore/total" alt="downloads"/>
    </a>
    <!-- version -->
    <a href="https://github.com/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore/releases/latest">
        <img src="https://img.shields.io/github/release/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore.svg" alt="latest version"/>
    </a>
    <!-- platform -->
    <a href="https://github.com/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore">
        <img src="https://img.shields.io/badge/platform-macOS-lightgrey.svg" alt="platform"/>
    </a>
</div>
</br></br>

![Asus FX504GE running macOS Big Sur](/Docs/Images/Asus-FX504-macOS.png)

[Amazon Page](https://www.amazon.es/dp/B07D4W2CY6/ref=cm_sw_em_r_mt_dp_gUF8FbYQW48NV) 1.199€ *purchased 18/09/2018*


## Specs:
| Component | Name |
|:--- |:---:|
| Motherboard:  | FX504GE **HM370** |
| CPU: | Intel i7-8750H |
| RAM: | 16GB **SK Hyinix** HMA82GS6CJR8N-VK 2666Mhz |
| iGPU: | Intel UHD 630 (Mobile) |
| dGPU: | NVIDIA GeForce GTX 1050 Ti (DISABLED) |
| NVMe: | Samsung 970 EVO Plus |
| HDD: | HGST HTS721010A9E630 |
| Wifi/BT: | Intel(R) Wireless-AC 9560 160MHz (Type CNVi) |
| Audio: | RealTek ALC255 |
| Ethernet: | Realtek RTL8111 |
| Trackpad: | ELAN1200 Precision TouchPad (Type HID) |
| Keyboard: | Standard PS/2 Keyboard |

![Asus FX504GE Layout](/Docs/Images/Guide/Asus-FX504GE-layout.png)
These are all the external ports of the laptop. (**They all work**)

### Working
- [x] **Tested with macOS High Sierra, Mojave, Catalina, Big Sur, and Monterrey**
- [x] **Wifi** (Thanks to [AirportItlwm.kext](https://github.com/OpenIntelWireless/itlwm/releases) and loading from system the kext: `IO80211Family.kext`)
- [x] **Bluetooth:** (Thanks to [IntelBluetoothFirmware.kext](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases) and [BlueToolFixup.kext](https://github.com/acidanthera/BrcmPatchRAM/releases))
- [x] **Audio:** Realtek ALC255 (Thanks to [AppleALC.kext](https://github.com/acidanthera/AppleALC/releases) with layout-id=30 setted in Device Properties) without HDMI stable output connection.
- [x] **USB:** All internal and external ports (Thanks to SSDT-EC-USBX-LAPTOP.aml)
- [x] **Ethernet:** Realtek RTL8111 (Thanks to RealtekRTL8111.kext)
- [x] **Trackpad:** (Working thanks to VoodooI2C.kext, VoodooI2CHID.kext and SSDT-XOSI.aml)
- [x] **HDMI:** Works almost perfect wen without audio.
- [x] **Shutdown:** Yes
- [x] **Restart:** Yes
- [x] **Sleep/Wake:** Yes

### Not working
- dGPU (Any support in Mojave and up).
- Continuity Features (not working for now, waiting on https://openintelwireless.github.io/).
- HDMI is not working correctly in combination with audio, I spent literally entire days researching on it, if you find something tell me please.


```bash
```

# INSTALLATION GUIDE

<!-- BOOTABLE START -->
<details>
<summary><h3>►  Making the Booteable USB</h3></summary>
    <h3>From macOS:</h3>
<p><a href="https://support.apple.com/en-us/HT201372"</a>Link to Apple's Guide</p>

**Download installers:** [Monterrey](https://apps.apple.com/es/app/macos-monterey/id1576738294?mt=12) - [Big Sur](https://itunes.apple.com/us/app/macos-big-sur/id1526878132) - [Catalina](https://itunes.apple.com/us/app/macos-catalina/id1466841314) - [Mojave](https://itunes.apple.com/us/app/macos-mojave/id1398502828) - [High Sierra](https://itunes.apple.com/us/app/macos-high-sierra/id1246284741)

1. Connect a >=16 GB pendrive.
2. Open *Disk Utility* and Erase the USB with the name: *MyVolume*.
3. Open *Terminal* and use the proper commands for your macOS installer:
- Monterrey: `sudo /Applications/Install\ macOS\ Monterrey.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`
- Big Sur: `sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`
- Catalina: `sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`
- Mojave: `sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`
- High Sierra: `sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`

![Terminal](/Docs/Images/Guide/BootableUSB.png)

### From Windows:

[**Link to Dortania's Guide**](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/winblows-install.html)

### From Linux:

[**Link to Dortania's Guide**](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/linux-install.html)

 ---
    
</details>
<!-- BOOTABLE END -->

<!-- BIOS START -->
<details>
<summary><h3>►  BIOS Settings:</h3></summary>
 
- Make Sure you have [Latest BIOS v323](https://www.asus.com/supportonly/ASUS%20TUF%20GAMING%20FX504/HelpDesk_Download/)
- After Updating the BIOS, stock configuration works, so don't worry about this part.
---
 
</details>
<!-- BIOS END -->

<!-- OpenCore START -->
<details>
<summary><h3>►  OpenCore Configuration</h3></summary>

#### [ACPI](/Docs/config.plist.md#acpi)
#### [Booter](/Docs/config.plist.md#booter)
#### [DeviceProperties](/Docs/config.plist.md#deviceproperties)
#### [Kernel](/Docs/config.plist.md#kernel)
#### [Misc](/Docs/config.plist.md#misc)
#### [NVRAM](/Docs/config.plist.md#nvram)
#### [PlatformInfo](/Docs/config.plist.md#platforminfo)
#### [UEFI](/Docs/config.plist.md#uefi)
---
 
</details>
<!-- OpenCore END -->

<!-- POST-INSTALL START -->
<details>
<summary><h3>►  Post Install (Important!!)</h3></summary>
 
Open Terminal.app and run those commands:
~~~
sudo rm /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
sudo rm /Library/Preferences/SystemConfiguration/preferences.plist
~~~
---
</details>
<!-- POST-INSTALL END -->

<!-- BENCHMARK START -->
<details>
<summary><h3>►  BenchMarks:</h3></summary>

#### Cinebench R23:
![Cinebench R23](/Docs/Images/Benchmarks/Cinebench_R23.png)

#### GeekBench 5:
![GeekBench 5_CPU Score](/Docs/Images/Benchmarks/GeekBench5_CPU.png)
![GeekBench 5_GPU Score](/Docs/Images/Benchmarks/GeekBench5_GPU.png)
https://browser.geekbench.com/v5/cpu/5707123
---

</details>
<!-- BENCHMARK END -->

# Credits

[Apple](https://apple.com) (macOS)

[OpenCore Team](https://github.com/acidanthera/OpenCorePkg) (Bootloader)

[Dortania](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake.html#starting-point) (Guide)

[PoomSmart](https://github.com/PoomSmart/ASUS-FX504GE-Hackintosh) (Some ideas for my build)

[MegaStood](https://github.com/MegaStood/Hackintosh-FX504GE-ES72) (Properties and boot argument for HDMI output)

---

### Future info links to write here:
https://www.tonymacx86.com/threads/uhd-630-no-hdmi-audio.265490/post-2178532
https://github.com/acidanthera/bugtracker/issues/1189
https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md
https://github.com/acidanthera/WhateverGreen
https://www.tonymacx86.com/threads/an-idiots-guide-to-lilu-and-its-plug-ins.260063/#Hacktool

I will look for this tomorrow
https://www.tonymacx86.com/threads/guide-general-framebuffer-patching-guide-hdmi-black-screen-problem.269149/#post-1885420


If this guide has been useful for you, don't forget to give me a star ⭐️❤️
