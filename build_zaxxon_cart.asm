// import the bytes from the file 'music.bin', but skip the first 100 bytes
// .import binary "Music.bin", 100   

// Imports $200 bytes starting from position $402 (the two extra bytes is because its a c64 file)  
// .import c64 "charset.c64", $400, $200





.byte $43,$36,$34,$20,$43,$41,$52,$54,$52,$49,$44,$47,$45,$20,$20,$20
.byte $00,$00,$00,$40,$01,$00,$00,$12,$00,$00,$00,$00,$00,$00,$00,$00
.byte $53,$75,$70,$65,$72,$20,$5A,$61,$78,$78,$6F,$6E,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $43,$48,$49,$50,$00,$00,$10,$10,$00,$00,$00,$00,$80,$00,$10,$00

.import binary "bin\zaxxon01.bin", $0000, $1000

.byte $43,$48,$49,$50,$00,$00,$20,$10,$00,$00,$00,$00,$A0,$00,$20,$00

.import binary "bin\zaxxon01.bin", $2000, $2000

.byte $43,$48,$49,$50,$00,$00,$20,$10,$00,$00,$00,$01,$A0,$00,$20,$00

.import binary "bin\zaxxon02.bin", $0000, $2000
