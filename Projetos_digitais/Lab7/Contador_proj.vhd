Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

ENTITY Contador_proj IS
PORT(
	clock			:IN STD_LOGIC;
	reset			:IN STD_LOGIC;
	enable		:IN STD_LOGIC;
	sx8,sx1		:OUT STD_LOGIC);
end Contador_proj;

architecture funcionamento of Contador_proj is 
	type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
	signal estado	: state_type;
begin
	process (clock, reset)
	begin
		if reset='1' then
			estado <=s15;
		elsif ((clock'event and clock='1')) then
		if (enable='1') then
			case estado is
				when s0=>
					sx8<='0';
					sx1<='0';
					estado <= s1;
				when s1=>
					sx8<='1';
					sx1<='0';
					estado <= s2;
				when s2=>			
					sx8<='0';
					sx1<='0';
					estado <= s3;
				when s3=>
					sx8<='1';
					sx1<='0';
					estado <= s4;
				when s4=>
					sx8<='0';
					sx1<='0';
					estado <= s5;
				when s5=>
					sx8<='1';
					sx1<='0';
					estado <= s6;
				when s6=>					
					sx8<='0';
					sx1<='0';
					estado <= s7;
				when s7=>
					sx8<='1';
					sx1<='0';
					estado <= s8;
				when s8=>
					sx8<='0';
					sx1<='0';
					estado <= s9;
				when s9=>					
					sx8<='1';
					sx1<='0';
					estado <= s10;
				when s10=>			
					sx8<='0';
					sx1<='0';
					estado <= s11;
				when s11=>
					sx8<='1';
					sx1<='0';
					estado <= s12;
				when s12=>
					sx8<='0';
					sx1<='0';
					estado <= s13;
				when s13=>					
					sx8<='1';
					sx1<='0';
					estado <= s14;
				when s14=>					
					sx8<='0';
					sx1<='1';
					estado <= s15;
				when s15=>
					sx8<='1';
					sx1<='1';
					estado <= s0;
			end case;
		end if;
		end if;
	end process;
end funcionamento;