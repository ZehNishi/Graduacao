library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
 
entity Time_1Mhz is
port ( clk: in std_logic; -- Pin connected to P11 (N14)
clk_xHz: out std_logic);-- Can check it using PIN A8 - LEDR0

end Time_1Mhz;
 
architecture freq_div of Time_1Mhz is
 
signal count: integer:=1;
signal tmp : std_logic := '0';
 
begin
 
process(clk)
begin
if(clk'event and clk='1') then
count <=count+1;
if (count = 50000000/2000000) then
tmp <= '1'; 
count <= 1; else 
tmp <= '0';
end if;
end if;
clk_xHz <= tmp;
end process;
 
end freq_div;
