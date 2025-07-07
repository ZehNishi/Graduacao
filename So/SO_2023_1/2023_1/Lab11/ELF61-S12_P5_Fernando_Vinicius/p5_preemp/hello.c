#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/debug.h"
#include "driverlib/fpu.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/sysctl.h"
#include "driverlib/timer.h"
#include "driverlib/uart.h"
#include "utils/uartstdio.h"
#include "driverlib/systick.h"

void task_timeOut ();

void Timer1_Init();
unsigned int systime();



//=======================================================================================
// Configuracoes dos modelos utilizados

//*****************************************************************************
// System clock rate in Hz.
//*****************************************************************************
uint32_t g_ui32SysClock;

//*****************************************************************************
// Flags that contain the current value of the interrupt indicator as displayed
// on the UART.
//*****************************************************************************
uint32_t g_ui32Flags;

//*****************************************************************************
// The error routine that is called if the driver library encounters an error.
//*****************************************************************************
#ifdef DEBUG
void
__error__(char *pcFilename, uint32_t ui32Line)
{
}
#endif

//*****************************************************************************
// The interrupt handler for the first timer interrupt.
//*****************************************************************************
void
Timer0IntHandler(void)                                          // Interrupcao modificada para uso
{
    char cOne, cTwo;

    // Clear the timer interrupt.
    ROM_TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);

    // Toggle the flag for the first timer.
    HWREGBITW(&g_ui32Flags, 0) ^= 1;

    // Update the interrupt status.
    ROM_IntMasterDisable();

    cOne = HWREGBITW(&g_ui32Flags, 0) ? '1' : '0';
    cTwo = HWREGBITW(&g_ui32Flags, 1) ? '1' : '0';
    //UARTprintf("\rT1: %c  T2: %c", cOne, cTwo);
    #ifdef DEBUG
        UARTprintf("\nTimer\n");
    #endif
    void (*ptask_yield)() = &task_timeOut;                        // Ponteiro para o endere�o da fun��o task_yield
    change_add_asm(ptask_yield);                                // Mudan�a do endere�o de retorno da interrup��o para o task_yield
    ROM_IntMasterEnable();                                      // Ativa��o das interrup��es
}


//*****************************************************************************
// Configure the UART and its pins.  This must be called before UARTprintf().
//*****************************************************************************
void
ConfigureUART(void)
{
    // Enable the GPIO Peripheral used by the UART.
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);

    // Enable UART0
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);

    // Configure GPIO Pins for UART mode.
    ROM_GPIOPinConfigure(GPIO_PA0_U0RX);
    ROM_GPIOPinConfigure(GPIO_PA1_U0TX);
    ROM_GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);

    // Initialize the UART for console I/O.
    UARTStdioConfig(0, 115200, g_ui32SysClock);
}




//=======================================================================================
// Inicio da Main

int main(void)
{
    //==================================================================================
    // Configuracao e Inicializacao da TIVA

    // Run from the PLL at 120 MHz.
    g_ui32SysClock = MAP_SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ |
                SYSCTL_OSC_MAIN | SYSCTL_USE_PLL |
                SYSCTL_CFG_VCO_480), 120000000);

    // Initialize the UART.
    ConfigureUART();

    // Enable the GPIO port that is used for the on-board LEDs.
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPION);

    // Enable the GPIO pins for the LEDs (PN0 & PN1).
    ROM_GPIOPinTypeGPIOOutput(GPIO_PORTN_BASE, GPIO_PIN_0 | GPIO_PIN_1);


    // Enable the peripherals used by this example.
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);

    Timer1_Init();

    p5_func();

    return 0;
}


