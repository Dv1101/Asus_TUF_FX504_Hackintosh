DefinitionBlock ("", "SSDT", 2, "HACK", "PCI", 0x00000000)
{
	External (_SB_.PCI0.PEG0, DeviceObj)
	Device (_SB.PCI0.PEG0)
	{
		Name (_ADR, 0x00010000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16)" },
				"device_type", Buffer () { "PCI bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,1,0" },
			})
		}
	}
	External (_SB_.PCI0.IGPU, DeviceObj)
	Device (_SB.PCI0.IGPU)
	{
		Name (_ADR, 0x00020000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"framebuffer-unifiedmem", Buffer () { 0x00, 0x00, 0x00, 0x80 },
				"framebuffer-con0-alldata", Buffer () { 0x00, 0x00, 0x12, 0x00, 0x02, 0x00, 0x00, 0x00, 0x98, 0x04, 0x00, 0x00, 0x01, 0x05, 0x12, 0x00, 0x00, 0x08, 0x00, 0x00, 0xC7, 0x03, 0x00, 0x00, 0x02, 0x04, 0x12, 0x00, 0x00, 0x08, 0x00, 0x00, 0xC7, 0x03, 0x00, 0x00 },
				"disable-external-gpu", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"device_type", Buffer () { "VGA compatible controller" },
				"hda-gfx", Buffer () { "onboard-1" },
				"enable-hdmi-dividers-fix", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-patch-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"enable-hdmi20", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"AAPL00,override-no-connect", Buffer () { 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x06, 0xAF, 0x7C, 0x9C, 0x00, 0x00, 0x00, 0x00, 0x2B, 0x18, 0x01, 0x04, 0x95, 0x22, 0x13, 0x60, 0x02, 0x6F, 0xB1, 0xA7, 0x55, 0x4C, 0x9E, 0x25, 0x0C, 0x50, 0x54, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x78, 0x37, 0x80, 0xB4, 0x70, 0x38, 0x2E, 0x40, 0x6C, 0x30, 0xAA, 0x00, 0x58, 0xC1, 0x10, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x41, 0x55, 0x4F, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x42, 0x31, 0x35, 0x36, 0x48, 0x54, 0x4E, 0x30, 0x33, 0x2E, 0x38, 0x20, 0x0A, 0x00, 0x65 },
				"AAPL,slot-name", Buffer () { "Internal@0,2,0" },
				"AAPL,ig-platform-id", Buffer () { 0x04, 0x00, 0xA5, 0x3E },
				"model", Buffer () { "Intel UHD Graphics 630 (Mobile)" },
				"framebuffer-con0-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			})
		}
	}
	External (_SB_.PCI0.B0D4, DeviceObj)
	Device (_SB.PCI0.B0D4)
	{
		Name (_ADR, 0x00040000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem" },
				"device_type", Buffer () { "Signal processing controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,4,0" },
			})
		}
	}
	External (_SB_.PCI0.XHC, DeviceObj)
	Device (_SB.PCI0.XHC)
	{
		Name (_ADR, 0x00140000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Cannon Lake PCH USB 3.1 xHCI Host Controller" },
				"device_type", Buffer () { "USB controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,20,0" },
			})
		}
	}
	External (_SB_.PCI0.CNVW, DeviceObj)
	Device (_SB.PCI0.CNVW)
	{
		Name (_ADR, 0x00140003)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Wireless-AC 9560 [Jefferson Peak]" },
				"device_type", Buffer () { "Network controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,20,3" },
			})
		}
	}
	External (_SB_.PCI0.I2C0, DeviceObj)
	Device (_SB.PCI0.I2C0)
	{
		Name (_ADR, 0x00150000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Cannon Lake PCH Serial IO I2C Controller #0" },
				"device_type", Buffer () { "Serial bus controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,21,0" },
			})
		}
	}
	External (_SB_.PCI0.IMEI, DeviceObj)
	Device (_SB.PCI0.IMEI)
	{
		Name (_ADR, 0x00160000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Cannon Lake PCH HECI Controller" },
				"device_type", Buffer () { "Communication controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,22,0" },
			})
		}
	}
	External (_SB_.PCI0.SAT0, DeviceObj)
	Device (_SB.PCI0.SAT0)
	{
		Name (_ADR, 0x00170000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Cannon Lake Mobile PCH SATA AHCI Controller" },
				"device_type", Buffer () { "SATA controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,23,0" },
			})
		}
	}
	External (_SB_.PCI0.RP09, DeviceObj)
	Device (_SB.PCI0.RP09)
	{
		Name (_ADR, 0x001d0000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Cannon Lake PCH PCI Express Root Port #9" },
				"device_type", Buffer () { "PCI bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,29,0" },
			})
		}
	}
	External (_SB_.PCI0.RP15, DeviceObj)
	Device (_SB.PCI0.RP15)
	{
		Name (_ADR, 0x001d0006)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Cannon Lake PCH PCI Express Root Port #15" },
				"device_type", Buffer () { "PCI bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,29,6" },
			})
		}
	}
	External (_SB_.PCI0.LPCB, DeviceObj)
	Device (_SB.PCI0.LPCB)
	{
		Name (_ADR, 0x001f0000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "HM470 Chipset LPC/eSPI Controller" },
				"device_type", Buffer () { "ISA bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,31,0" },
			})
		}
	}
	External (_SB_.PCI0.HDEF, DeviceObj)
	Device (_SB.PCI0.HDEF)
	{
		Name (_ADR, 0x001f0003)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"hda-gfx", Buffer () { "onboard-1" },
				"model", Buffer () { "Cannon Lake PCH cAVS" },
				"device-id", Buffer () { 0x70, 0xA1, 0x00, 0x00 },
				"layout-id", Buffer () { 0x03, 0x00, 0x00, 0x00 },
				"AAPL,slot-name", Buffer () { "Internal@0,31,3" },
				"device_type", Buffer () { "Audio device" },
			})
		}
	}
	External (_SB_.PCI0.SBUS, DeviceObj)
	Device (_SB.PCI0.SBUS)
	{
		Name (_ADR, 0x001f0004)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Cannon Lake PCH SMBus Controller" },
				"device_type", Buffer () { "SMBus" },
				"AAPL,slot-name", Buffer () { "Internal@0,31,4" },
			})
		}
	}
	External (_SB_.PCI0.RP09.PXSX, DeviceObj)
	Device (_SB.PCI0.RP09.PXSX)
	{
		Name (_ADR, 0x00000000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "NVMe SSD Controller SM981/PM981/PM983" },
				"device_type", Buffer () { "Non-Volatile memory controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,29,0/0,0" },
			})
		}
	}
	External (_SB_.PCI0.RP15.PXSX, DeviceObj)
	Device (_SB.PCI0.RP15.PXSX)
	{
		Name (_ADR, 0x00000000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller" },
				"device_type", Buffer () { "Ethernet controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,29,6/0,0" },
			})
		}
	}
}
