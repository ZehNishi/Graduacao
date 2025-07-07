Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

ENTITY Detector IS
PORT(
	clock		:IN STD_LOGIC;
	entrada	:IN STD_LOGIC;
	reset		:IN STD_LOGIC;
	saida		:OUT STD_LOGIC_VECTOR(2 downto 0);
	d_s		:OUT STD_LOGIC);
end Detector;

architecture funcionamento of Detector is 
	type state_type is (s0,s1,s2,s3,s4,s5,s6,s7);
	signal estado	: state_type;
begin
	process (clock, reset)
	begin
		if reset='0' then
			estado <=s0;
		elsif (clock'event and clock='1') then
			case estado is
				when s0=>
					if entrada ='1' then
						estado <= s1;
					else
						estado <= s0;
					end if;
				when s1=>
					if entrada ='1' then
						estado <= s1;
					else
						estado <= s2;
					end if;
				when s2=>
					if entrada ='1' then
						estado <= s3;
					else
						estado <= s0;
					end if;
				when s3=>
					if entrada ='1' then
						estado <= s1;
					else
						estado <= s4;
					end if;
				when s4=>
					if entrada ='1' then
						estado <= s1;
					else
						estado <= s5;
					end if;
				when s5=>
					if entrada ='1' then
						estado <= s6;
					else
						estado <= s0;
					end if;
				when s6=>
					if entrada ='1' then
						estado <= s0;
					else
						estado <= s0;
					end if;
				when s7=>
					if entrada ='1' then
						estado <= s0;
					else
						estado <= s0;
					end if;
			end case;
		end if;
	end process;
	process(estado)
	begin
		case estado is
			when s0=>
				saida<="000";
				d_s<='0';
			when s1=>
				saida<="001";
			when s2=>
				saida<="010";
			when s3=>
				saida<="011";
			when s4=>
				saida<="100";
			when s5=>
				saida<="101";
			when s6=>
				saida<="110";
				d_s<='1';
			when s7=>
				saida<="111";
		end case;
	end process;
end funcionamento;