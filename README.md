 <!-- Markdown for HTML lol: https://michelf.ca/projects/php-markdown/extra/#markdown-attr -->
# Hackintosh Guide for **Asus FX504GE** and **GD** models

**This guide it's updated to OpenCore 0.8.3 and tested on my main device.**
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
<summary><h3>Making the Booteable USB</h3></summary>
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
<summary><h3>BIOS Settings:</h3></summary>
 
- Make Sure you have [Latest BIOS v323](https://www.asus.com/supportonly/ASUS%20TUF%20GAMING%20FX504/HelpDesk_Download/)
- After Updating the BIOS, stock configuration works, so don't worry about this part.
---
 
</details>
<!-- BIOS END -->

<!-- OpenCore START -->
<details>
<summary><h3>OpenCore Configuration</h3></summary>

## ⋁ ACPI
### Add
1. `SSDT-PLUG.aml` (Allows for native CPU power management)
2. `SSDT-PMC` (Enable Native NVRAM for HM370 MotherBoard)
3. `SSDT-dGPU-Off.aml` (PowerOff GTX 1050Ti)
4. `SSDT-EC-USBX.aml` (Fix the embedded controller and USB power)
5. `SSDT-PNLF-CFL.aml` (Backlight support for Coffee Lake machines)
6. `SSDT-XOSI.aml` (This is for Trackpad ELAN HID)
7. `SSDT-USBMap.aml` (All Ports Mapped Correctly)

### Patch
1. `Rename _OSI to XOSI` (Important for trackpad (Without this patch trackpad is not gonna work))
 
| 0 | Dictionary | 12 key/value pairs |
|:--- |:---:|:--- |
| Comment  | String | Change _OSI to XOSI |
| Find | Data | 5F4F5349 |
| Replace | Data | 584F5349 |

### Quirks
**Enabled:**
1. `ResetLogoStatus` (Recomended for correctly displaying Apple logo  on Boot)

## ⋁ Booter
### Quirks
**Enabled:**
1. `AvoidRuntimeDefrag` (Fixes for common NVRAM properties)
2. `EnableSafeModeSlide` (Needed for something called KASLR)
3. `ProvideCustomSlide` (Needed for something called KASLR)
4. `RebuildAppleMemoryMap` (Makes the current Memory Map compatible to Apple's Expected one)
5. `SetupVirtualMap` (Fix for virtual memory accessing)
6. `SyncRuntimePermissions` (Fix for permission memory over OpenRuntime) 


## ⋁ DeviceProperties
### Add
| PciRoot(0x0)/Pci(0x2,0x0) | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| AAPL,ig-platform-id  | DATA | 00009B3E |
| device-id | DATA | 9B3E0000 |
| AAPL,slot-name | String | Internal@0,2,0 |
| enable-hdmi20 | DATA | 01000000 |
| framebuffer-unifiedmem | DATA | 000080BE |
| framebuffer-con1-busid | DATA | 01000000 |
| framebuffer-con1-enable | DATA | 01000000 |
| framebuffer-con1-flags | DATA | 87010000 |
| framebuffer-con1-has-lspcon | DATA | 01000000 |
| framebuffer-con1-index | DATA | 01000000 |
| framebuffer-con1-pipe | DATA | 12000000 |
| framebuffer-con1-preferred-lspcon-mode | DATA | 01000000 |
| framebuffer-con1-type | DATA | 00080000 |
| framebuffer-patch-enable | DATA | 01000000 |
| model | String | Intel UHD 630 |

| PciRoot(0x0)/Pci(0x1f,0x3) | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| layout-id  | DATA | 01000000 |

**What does each thing:**
- `AAPL,ig-platform-id` (iGPU Real id)
- `device-id` (Fake id)
- `AAPL,slot-name` (Internal iGPU Indentifier)
- `enable-hdmi20` (Enable 4K monitors and HDR content)
- `framebuffer-unifiedmem` (Increase VRAM from 1536 MB to 3048 MB)
- `framebuffer-patch-enable` (Enable framebuffer patches)
- `model` (Name Showed in *About This Mac*)
- `layout-id` (Sets the audio port to 3)
 

## ⋁ Kernel
### Add
**ORDER MATTER!** Think about which kexts should load before which.
1. [Lilu](https://github.com/acidanthera/lilu/releases) (First)
2. [VirtualSMC](https://github.com/acidanthera/VirtualSMC/releases) (Second)
   - SMCProcessor
   - SMCSuperIO
   - SMCBatteryManager
3. [WhateverGreen](https://github.com/acidanthera/WhateverGreen/releases) (Graphics)
4. [VoodooPS2Controller](https://github.com/acidanthera/VoodooPS2/releases) (PS/2 keyboard)
5. [RealtekRTL8111](https://github.com/Mieze/RTL8111_driver_for_OS_X/releases) (LAN internet)
6. [AppleALC](https://github.com/acidanthera/AppleALC/releases) (Audio)
7. [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C/releases) (Trackpad Support)
   - VoodooI2CHID

### Force
We need to force `IO80211Family.kext` from `System/Library/Extensions` to have complete support of Airportitlwm.kext for WiFi.

### Quirks
**Enabled:**
1. `AppleXcpmCfgLock` (We don't have options to unlock de CFG-Lock on the BIOS)
2. `DisableIoMapper` (If you have VT-d enabled on the BIOS (Prefered))
3. `DisableLinkeditJettison`
4. `PanicNoKextDump`
5. `PowerTimeoutKernelPanic`
6. `XhciPortLimit` (Needed for USBs type XHCI)

### Security
**Enabled:**
1. `AllowNvramReset` (For RESET the NVRAM on picker selector)
2. `AllowSetDefault` (Default disk for multiboot)
3. `BlacklistAppleUpdate` (Stop reciving updates for Macs BIOS)
- `ScanPolicy` 0
- `SecureBootModel` Default
- `Vault` Optional

### Tools
Remove from `EFI/OC/Tools` everything

## NVRAM
### Add
| 7C436110-AB2A-4BBB-A880-FE41995C9F82 | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| boot-args  | String | -v keepsyms=1 debug=0x100 alcid=3 -wegnoegpu  -igfxnohdmi -igfxblr agdpmod=vit9696 |
| run-efi-updater | String | No |
| csr-active-config | DATA | 00000000 |
| prev-lang:kbd | String | en-US:0 |   

**What does each thing:**
- `boot-args` (Boot Arguments)
   - `-v keepsyms=1 debug=0x100` (Debuging)
   - `alcid=3` (Sets de audio to port 3)
   - `-wegnoegpu` (Disable dGPU GTX 1050 Ti)
   - `-igfxnohdmi` ()
   - `-igfxblr` (Fix Backlight issue on Coffe Lake laptops)
   - `agdpmod=vit9696` (Disable board-id checker **ESSENTIAL FOR HDMI OUTPUT**)
- `run-efi-updater` (Disable macOS updates to EFI)
- `csr-active-config` (SIP configuration (Enabled), For more: [Disabling SIP](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/post-issues.html#disabling-sip))
- `prev-lang:kbd` (Sets custom language, For more: [AppleKeyboardLayouts.txt(opens new window)](https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/AppleKeyboardLayouts/AppleKeyboardLayouts.txt)

### Delete
Ignore

### LegacySchema
Ignore, we have native NVRAM

### WriteFlash `Enable`


## PlatformInfo
### Automatic `enabled`

### Generic
Download [GenSMBIOS (opens new window)](https://github.com/corpnewt/GenSMBIOS), and open the *GenSMBIOS.command* with *Right-Click > Open*, follow the intructions on the Terminal Window.

| Generic | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| AdviseWindows  | Boolean | False |
| SystemMemoryStatus | String | Auto |
| MLB | String | *Generate your own with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)* |
| ProcessorType | Number | 0 |
| ROM | DATA | *[Your own MAC Address](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#derive-the-corresponding-rom-value)* |
| SpoofVendor | Boolean | True |
| SystemProductName | String | MacBookPro15,3 |
| SystemSerialNumber | String | *Generate your own with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)* |
| SystemUUID | String | *Generate your own with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)* |

**These values are masked from the provided config file, make sure you enter your own before testing!**

**UpdateDataHub `Boolean` `Enable`**

**UpdateNVRAM `Boolean` `Enable`**

**UpdateSMBIOS `Boolean` `Enable`**

**UpdateSMBIOSMode `String` `Create`**

**UseRawUuidEncoding** `Boolean` `False`**

## UEFI
### ConnectDrivers `Boolean` `enabled`

### APFS
Leave everything default

### Audio
For now leave everything default

### Drivers (must-have)
1. `OpenRuntime.efi`
2. `HFsPlus.efi`
3. `OpenCanopy.efi`

### Input
Ignore

### Output
Ignore

### ProtocolsOverride
Ignore

### Quirks
**Enabled:**
1. `DeduplicateBootOrder`
2. `ReleaseUsbOwnership` (Mainly for USB fixes)
3. `RequestBootVarRouting` (Redirects some Variables for macOS)

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


 @@@@@Shown on [config.plist](/RELEASE/EFI/OC/config.plist)
