Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

ENTITY Cronometro10min IS
PORT(
	clock						:IN STD_LOGIC;
	reset,pause				:IN STD_LOGIC;
	saida0					:OUT STD_LOGIC_VECTOR(3 downto 0);
	saida1					:OUT STD_LOGIC_VECTOR(3 downto 0);
	saida2					:OUT STD_LOGIC_VECTOR(3 downto 0);
	saida3					:OUT STD_LOGIC_VECTOR(3 downto 0));
end Cronometro10min;

architecture i of Cronometro10min is 

	begin
		process (clock,reset,pause)
		variable contagem0		:integer;
		variable contagem1		:integer;
		variable contagem2		:integer;
		variable contagem3		:integer;
		begin
			if reset='1' then
				contagem0:=0;
				contagem1:=0;
				contagem2:=0;
				contagem3:=1;
			elsif (clock'event and clock='1' and pause='0' and not(contagem0=0 and contagem1=0 and contagem2=0 and contagem3=0)) then
				if contagem0=0 then 
					contagem0:=10;
					if contagem1=0 then 
						contagem1:=5;
						if contagem2=0 then
							contagem2:=9;
							if contagem3=1 then
								contagem3:=0;
							end if;
						else 
							contagem2:=contagem2 - 1;
						end if;
					else
						contagem1:=contagem1 - 1;
					end if;
				end if;
				contagem0:=contagem0 - 1;
			end if;
			saida0<= conv_std_logic_vector(contagem0,4);
			saida1<= conv_std_logic_vector(contagem1,4);
			saida2<= conv_std_logic_vector(contagem2,4);
			saida3<= conv_std_logic_vector(contagem3,4);
		end process;		
	end i;