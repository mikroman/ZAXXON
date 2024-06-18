/*
C:\DEV\C64\ZAXXON\crt_original>cartconv -f z1.crt

CRT Version: 1.0
Name: Super Zaxxon
Hardware ID: 18 (Zaxxon)
Mode: exrom: 0 game: 0 (16k Game)

offset  sig  type  bank start size  chunklen
$000040 CHIP ROM   #000 $8000 $1000 $1010
$001050 CHIP ROM   #000 $a000 $2000 $2010
$003060 CHIP ROM   #001 $a000 $2000 $2010

total banks: 3 size: $005000
################################################################################
The cartconv program is a cartridge conversion utility, it can convert between binary and .crt images and it can 'insert' binary and/or .crt images into the EPROM type of cartridges.

convert:    cartconv [-r] [-q|-v] [-t cart type] [-s cart revision] -i "input name" -o "output name" [-n "cart name"] [-l load address]
print info: cartconv [-r] [-q|-v] -f "input name"
check file: cartconv [-r] [-q|-v] -c "input name"

-f <name>                   print info on file
-c --check <name>           check file
-r                          repair mode (accept broken/invalid input files)
-p                          accept non padded binaries as input
-b                          output all banks (do not optimize the .crt file)
-t <type> or <crtid>        output cart type
-s <rev>                    output cart revision/subtype
-i <name>                   input filename
-o <name>                   output filename
-n <name>                   crt cart name
-l <addr>                   load address
-q                          quiet
-v --verbose                verbose
--types                     show the supported cart types
--version                   print cartconv version
--options-file <filename>   write options for reverting the conversion into a file (for test script)

#### cartconv command line options

-i "input name" :mandatory, name of the binary/.crt file to convert. For the EPROM type of cartridges this parameter can be used multiple times to insert images into the resulting file.
-o "output name" :mandatory, name of the binary/.crt file to convert.
-t carttype :optional. Needed when converting to a .crt file.
-s revision :optional. Needed when converting to a .crt file.
-n "cart name" :optional. The cartridge name when creating a .crt file. Defaults to the cartridge type.
-l loadaddress :optional. Used as the load-address when converting a .crt file to a .prg file, or when converting to a generic type .crt file.
-f "input name" :optional. Output information about the named file. It can't be used in conjuction with any of the other parameters.
-c "input name" --check "input name" Works similar to -f, but does not output anything except on errors. On errors it will also make cartconv exit with an exitcode of -1.
-r Optional. Enables repair mode (accept broken input files)
-p Optional. Accept input files that do not match the cartridge sizes (useful for development).
-b Optional. Will not omit banks that are empty (filled with $ff).
-q Optional. Disables all non-error messages
-v --verbose :Optional. Enables more verbose messages
--types :Optional. Show all supported cartridge types
--version Show cartconv version string and exit
--options-file <filename> :Optional. Writes options for reverting the conversion into a file, this is mostly useful for the test script.

#### cartconv supported cartridge types
The following cartridge types are supported:

bin Binary .bin file (Default crt->bin)
prg Binary C64 .prg file with load-address

C64 cartridges:

normal Generic 8KiB/12KiB/16KiB  (Default bin->crt)
ulti Ultimax mode 4KiB/8KiB/16KiB 
ap Atomic Power 
ar2 Action Replay MK2 
ar3 Action Replay MK3 
ar4 Action Replay MK4 
ar5 Action Replay V5 
bis BIS-Plus 
bb3 Blackbox V3 
bb4 Blackbox V4 
bb8 Blackbox V8 
bb9 Blackbox V9 
cap Capture 
comal Comal 80 
dep256 Dela EP256 , extra files can be inserted (1)(2)
dep64 Dela EP64 , extra files can be inserted (1)
dep7x8 Dela EP7x8 , extra files can be inserted (1)(2)(3)
din Dinamic 
dsm Diashow-Maker 
easy EasyFlash 
ecr Easy Calc Result 
epyx Epyx FastLoad 
exos EXOS 
expert Expert Cartridge 
f64 Formel 64 
fc1 The Final Cartridge 
fc3 The Final Cartridge III 
fcp Final Cartridge Plus 
ff Freeze Frame 
ff2 Freeze Frame MK2 
fm Freeze Machine 
fp Fun Play 
gk Game Killer 
gmod2 GMod2 
gmod3 GMod3 
gs C64 Games System 
hyper Hyper-Basic 
ide64 IDE64 
ieee IEEE-488 Interface 
ieeeflash64 IEEE Flash! 64 interface 
kcs KCS Power Cartridge 
ks Kingsoft 
ltk Lt. Kernal Host Adaptor 
mach5 MACH 5 
md Magic Desk 
mf Magic Formel 
max MAX Basic 
mikro Mikro Assembler 
mmc64 MMC64 
mmcr MMC Replay 
mv Magic Voice 
mm MultiMAX 
ocean Ocean 
p64 Prophet64 
pf Pagefox 
partner64 Partner 64 
rep256 REX 256KiB EPROM Cart , extra files can be inserted (1)(2)(3)
rgcd RGCD 
ross ROSS 
rr Retro Replay 
rrnet RR-Net MK3 
rrf REX RAM-Floppy 
ru REX Utility 
sdbox SD-BOX 
s64 Snapshot 64 
sb Structured BASIC 
se5 Super Explode V5.0 
sg Super Games 
silver Silverrock 128KiB Cartridge 
simon Simons' BASIC 
ss4 Super Snapshot V4 
ss5 Super Snapshot V5 
star Stardos 
turtle Turtle Graphics II 
wl Westermann Learning 
ws Warp Speed 
zaxxon Zaxxon 
zipp ZIPP-CODE 48 
(1) insertion of 32KiB EPROM files supported.
(2) insertion of 8KiB .crt/binary files supported.
(3) insertion of 16KiB .crt/binary files supported.

#### cartconv examples

>Convert a .crt file to a binary file with no load-address.           cartconv -i foo.crt -o foo.bin
>Convert a .crt file to a .prg file with default load-address.        cartconv -t prg -i foo.crt -o foo.prg 
>Convert a .crt file to a .prg file with 49152 as the load-address.   cartconv -t prg -l 49152 -i foo.crt -o foo.prg
>Convert a binary file to an ocean type cartridge.                    cartconv -t ocean -i foo.bin -o foo.crt

>Insert a 32KiB EPROM file into an dep64 type cartridge.              cartconv -t dep64 -i dep64.bin -i eprom.prg -o foo.crt
          1 : use the dep64 binfile in VICE as a generic 8KiB crt
          2 : generate an EPROM file
          3 : get the EPROM file to the host computer
          4 : insert the EPROM file into the final dep64 .crt file
                                                                      cartconv -t 18 -s 1 -n "super zaxxon" -i z1.bin -i z2.bin -i z3.bin -o zax.crt
>Insert an 8KiB .crt file into a dep256 type cartridge.               cartconv -t dep256 -i dep256.bin -i somegame.crt -o foo.crt
>Insert multiple 8KiB .crt files into a rep256 type cartridge.        cartconv -t rep256 -i rep256.bin -i foo1.crt -i foo2.crt -i foo3.crt -o foo.crt
>Get information about a .crt file.                                   cartconv -f foo.crt

Hardware Sub-Types
In one of the latest refinements of the .CRT file format, a field has been defined that specifies the “sub type” of a cartridge. The Ultimate uses this field in some cases to know whether the ROM has been made compatible with other I/O functions, such as the RAM Expansion Unit. The following table shows these cases. For other cartridge types, this field has no effect. Note, this field is one byte at CRT header offset 0x1A.

Type#     Sub       Description

C64:3     0         Standard FC-III cart (not compatible with REU)

C64:3     1         Patched FC-III ROM, free $DF00-$DF1F area for REU

C64:32    0         Standard EasyFlash Cart ROM (uses ROM at $DF00-DF1F)

C64:32    1         REU-aware EasyFlash Cart ROM ($DF00-$DF1F not used)

C128:1    0         Standard C128 cartridge with I/O mirror ($DE00-$DFFF)

C128:1    1         REU-aware C128 cartridge; with UCI preferred

EasyFlash:
EasyFlash cartridges have a Flash chip that can be written from the C64 side. Games that are released on EasyFlash cartridge use the Flash to save settings and high scores to. The EasyFlash system is conceptually very advanced; as it supplies the ‘driver’ software to write to the ROM as part of the ROM data. This driver is called “EasyFlash API”, or short ‘EAPI’. The Ultimate supports these writes to the ROM by patching the EAPI code area with its own driver. This way, all titles that use the EAPI to write data to the flash will use the Ultimate code to do so. This way, the Flash chip itself does not need to be emulated. More background information about the EAPI can be found here: EasyFlash API.

It is required to manually save the EasyFlash title back to your storage device after it has been modified. To do so, press F5 inside of a writable directory and select C64 Machine –> Save Cartridge. This command will create a new CRT file with all ROM data.

GMod2
Also GMod2 cartridges have a chip to store data in; an M93C86 EEPROM chip. This chip is fully emulated in the Ultimate *. The GMod2 software can ‘see’ this EEPROM chip, and use it in the standard way. If the contents are part of the CRT file, modified contents of this EEPROM can also be saved. To do this, follow the same procedure as with EasyFlash. Note that when the EEPROM data is _not_ part of the original CRT, it will be initialized with ‘FF’ bytes, and it will _not_ be saved with the Save Cartridge method, even when new data was written to it.

*There is one special version of the 1541U2 that supports GMod2, at the cost of other features.

Compatibility with I/O features
Unfortunately the Commodore 64 was never fully ‘plug and play’, as there was no configuraiton managment and dynamic allocation of memory and I/O resources like on modern PCs. This means that cartridges may be incompatible with some software, but also that enabling different features on the cartridge port may cause conflicts. In version 3.10 of the firmware, an attempt has been made to automatically ‘fix’ compatibility issues, by disabling features that conflict with the selected cartridge.

In order to find out what features were automatically disabled (or even enabled in a few cases), you can open up the System Info page with F4. An example is shown here:

As can be seen from the image, the EasyFlash cartridge that was loaded is not compatible with the RAM Expansion Unit (REU), nor with the Ultimate Command Interface (UCI) and with the Ultimate Audio Sampler module. All these reside in the $DF00-$DFFF area, which is also used by the EasyFlash cartridge. This means that the priority has been given to a correct functioning of the EF cartridge.
*/