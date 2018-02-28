//
// This file is the modified version of the one in the GNU ARM Eclipse distribution.
//
// Copyright (c) 2014 Liviu Ionescu.
// Copyright (c) 2016 WShito.
//
// ----------------------------------------------------------------------------

#include "stm32f4xx.h"
#include "stm32f4xx_conf.h"
#include "stm32f407xx.h"

// ----------------------------------------------------------------------------

// The external clock frequency is specified as a preprocessor definition
// passed to the compiler via a command line option (see the 'C/C++ General' ->
// 'Paths and Symbols' -> the 'Symbols' tab, if you want to change it).
// The value selected during project creation was HSE_VALUE=8000000.
//
// The code to set the clock is at the end.
//
// Note1: The default clock settings assume that the HSE_VALUE is a multiple
// of 1MHz, and try to reach the maximum speed available for the
// board. It does NOT guarantee that the required USB clock of 48MHz is
// available. If you need this, please update the settings of PLL_M, PLL_N,
// PLL_P, PLL_Q to match your needs.
//
// Note2: The external memory controllers are not enabled. If needed, you
// have to define DATA_IN_ExtSRAM or DATA_IN_ExtSDRAM and to configure
// the memory banks in system/src/cmsis/system_stm32f4xx.c to match your needs.

// ----------------------------------------------------------------------------

// Forward declarations.

void
__initialize_hardware(void);

void
SystemClock_Config(void);

// ----------------------------------------------------------------------------

// This is the application hardware initialisation routine,
// redefined to add more inits.
//
// Called early from _start(), right after data & bss init, before
// constructors.
//
// After Reset the Cortex-M processor is in Thread mode,
// priority is Privileged, and the Stack is set to Main.

void
__initialize_hardware(void)
{
	// ------- Originally from HAL_Init() -----------------
	/* Configure Flash prefetch, Instruction cache, Data cache */
#if (INSTRUCTION_CACHE_ENABLE != 0U)
	FLASH->ACR |= FLASH_ACR_ICEN;
#endif /* INSTRUCTION_CACHE_ENABLE */

#if (DATA_CACHE_ENABLE != 0U)
	FLASH->ACR |= FLASH_ACR_DCEN;
#endif /* DATA_CACHE_ENABLE */

#if (PREFETCH_ENABLE != 0U)
	FLASH->ACR |= FLASH_ACR_PRFTEN;
#endif /* PREFETCH_ENABLE */
	// -----------------------------------------------------

	// Enable HSE Oscillator and activate PLL with HSE as source
	SystemClock_Config();

	// Call the CSMSIS system clock routine to store the clock frequency
	// in the SystemCoreClock global RAM location.
	SystemCoreClockUpdate();
}

// ----------------------------------------------------------------------------

/**
 * @brief  System Clock Configuration
 * @param  None
 * @retval None
 */
void
__attribute__((weak))
SystemClock_Config(void)
{
	// Enable Power Control clock.  Originally from __HAL_RCC_PWR_CLK_ENABLE() in HAL.
	volatile uint32_t tmpreg = 0x00U; // volatile is for read/write variable
	RCC->APB1ENR |= RCC_APB1ENR_PWREN; // Power on for APB1 bus.
	/* Delay after an RCC peripheral clock enabling */
	tmpreg = (RCC->APB1ENR & RCC_APB1ENR_PWREN);

#if defined(STM32F405xx) || defined(STM32F407xx) || defined(STM32F415xx) || defined(STM32F417xx)
	// Set the voltage scale 1 mode(default value at reset): the maximum value of fHCLK = 168 MHz.
	PWR->CR |= (1<<14); // (1<<14) is VOS bit.
	tmpreg = (PWR->CR & (1<<14)); // Delay after an RCC peripheral clock enabling
	(void)(tmpreg);
#else
	// Set the voltage scale 1 mode(default value at reset): the maximum value of fHCLK = 168 MHz.
	PWR->CR |= (3<<14); // b11 for bit15:14 for VOS
	tmpreg = (PWR->CR & (3<<14)); // Delay after an RCC peripheral clock enabling
	(void)(tmpreg);
#endif /* STM32F405xx || STM32F407xx || STM32F415xx || STM32F417xx */

	// #warning "Please check if the SystemClock_Config() settings match your board!"
	// Comment out the warning after checking and updating.

	// -------- Oscillator Configuration ------------
#if defined(HSE_VALUE) && (HSE_VALUE != 0)  // HSE_VALUE is set in the compiler option.
	// Enable HSE Oscillator and activate PLL with HSE as source.
	RCC->CR |= (1<<16); // set HSEON bit (16th bit)
	while (!(RCC->CR & (1<<17)))
		; // wait until HSE is ready

#else
	// Use HSI and activate PLL with HSI as source.
	RCC->CR |= (1<<0); // set HSEION bit (0th bit)
	while (!(RCC->CR & (1<<1)))
		; // wait until HSI is ready

	// HSI has maximum 1% error.  Insert the code to trim the factory calibration
	// by using the RCC clock control register (RCC->CR) HSITRIM bit. See AN4067.

#endif

	// -------- PLL Configuration ---------------------

	// Since the main-PLL configuration parameters cannot be changed once PLL is enabled, it is
	// recommended to configure PLL before enabling it (selection of the HSI or HSE oscillator as
	// PLL clock source, and configuration of division factors M, N, P, and Q).

	// 1. Disable PLL just in case
	RCC->CR &= ~(1<<24);
	while (RCC->CR & (1<<25))
		; // wait until PLL is unlocked.

	// 2. Set the PLL source
#if defined(HSE_VALUE) && (HSE_VALUE != 0)  // HSE_VALUE is set in the compiler option.
	RCC->PLLCFGR |= (1<<22); // Set PLL source as HSE.
#else
	RCC->PLLCFGR &= ~(1<<22); // Set PLL source as HSI.
#endif

	// 3. Set PLLM to Obtain 1MHz for VCO in PLL.
	RCC->PLLCFGR &= ~(0x3F); // Clear the bits5:0
#if defined(HSE_VALUE) && (HSE_VALUE != 0)  // HSE_VALUE is set in the compiler option.
	// This assumes the HSE_VALUE is a multiple of 1 MHz. If this is not
	// your case, you have to recompute these PLL constants.
	RCC->PLLCFGR |= (HSE_VALUE/1000000u); // Setting PLLM to feed 1MHz to VCO in PLL.  VCO input = PLLCLK / PLLM.
#else
	// This assumes the HSI_VALUE is a multiple of 1 MHz. If this is not
	// your case, you have to recompute these PLL constants.
	RCC->PLLCFGR |= (HSI_VALUE/1000000u); // Setting PLLM to feed 1MHz to VCO in PLL.  VCO input = PLLCLK / PLLM.
#endif

	// 4. Set PLLN to obtain 336MHz out of VCO.
	// Multiply VCO(=1MHz) in PLL by 336 to obtain 336MHz.  This will feed the clock to the dividers PLLP, PLLQ, and PLLR.
	RCC->PLLCFGR &= ~(0x7FC0U);  // Clear bit 14:6
	RCC->PLLCFGR |= (336U << 6); // set PLLN = 336

	// 5. Set PLLP to obtain the main system clock.
	RCC->PLLCFGR  &= ~(0x3U << 16); // clear bit17:16 for PLLP
#if defined(STM32F401xC) || defined(STM32F401xE) || defined(STM32F411xE)
	RCC->PLLCFGR |= (1U << 16);  // 01:PLLP=4, PLLN/PLLP=84MHz.
#elif defined(STM32F427xx) || defined(STM32F437xx) || defined(STM32F429xx) || defined(STM32F439xx)
	// Do nothing.  00:PLLP=2, PLLN/PLLP=168 MHz
#elif defined(STM32F405xx) || defined(STM32F415xx) || defined(STM32F407xx) || defined(STM32F417xx)
	// Do nothing.  00:PLLP=2, PLLN/PLLP=168 MHz
#elif defined(STM32F446xx)
	// Do nothing.  00:PLLP=2, PLLN/PLLP=168 MHz
#else
	RCC->PLLCFGR |= (1U << 16);  // 01:PLLP=4, PLLN/PLLP=84MHz.  Conservative setup.
#endif

	// 6. Set PLLQ to obtain the clock for USB OTG FS, SDIO, and RNG.
	RCC->PLLCFGR &= ~(0xFU << 24); // clear the bit27:24
	RCC->PLLCFGR |= (7U << 24);    // PLLQ=7,  336/7 = 48MHz.  To make USB work.

	// 7. Finally enable PLL.
	RCC->CR |= (1U << 24);
	while (!(RCC->CR & (1U << 25)))
		; // wait until PLL is locked.

	// ----- Clock Configuration ----------
	// Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
	// clocks dividers
#if defined(STM32F401xC) || defined(STM32F401xE) || defined(STM32F411xE)
	// 1. Set the flash latency with the Flash Access Control Register
	FLASH->ACR &= ~(7U); // Clear the bit2:0
	FLASH->ACR |= 2U;    // FLASH_LATENCY=2
	// 2. Set the AHB pre-scaler to feed the AHB bus clock by dividing HCLK.
	RCC->CFGR &= ~(0xF0U); // clear bit7:4 HPRE which means no dividing SYSCLK for AHB.
	// 3. Set PLL as the SYSCLK source.
	RCC->CFGR &= ~(3U); // clear bit1:0 SW: System Clock Switch
	RCC->CFGR |= 2U;    // set PLL as the system clock source.
	while ((RCC->CFGR & 0x8U) != 0x8U)
		; // wait until bit3:2 SWS status shows PLL is being used.
	// 4. Set PPRE1 pre-scaler for APB1 low speed bus.
	RCC->CFGR &= ~(0x1C00U); // clear bit12:10 PPRE1
	RCC->CFGR |= 0x1000U;    // APB1 = AHB / 2
	// 5. Set PPRE2 pre-scaler for APB2 high speed bus.
	RCC->CFGR &= ~(0xE000U); // clear bit15:13 PPRE2 which means no dividing AHB clock for APB2.
#else
	// This is expected to work for most large cores.
	// Check and update it for your own configuration.
	// 1. Set the flash latency with the Flash Access Control Register
	FLASH->ACR &= ~(7U); // Clear the bit2:0
	FLASH->ACR |= 5U;    // FLASH_LATENCY=5
	// 2. Set the AHB pre-scaler to feed the AHB bus clock by dividing HCLK.
	RCC->CFGR &= ~(0xF0U); // clear bit7:4 HPRE which means no dividing SYSCLK for AHB.
	// 3. Set PLL as the SYSCLK source.
	RCC->CFGR &= ~(3U); // clear bit1:0 SW: System Clock Switch
	RCC->CFGR |= 2U;    // set PLL as the system clock source.
	while ((RCC->CFGR & 0x8U) != 0x8U)
		; // wait until bit3:2 SWS status shows PLL is being used.
	// 4. Set PPRE1 pre-scaler for APB1 low speed bus.
	RCC->CFGR &= ~(0x1C00U); // clear bit12:10 PPRE1
	RCC->CFGR |= 0x1400U;    // APB1 = AHB / 4
	// 5. Set PPRE2 pre-scaler for APB2 high speed bus.
	RCC->CFGR &= ~(0xE000U); // clear bit15:13 PPRE2
	RCC->CFGR |= 0x8000U;    // APB2 = AHB / 2
#endif

	// Call the CSMSIS system clock routine to store the clock frequency
	// in the SystemCoreClock global RAM location.
	SystemCoreClockUpdate();


}

// ----------------------------------------------------------------------------
