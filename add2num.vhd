library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity add2num is
    generic(WIDTH: integer := 8);
    port(A,B: in std_logic_vector(WIDTH-1 downto 0);
        clk, reset: in std_logic;
        D: out std_logic_vector(WIDTH-1 downto 0));
end entity;

architecture RTL of add2num is
    signal C : std_logic_vector(WIDTH-1 downto 0);
begin
   C <= std_logic_vector(unsigned(A) + unsigned(B));
    process (clk) 
    begin
      if (rising_edge(clk)) then
      if (reset = '0') then
              D <= (others =>'0'); 
              else
                 D <= C;
             end if;
         end if;
     end process;
end architecture;

