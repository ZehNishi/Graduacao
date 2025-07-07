Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

ENTITY Contadorx5 IS
PORT(
	clock								:IN STD_LOGIC;
	reset,inverter					:IN STD_LOGIC;
	saida								:OUT STD_LOGIC_VECTOR(2 downto 0));
end Contadorx5;

architecture i of Contadorx5 is 

	begin
		process (clock, reset)
		variable contagem		:integer;
		begin
			if reset='1' then
				contagem:=1;
			elsif (clock'event and clock='1' and inverter='0' and contagem/=5) then
					contagem:=contagem + 1;
			elsif (clock'event and clock='1' and inverter='1' and contagem/=1) then
					contagem:=contagem - 1;
			end if;
			saida<= conv_std_logic_vector(contagem,3);
		end process;		
	end i;