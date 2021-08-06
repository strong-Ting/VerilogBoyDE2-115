# TingBoy

Port VerilogBoy to Altera DE2-115

# System Architecture

Gameboy system is implemented by VerilogBoy,and I port it to DE2-115.

The project connects PS2 keyboard and UART interface to key controller of the GameBoy, so you can play the GameBoy by PS2 keyboard or communicate over UART.


Game Cartridge is connected to on-chip memory of DE2-115 that is inited by game rom.

The audio is connected to WM8731 Codec that is on DE2-115.

# demo

Running open source Gameboy game [Tobu Tobu Girl](http://tangramgames.dk/tobutobugirl/):

[![demo video](https://github.com/strong-Ting/VerilogBoyDE2-115/blob/main/doc/tobu.jpg?raw=true)](https://www.youtube.com/watch?v=els84fNxumY)

I also run other games that are tetris and mario, and they are work well!

# reference source

VerilogBoy : https://github.com/zephray/VerilogBoy

PS2: https://yamin.cis.k.hosei.ac.jp/fpga/ps2_keyboard.v

Uart: https://github.com/jamieiles/uart