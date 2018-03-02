# Test Program for A3982slb Stepping Motor Driver Evaluation Board

---
***This is still work in progress!***
---

This is an Eclipse project of STM32F4-Discovery board to test the A3982SLB stepping motor driver evaluation board designed [here](https://github.com/wshito/Micromouse2017/tree/master/prototype/stm32f401rct6_board/kicad/stm32f401rct6_board).



## STM32F4 Clock settings

The board initialization is done in `src/_initialize_hardware.c`.  Here is the default settings.

- `HSE` Oscillator is enabled by compiler option, `HSE_VALUE`.
- `PLL` source is set to `HSE`.
- `VCO` in `PLL` is set 1MHz.
- `PLLN` is set 336. Thus `VCO x PLLN = 336 MHz`.
- `PLLP` is set 2.  Thus `PLLN / PLLP = 168 MHz`. --> **This is set for `SYSCLK`.**
- `PLLQ` is set 7.  Thus `PLLN / PLLQ = 48 MHz` for USB OTG FS, SDIO, and RNG.
- `SYSCLK` source is `PLLCLK` (168 MHz).
- `AHB` is equal to `SYSCLK`.  `AHB = 168 MHz`.
- Low speed bus `APB1 = AHB / 4 = 42 MHz`.
- High speed bus `APB2 = AHB / 2 = 84 MHz`.