# Hackintosh Guide for **Asus FX504GE/GD**
> Added macOS Sequoia (15) Support
> Updated to OpenCore 1.0.1, Updated all Kexts and Drivers
> Changed SMBios to Macmini8,1 because my TUF is broken and i want to use it as a macmini and display over HDMI.
> Since airportitlwm is not updated to support for Sequoia. I have used Itlwm and Heliport, Manually modified IntelBTPatch to temporarily workaroud for Wifi and Bluetooth. (I will update it as soon as it gets fixed)
> Set SecureBootModel to Disable (It will cause bootloop macos installer and will not load kext on macos 14.4 and Higher)
>
> Changes By Dhruv Varia ~ 25/09/2024

**This guide it's updated to OpenCore 1.0.3 and tested on my main device with macOS High Sierra, Mojave, Catalina, Big Sur, Monterrey, Ventura, Sonoma and Sequoia.**

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
Here's the [Amazon Link](https://www.amazon.es/dp/B07D4W2CY6/ref=cm_sw_em_r_mt_dp_gUF8FbYQW48NV) for this exact model, *it cost me `1.199€` when purchased on 18/09/2018*

| Component | Name |
|:--- |:---|
| Motherboard:  | FX504GE **HM370** |
| CPU: | **Intel** i7-8750H |
| RAM: | **SK Hyinix** HMA82GS6CJR8N-VK 16GB 2666Mhz |
| iGPU: | **Intel** UHD 630 (Mobile) |
| dGPU: | **nVidia** GeForce GTX 1050 Ti (DISABLED) |
| NVMe: | **Samsung** 970 EVO Plus |
| HDD: | **HGST** HTS721010A9E630 |
| Wifi/BT: | **Intel** Wireless-AC 9560 160MHz (Type CNVi) |
| Audio: | **RealTek** ALC255 |
| Ethernet: | **RealTek** RTL8111 |
| Trackpad: | **ELAN1200** Precision TouchPad (Type HID) |
| Keyboard: | PS/2 Keyboard (ISO Spain)|
><strong>Note:</strong> The NVMe is the only component that has been replaced from STOCK

# Working Status
 - ### **Fully Working**
    - Built-In Display
    - [All USB Ports](/Docs/Images/Guide/Asus-FX504GE-layout.png)
    - Jack 3.5mm, Speakers & Microphone
    - DC-IN & Battery
    - NVMe & HDD
    - Camera
    - Ethernet
    - Keyboard
    - Trackpad

 - ### **Partially Working**
    - WiFi
    - Bluetooth
    - HDMI Port
    - Continuity Features (Apple Ecosystem Fancy Things)

- ### **Not Working**
    - dGPU *(nVidia GTX 1050Ti)*

<details open>
    <summary><h3>&nbsp;&nbsp;🔍&nbsp;&nbsp;In-depth Info</h3></summary>

| Name | Solution |
|:--- |:--- |
| Built-In Display  | Works thanks to `SSDT-PNLF-CFL.aml` *(Backlight Fix)* and `WhateverGreen.kext` *(iGPU Fixes)*. |
| All USB Ports | Thanks to `USBMap.aml` *(Ports mapped for macOS)* and `SSDT-EC-USBX.aml`. |
| Jack 3.5mm, Speakers & Microphone | Thanks to `AppleALC.kext` *(Audio Driver)* and layout setted to "30" (Dec) or "1E000000" (Hex). |
| DC-IN & Battery| `VirtualSMC.kext` with `SMCBatteryManager.kext` allows management off charging and Battery Info. |
| NVMe & HDD | It used to be something tricky but having SATA on AHCI Mode on *BIOS/UEFI* and latest firmware for the NVMe is enough. |
| Camera | Is connected via Internal USB and it works. |
| Ethernet | Thanks to `RealtekRTL8111.kext` (Ethernet Driver). |
| Keyboard | Thanks to `VoodooPS2.kext` (Driver for PS2 devices). |
| Trackpad | Thanks to `SSDT-XOSI.aml`(Make some Windows Features Avaible for macOS too) and with `VoodooI2C.kext` in combination with `VoodooI2CHID.kext`(Driver for I2C and HID devices like my trackpad). |
| PowerOff, Reboot & Sleep | Working thanks to having correct configs for CPU, iGPU, disabled dGPU, mapped USB Ports and executed these commands after macOS installation: `sudo pmset autopoweroff 0`, `sudo pmset powernap 0`, `sudo pmset standby 0`, `sudo pmset proximitywake 0`, `sudo pmset tcpkeepalive 0`.|
| | |
| WiFi | Thanks to [AirportItlwm.kext](https://github.com/OpenIntelWireless/itlwm/releases) (Driver for Intel WiFi Card) and loading from system the kext: `IO80211Family.kext`. |
| Bluetooth | Thanks to [IntelBluetoothFirmware.kext](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases) and [BlueToolFixup.kext](https://github.com/acidanthera/BrcmPatchRAM/releases). |
| HDMI Port | Thanks to DeviceProperties Patch from [MegaStood Guide](https://github.com/MegaStood/Hackintosh-FX504GE-ES72#hdmi). But Audio over HDMI is totally broken and **Hi-Res Displays** can cause visual bugs or unstable connections. |
| Continuity Features | With the exception of **"AirDrop"** And **"Apple Watch AutoLogin"** all other Features work thanks to [AirportItlwm.kext](https://github.com/OpenIntelWireless/itlwm/releases),[IntelBluetoothFirmware.kext](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases),[FeatureUnlock.kext](https://github.com/acidanthera/FeatureUnlock/releases); Sidecar, AirPlay to Mac, NightShift and Universal Control are working [(More Info)](https://github.com/acidanthera/FeatureUnlock#featureunlock). |
| | |
| dGPU | This laptop use Optimus and dGPU is not usable on macOS and Mojave dropped support for [nVidia Web Drivers](https://www.insanelymac.com/forum/topic/324195-nvidia-web-driver-updates-for-macos-high-sierra-update-nov-13-2020/) (Not even try this...). |
</details>

---

# GUIDE OF INSTALLATION
<!-- BOOTABLE START -->
<details>
<summary><h3>Making the Bootable USB</h3></summary>
    <h3>From macOS:</h3>
<p><a href="https://support.apple.com/en-us/HT201372"</a>Link to Apple's Guide</p>

**Download installers:** [Ventura](https://apps.apple.com/us/app/macos-ventura/id1638787999) - [Monterrey](https://apps.apple.com/es/app/macos-monterey/id1576738294) - [Big Sur](https://itunes.apple.com/us/app/macos-big-sur/id1526878132) - [Catalina](https://itunes.apple.com/us/app/macos-catalina/id1466841314) - [Mojave](https://itunes.apple.com/us/app/macos-mojave/id1398502828) - [High Sierra](https://itunes.apple.com/us/app/macos-high-sierra/id1246284741)

[(Alternative Download (Mr. Machintosh Post))](https://mrmacintosh.com/how-to-download-macos-catalina-mojave-or-high-sierra-full-installers/)

1. Connect a >=16 GB pendrive.
2. Open *Disk Utility* and Erase the USB with the name: *MyVolume*.
3. Open *Terminal* and use the proper commands for your macOS installer:
- Ventura: `sudo /Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`
- Monterrey: `sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`
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
<summary><h3>BIOS Settings</h3></summary>
 
- Make Sure you have [Latest BIOS v323](https://www.asus.com/supportonly/FX504GE/HelpDesk_BIOS/)
- After Updating the BIOS, stock configuration works, so don't worry about this part.
---
 
</details>
<!-- BIOS END -->

<!-- OpenCore START -->
<details>
<summary><h3>confi.plist Explanation</h3></summary>
  
>Here (Under these Dropdown Menus) are written only **Enabled** Parameters, Leave everything default on a supposedly new `sample.conf`, I have explained what does and why every parameter, I hope you understand something.


<!-- ACPI START -->
<details open>
<summary>ACPI</summary>

>**ACPI** are related mainly to modifying or patching the device firmware (DSDT).

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
  
>**Booter** related when booting.
 
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
  
>**DeviceProperties** is related to explaining to the SO the devices you have and info you want to "fake" to them.

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

>**Kernel** are things related with kernel an ".kext"(kernel extension).
 
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

>**Misc** things related with Visual and security also Boot Picker of OpenCanopy.

##### Debug
**Enabled:**
1. `DisableWatchDog` (Disables Timeouts on Boot wen Debug

##### Security
**Enabled:**

1. `AllowSetDefault` (Allow setting a Default Boot entry on the picker)

2. `BlacklistAppleUpdate` (Stop reciving firmware updates intended for real Mac hardware)
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

>**NVRAM** things for the *Non-volatile memory*
 
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

>**PlatformInfo* is mainly for "faking" your macOS model so it fits better with macOS expected specifications.

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

>**UEFI** have multiple porpouses for all things.

##### APFS
**Enabled:**
1. EnableJumpStart (Load APFS driver from APFS Container)
2. HideVerbose (Hide APFS Verbose on boot)

##### AppleInput
**Enabled:**
1. GraphicsInputMirroring (Fixes for Keyboard input on certain stages)

##### ConnectDrivers `Boolean` `enabled`

##### Drivers (must-have)
1. `OpenRuntime.efi` (OpenCore Engine)
2. `HFsPlus.efi` (Driver for HFsPlus on every hadrware)
3. `OpenCanopy.efi` (Fancy Boot Picker)

##### Input
**Enabled:**
1. `KeySupport`

##### Output
**Enabled:**
1. `ProvideConsoleGop`

##### ProtocolsOverride
**Enabled:**
1. `FirmwareVolume`

##### Quirks
**Enabled:**
1. `EnableVectorAcceleration`
2. `ReleaseUsbOwnership` (Mainly for USB fixes)
3. `RequestBootVarRouting` (Redirects some Variables for macOS)
---
 </details>
<!-- PlatformInfo END -->
</details>
<!-- OpenCore END -->
<!-- POST-INSTALL START-->
<details>
  <summary><h3>Post Installation</h3></summary>
  
Fixing Trackpad - What I identified is:
- 2 fast clicks = 1 Force Click
- 1 click = nothing on most parts of OS or bug with Voodoo2IC
- Small issues with trackpad...
Here's the Settings I Use for myself (Ventura's Settings are a mess)
![My Trackpad Settings](/Docs/Images/Postinstall-Trackpad.png)
 
Open Terminal.app and run those commands:
~~~
sudo pmset autopoweroff 0
sudo pmset powernap 0
sudo pmset standby 0
sudo pmset proximitywake 0
sudo pmset tcpkeepalive 0
~~~
>These 5 commands help fixing possible Sleep/Wake Issues
  
~~~
  - sudo rm /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
  - sudo rm /Library/Preferences/SystemConfiguration/preferences.plist
~~~
>These 2 commands help fixing possible iCloud Ban/iMessages Ban or WiFi/Ethernet Issues (Use only if you want or need)

---

</details>
<!-- POST-INSTALL END -->

---

# Aditional Info

<!-- BENCHMARK START -->
<details>
  <summary><h3>BenchMarks</h3></summary>

<details open>
<summary>Cinebench R23</summary>

![Cinebench R23](/Docs/Images/Benchmarks/Cinebench_R23.png)

</details>

<details open>
<summary>GeekBench 5</summary>

![GeekBench 5_CPU Score](/Docs/Images/Benchmarks/GeekBench5_CPU.png)
![GeekBench 5_GPU Score](/Docs/Images/Benchmarks/GeekBench5_GPU.png)
https://browser.geekbench.com/v5/cpu/5707123

---

</details>

</details>

<!-- BENCHMARK END -->

<!-- CREDITS START -->
<details open>
<summary><h3>Credits</h3></summary>

[Apple](https://apple.com) (macOS)

[OpenCore Team](https://github.com/acidanthera/OpenCorePkg) (Bootloader)

[Dortania](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake.html#starting-point) (Guide)

[PoomSmart](https://github.com/PoomSmart/ASUS-FX504GE-Hackintosh) (Base Repo)

[MegaStood](https://github.com/MegaStood/Hackintosh-FX504GE-ES72) (iGPU Properties)

---

</details>
<!-- CREDITS END -->
If this guide has been useful for you, don't forget to give me a star ⭐️❤️
