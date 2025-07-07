// gpio.c

#include <stdint.h>

#include "tm4c1294ncpdt.h"

#define GPIO_PORTE (0x10) //bit 4



// -------------------------------------------------------------------------------
// Função ADC_Init
// Inicializa o port E e o ADC
// Parâmetro de entrada: Não tem
// Parâmetro de saída: Não tem
void ADC_Init(void)
{
	//1a. Ativar o clock para o Port E porta setando o bit correspondente no registrador RCGCGPIO
	SYSCTL_RCGCGPIO_R |= GPIO_PORTE;
	//1b.   após isso verificar no PRGPIO se a porta está pronta para uso.
  while((SYSCTL_PRGPIO_R & (GPIO_PORTE) ) != (GPIO_PORTE) ){};
	
	// 2. Destravar a porta somente se for o pino PD7 e PE7
		
	// 3. Setar o AMSEL para habilitar a analógica do PE4
	GPIO_PORTE_AHB_AMSEL_R |= 0x10;
		
	// 4. Habilitar o pino PE4 para AN9 no PCTL
	GPIO_PORTE_AHB_PCTL_R = 0x10000;

	// 5. DIR para 0 se for entrada, 1 se for saída
	GPIO_PORTE_AHB_DIR_R = 0x00;
		
	// 6. Setar o AFSEL para 1 para selecionar uma função alternativa	
	GPIO_PORTE_AHB_AFSEL_R |= 0x10;
		
	// 7. Desabilitar os bits de DEN para desabilitar I/O digital	
	GPIO_PORTE_AHB_DEN_R &= ~0x10;   //Bit4
	
	// 8a. Habilitar o ADC0
	SYSCTL_RCGCADC_R |= 0x01;
	// 8b. Esperar o ADC0
	while((SYSCTL_PRADC_R & (0x01) ) != (0x01) ){};
	
	// 9. Configurar para 125K
	ADC0_PC_R = 0x01;
	
    //10. O sequenciador 3 tem a prioridade mais alta
    ADC0_SSPRI_R = 0x0123;
  
	//11. Desabilitar o sequenciador 3 para configurar
	ADC0_ACTSS_R &= ~0x0008;

	//12. Seq3 é trigger em software
	ADC0_EMUX_R &= ~0xF000;
	
	//13. Limpar o campo SS3 e setar o canal Ain9
	ADC0_SSMUX3_R = (ADC0_SSMUX3_R&0xFFFFFFF0) + 9;
		
	//14. Sem TS0 D0, sim IE0 END0
	ADC0_SSCTL3_R = 0x0006;
	
	//15. Desabilitar interrupções no SS3
	ADC0_IM_R &= ~0x0008;
	
	//16. Habilitar o SS3
	ADC0_ACTSS_R |=0x0008;
		
	
		
		
}	

uint32_t ADC0_InSeq0 (void)
{
	uint32_t resultado;
	ADC0_PSSI_R = 0x0008; //inicia sequenciador SS3
	
	while ((ADC0_RIS_R & 0x08) == 0 ) {};
	resultado = ADC0_SSFIFO3_R&0xFFF;
	ADC0_ISC_R = 0x0008;  //ACK
	return resultado;	
}
