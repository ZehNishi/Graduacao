Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

ENTITY Detector53 IS
PORT(
	clock		:IN STD_LOGIC;
	reset		:IN STD_LOGIC;
	entrada	:IN STD_LOGIC;
	d_s		:OUT STD_LOGIC;
	est	:out std_logic_vector(2 downto 0));
end Detector53;

architecture funcionamento of Detector53 is 
	type state_type is (s0,s1,s2,s3,s4,s5,s6,s7);
	signal estado	: state_type;
begin
	process (clock, reset)
	begin
		if reset='1' then
			estado <=s0;
		elsif (clock'event and clock='1') then
			case estado is
				when s0=>
					d_s<='0';
					est<="000";
					if entrada ='1' then
						estado <= s0;
					else
						estado <= s1;
					end if;
				when s1=>
					est<="001";
					if entrada ='1' then
						estado <= s2;
					else
						estado <= s1;
					end if;
				when s2=>
					est<="010";
					if entrada ='1' then
						estado <= s0;
					else
						estado <= s3;
					end if;
				when s3=>
					est<="011";
					if entrada ='1' then
						estado <= s4;
					else
						estado <= s1;
					end if;
				when s4=>
					est<="100";
					if entrada ='1' then
						estado <= s0;
					else
						estado <= s5;
					end if;
				when s5=>
					est<="101";
					if entrada ='1' then
						estado <= s2;
					else
						estado <= s6;
					end if;
				when s6=>
					est<="110";
					if entrada ='1' then
						estado <= s7;
					else
						estado <= s1;
					end if;
				when s7=>
					est<="111";
					if entrada ='1' then
						estado <= s0;
						d_s<='1';
					else
						estado <= s3;
					end if;
			end case;
		end if;
	end process;
end funcionamento;