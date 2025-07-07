Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

ENTITY Comparador IS
PORT(
	reset								:IN STD_LOGIC;
	a,b								:in STD_LOGIC_VECTOR(7 downto 0);
	set								:IN STD_LOGIC_VECTOR(3 downto 0);
	pontoa,pontob					:OUT STD_LOGIc);
end Comparador;

architecture i of Comparador is 

	begin
		process (reset,a,b,set)
		begin
			if reset='1' then
				pontoa<='0';
				pontob<='0';
			elsif ((a>(b+2))) then
				pontoa<='1';
			end if;
		end process;		
	end i;