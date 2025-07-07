Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

ENTITY Contadorx999 IS
PORT(
	clock						:IN STD_LOGIC;
	reset,inverter			:IN STD_LOGIC;
	saida0					:OUT STD_LOGIC_VECTOR(3 downto 0);
	saida1					:OUT STD_LOGIC_VECTOR(3 downto 0);
	saida2					:OUT STD_LOGIC_VECTOR(3 downto 0));
end Contadorx999;

architecture i of Contadorx999 is 

	begin
		process (clock, reset)
		variable contagem0		:integer;
		variable contagem1		:integer;
		variable contagem2		:integer;
		begin
			if reset='1' then
				contagem0:=0;
				contagem1:=0;
				contagem2:=0;
			elsif (clock'event and clock='1' and inverter='0') then
					contagem0:=contagem0 + 1;
				if contagem0=10 then 
					contagem0:=0;
					contagem1:=contagem1 + 1;
					if contagem1=10 then
						contagem1:=0;
						contagem2:=contagem2 + 1;
					end if;
				end if;
			elsif (clock'event and clock='1' and inverter='1' and not(contagem1=0 and contagem0=0 and contagem2=0)) then
				if contagem0=0 then
					if (contagem1>0 or contagem2>0) then
						contagem0:=9;
						if (contagem1=0 and contagem2>0) then
							contagem1:=9;
							contagem2:=contagem2 - 1;
						else
							contagem1:=contagem1 - 1;
						end if;
					end if;
				end if;
				contagem0:=contagem0 - 1;
			end if;
			saida0<= conv_std_logic_vector(contagem0,4);
			saida1<= conv_std_logic_vector(contagem1,4);
			saida2<= conv_std_logic_vector(contagem2,4);
		end process;		
	end i;