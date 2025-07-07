Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

ENTITY Frequencimetro IS
PORT(
	frequencia					:IN STD_LOGIC_VECTOR(23 downto 0);
	reset							:IN STD_LOGIC;
	saida							:OUT STD_LOGIC_VECTOR(23 downto 0));
end Frequencimetro;

architecture i of Frequencimetro is

		signal contagem : signed(23 downto 0) := "0";

	begin
		process (frequencia, reset)
		begin
			if reset='1' then
				contagem<="0";
			else		
					contagem<=contagem + 1;
			end if;
			saida<= conv_std_logic_vector(contagem,24);
		end process;		
	end i;