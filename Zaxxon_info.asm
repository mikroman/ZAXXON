/* VICE.manual.16.14.3.19 18 - Zaxxon, Super Zaxxon (SEGA)
$A000-BFFF (banked modules 1 and 2, chip U2)
Size	20KB (3 banks of different sizes)
EXROM	active (lo) (0)
GAME	active (lo) (0)
Load address	$8000-8FFF (mirrored in $9000-9FFF, module 0, chip U1)
      00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F       ASCII
      -----------------------------------------------  ----------------
0000: 43 36 34 20 43 41 52 54 52 49 44 47 45 20 20 20  C64 CARTRIDGE   
0010: 00 00 00 40 01 00 00 12 00 00 00 00 00 00 00 00  ...@............
0020: 5A 61 78 78 6F 6E 00 00 00 00 00 00 00 00 00 00  Zaxxon..........
0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

(high/low format)| packet len|type |bank |load |size
0040: 43 48 49 50|00 00 10 10|00 00|00 00|80 00|10 00  CHIP............
..
1050: 43 48 49 50|00 00 20 10|00 00|00 00|A0 00|20 00  CHIP.. ....... .
..
3060: 43 48 49 50|00 00 20 10|00 00|00 01|A0 00|20 00  CHIP.. ....... .

The (Super) Zaxxon carts use a 4KB ($1000) ROM at $8000-$8FFF (mirrored in $9000-$9FFF)
along with two 8KB ($2000) cartridge banks located at $A000-$BFFF.
One of the two banks is selected by doing a read access to either the $8000-$8FFF area
(bank 0 is selected) or to $9000-$9FFF area (bank 1 is selected).
EXROM ($18 = $00) and GAME ($19 = $00) lines are always pulled to GND to select the 16 KB ROM configuration.

The CRT file includes three CHIP blocks:

    a) bank = 0, load address = $8000, size = $1000
    b) bank = 0, load address = $A000, size = $2000
    c) bank = 1, load address = $A000, size = $2000 

$0000-$0003 - Contains ROM signature "CHIP" (note there can be more than one
              CHIP image in a .CRT file)

$0004-$0007 - Total packet length (high/low format)
              Length of ROM image size and header combined, this should
              always be equal to "ROM image size" + $10

$0008-$0009 - Chip type

              0 - ROM
              1 - RAM
              2 - Flash ROM
              3 - EEPROM

              This is informal only. A RAM chunk may be empty, but doesn't
              have to be.

$000A-$000B - Bank number ($0000 - normal cartridge)

              Bank number that this CHIP package appears in. This should be
              a logical bank number, not the value stored into some banking
              register which might have its bit-order rearranged.

$000C-$000D - Starting load address (high/low format)

              The load address tells the loader which part of the given bank
              is to be used for this chunk. It is only really important in
              formats where actually more than one CHIP chunk exists for each
              bank - most notable the "generic" (type 0) cartridges.

$000E-$000F - ROM image size in bytes  (high/low format, typically $2000 or $4000)

$0010- xxxx - ROM data*/   