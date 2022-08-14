# Hackintosh Guide for **Asus FX504GE**
**This guide it's updated to OpenCore 0.8.3 and tested on my main device with macOS High Sierra, Mojave, Catalina, Big Sur, and Monterrey.**

<!-- START shields -->
<div>
    <!-- downloads --><a href="https://github.com/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore/releases">
        <img src="https://img.shields.io/github/downloads/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore/total" alt="downloads"/>
    </a>
    <!-- version --><a href="https://github.com/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore/releases/latest">
        <img src="https://img.shields.io/github/release/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore.svg" alt="latest version"/>
    </a>
     <!-- platform --><a href="https://github.com/RobyRew/ASUS-FX504GE-Hackintosh_OpenCore">
        <img src="https://img.shields.io/badge/platform-macOS-lightgrey.svg" alt="platform"/>
    </a>
</div>
</br>
<!-- END shields -->

![Asus FX504GE running macOS Big Sur](/Docs/Images/Asus-FX504-macOS.png)

# Specifications
Here's the [Amazon Link](https://www.amazon.es/dp/B07D4W2CY6/ref=cm_sw_em_r_mt_dp_gUF8FbYQW48NV) for this exact model, *it cost me 1.199€ when purchased on 18/09/2018*

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
><strong>Note:</strong> NVME is not STOCK, has been replaced with the displayed one.

# Working Status
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
- dGPU (Any support in Mojave and up).
- Continuity Features (not working for now, waiting on https://openintelwireless.github.io/).
- HDMI is not working correctly in combination with audio, I spent literally entire days researching on it, if you find something tell me please.
![Asus FX504GE Layout](/Docs/Images/Guide/Asus-FX504GE-layout.png)
>These are all the external ports of the laptop. (**They all work**)

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
 
<!-- ACPI START -->
<details open>
<summary>ACPI</summary>

##### Add
1. `SSDT-PLUG.aml` (Allows for native CPU power management)
2. `SSDT-PMC` (Enable Native NVRAM for HM370 MotherBoard)
3. `SSDT-dGPU-Off.aml` (PowerOff GTX 1050Ti)
4. `SSDT-EC-USBX.aml` (Fix the embedded controller and USB power)
5. `SSDT-PNLF-CFL.aml` (Backlight support for Coffee Lake machines)
6. `SSDT-XOSI.aml` (This is for Trackpad ELAN HID)
7. `SSDT-USBMap.aml` (All Ports Mapped Correctly)

##### Patch
1. `Rename _OSI to XOSI` (Important for trackpad (Without this patch trackpad is not gonna work))
 
| 0 | Dictionary | 12 key/value pairs |
|:--- |:---:|:--- |
| Comment  | String | Change _OSI to XOSI |
| Find | Data | 5F4F5349 |
| Replace | Data | 584F5349 |

##### Quirks
**Enabled:**
1. `ResetLogoStatus` (Recomended for correctly displaying Apple logo  on Boot)

</details>
<!-- ACPI END -->
<!-- Booter START -->
<details>
<summary>Booter</summary>
 
##### Quirks
**Enabled:**
1. `AvoidRuntimeDefrag` (Fixes for common NVRAM properties)
2. `EnableSafeModeSlide` (Needed for something called KASLR)
3. `ProvideCustomSlide` (Needed for something called KASLR)
4. `RebuildAppleMemoryMap` (Makes the current Memory Map compatible to Apple's Expected one)
5. `SetupVirtualMap` (Fix for virtual memory accessing)
6. `SyncRuntimePermissions` (Fix for permission memory over OpenRuntime) 

</details>
<!-- Booter END -->
<!-- DeviceProperties START -->
<details>
<summary>DeviceProperties</summary>

##### Add
Audio Card Properties:
| PciRoot(0x0)/Pci(0x1F,0x3) | Dictionary | Keys / Values | Info about |
|:--- |:---:|:---:|:--- |
| AAPL,slot-name | String | Internal@0,31,3 | Indicates Virtual Slot for Audio Card |
| device-id | Data | 70A10000 | Giving it a Unique ID |
| device_type | String | Audio device | Just to know what it is |
| hda-gfx | String | onboard-1 | Indicates board that is located (1) |
| layout-id | DATA | 1E000000 | Best layout for the best Jack 3.5 and Speakers audio quality |

iGPU (Integrated Graphics Processing Unit) Properties:
| PciRoot(0x0)/Pci(0x2,0x0) | Dictionary | Keys / Values | Info about |
|:--- |:---:|:---:|:--- |
| AAPL,ig-platform-id  | DATA | 00009B3E | Indicates iGPU ID for macOS |
| AAPL,slot-name | String | Internal@0,2,0 | Indicates Virtual Slot for iGPU |
| device-id | DATA | 9B3E0000 | Fake iGPU ID (Just in case / Futureproof) |
| agdpmod | DATA | 01000000 | Disable port checking so HDMI output works |
| disable-external-gpu | DATA | 1000000 | Disables All GPUs Except iGPU |
| enable-backlight-registers-fix | DATA | 1000000 | Fix for Backlight Display |
| framebuffer-patch-enable | DATA | 01000000 | Switch for next patches |
| framebuffer-unifiedmem | DATA | 000080BE | Makes VRAM be 3048 MB instead of the 1500 MB|
| framebuffer-con1-enable | DATA | 01000000 | |
| framebuffer-con1-index | DATA | 01000000 | |
| framebuffer-con1-busid | DATA | 01000000 | |
| framebuffer-con1-pipe | DATA | 12000000 | |
| framebuffer-con1-type | DATA | 00080000 | Indicates that Connector 1 is HDMI |
| framebuffer-con1-flags | DATA | 87010000 | I have no idea |
| enable-lspcon-support | DATA | 01000000 | Switch for Enabling LSPCON Drivers |
| framebuffer-con1-has-lspcon | DATA | 01000000 | Indicate that con1 has LSPCON |
| framebuffer-con1-preferred-lspcon-mode | DATA | 01000000 | Makes LSPCON Default for con1 |
| hda-gfx | String | onboard-1 | Indicates board that is located (1) |
| model | String | Intel UHD 630 | Name Displayed Under  &rarr; About this Mac |

</details>
<!-- DeviceProperties END -->
<!-- Kernel START -->
<details>
<summary>Kernel</summary>
 
##### Add
**ORDER MATTER!** Think about which kexts should load before which.
1. [Lilu.kext](https://github.com/acidanthera/lilu/releases) (Allows kernel injection and modification )
2. [VirtualSMC.kext](https://github.com/acidanthera/VirtualSMC/releases) (Allows monitoring and controlling of system parameters)
   - SMCProcessor.kext (Allow monitoring and controlling of CPU)
   - SMCSuperIO.kext (Allow monitoring and controlling of IO(fans,WhaterPumps,etc..))
   - SMCBatteryManager.kext (Allow monitoring and in some cases controlling battery)
3. [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen/releases) (Graphics Driver)
4. [AppleALC.kext](https://github.com/acidanthera/AppleALC/releases) (Audio Driver)
5. [RealtekRTL8111.kext](https://github.com/Mieze/RTL8111_driver_for_OS_X/releases) (RJ45 Driver)
6. [VoodooPS2Controller.kext](https://github.com/acidanthera/VoodooPS2/releases) (PS/2 Driver)
7. [VoodooI2C.kext](https://github.com/VoodooI2C/VoodooI2C/releases) (I2C Devices Driver)
   - VoodooI2CHID.kext (Driver for this specific trackpad)
8. [Airportitlwm.kext](https://github.com/OpenIntelWireless/itlwm/releases) (Intel WiFi Driver)
9. [IntelBluetoothFirmware.kext](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases) (Intel Bluetooth Driver)
   - IntelBluetoothInjector.kext (Required Enabled on Big Sur or lower, now just required but Disabled)
10. [BlueToolFixup.kext](https://github.com/acidanthera/BrcmPatchRAM/releases) (Bluetooth Fix for Monterrey)
11. [BrightnessKeys.kext](https://github.com/acidanthera/BrightnessKeys/releases) (Fix some of fn Keys like Brightness or Audio)
12. [FeatureUnlock.kext](https://github.com/acidanthera/FeatureUnlock/releases) (Bring Back Handoff, UniversalControl, and other Apple Fancy Features)

##### Force
We need to force `IO80211Family.kext` from `System/Library/Extensions` to have complete support of WiFi with Airportitlwm.kext.
| 0 | Dictionary | Keys / Values | Info about |
|:--- |:---:|:---:|:--- |
| BundlePath | String | System/Library/Extensions/IO80211Family.kext | Location of the Driver Loaded by Force |
| Identifier | String | com.apple.iokit.IO80211Family | Internal Identifier |
| ExecutablePath | String | Contents/MacOS/IO80211Family | Location of the Executable File |

##### Quirks
**Enabled:**
1. `AppleXcpmCfgLock` (We don't have options to unlock de CFG-Lock on the BIOS so this option will create a virtual CFG)
2. `DisableLinkeditJettison` (Let Lilu.kext and other kexts run better)
3. `PowerTimeoutKernelPanic` (Prevents kernel panics because Apple Drivers)

</details>
<!-- Kernel END -->
<!-- Misc START -->
<details>
<summary>Misc</summary>

##### Debug
**Enabled:**
1. `DisableWatchDog` (Disables Timeouts on Boot wen Debug

##### Security
**Enabled:**
2. `AllowSetDefault` (Allow setting a Default Boot entry on the picker)
3. `BlacklistAppleUpdate` (Stop reciving firmware updates intended for real Mac hardware)
- `DmgLoading` Signed
- `ScanPolicy` 0
- `SecureBootModel` Default
- `Vault` Optional

##### Tools
Remove from `EFI/OC/Tools` everything. This should be a clean `key`

</details>
<!-- Misc END -->
<!-- NVRAM START -->
<details>
<summary>NVRAM</summary>
 
##### Add
| 7C436110-AB2A-4BBB-A880-FE41995C9F82 | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| boot-args  | String | |
| csr-active-config | DATA | 00000000 |
| prev-lang:kbd | String | en-US:0 |   

##### WriteFlash `Enable`
 
</details>
<!-- NVRAM END -->
<!-- PlatformInfo START -->
<details>
<summary>PlatformInfo</summary>

##### Automatic `enabled`

##### Generic
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
UpdateDataHub `Boolean` `Enable`
UpdateNVRAM `Boolean` `Enable`
UpdateSMBIOS `Boolean` `Enable`
UpdateSMBIOSMode `String` `Create`
 
</details>
<!-- PlatformInfo END -->
<!-- UEFI START -->
<details>
<summary>UEFI</summary>

##### APFS
**Enabled:**
1. EnableJumpStart (Load APFS driver from APFS Container)
2. HideVerbose (Hide APFS Verbose on boot)

##### AppleInput
**Enabled:**
1. GraphicsInputMirroring (Fixes for Keyboard input on certain stages)

##### ConnectDrivers `Boolean` `enabled`

##### Drivers (must-have)
1. `OpenRuntime.efi`
2. `HFsPlus.efi`
3. `OpenCanopy.efi`

##### Input
**Enabled:**
1. KeySupport<!-- LAST CHANGE --><!-- LAST CHANGE --><!-- LAST CHANGE --><!-- LAST CHANGE -->
 <!-- LAST CHANGE --><!-- LAST CHANGE --><!-- LAST CHANGE --><!-- LAST CHANGE -->
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
<!-- PlatformInfo END -->
 
</details>
<!-- OpenCore END -->

<!-- POST-INSTALL START -->
<details>
<summary><h3>Post Install (Important!!)</h3></summary>
 
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
<summary><h3>BenchMarks:</h3></summary>

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

<!-- LAST CHANGE ### Future info links to write here:
https://www.tonymacx86.com/threads/uhd-630-no-hdmi-audio.265490/post-2178532
https://github.com/acidanthera/bugtracker/issues/1189
https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md
https://github.com/acidanthera/WhateverGreen
https://www.tonymacx86.com/threads/an-idiots-guide-to-lilu-and-its-plug-ins.260063/#Hacktool

I will look for this tomorrow
https://www.tonymacx86.com/threads/guide-general-framebuffer-patching-guide-hdmi-black-screen-problem.269149/#post-1885420
-->

 <!-- Markdown for HTML lol: https://michelf.ca/projects/php-markdown/extra/#markdown-attr -->

If this guide has been useful for you, don't forget to give me a star ⭐️❤️
