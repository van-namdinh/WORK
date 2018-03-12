---------------------------------------------------------------------------------
--
-- Copyright (c) 2017 by SISLAB Team, LSI Design Contest 2018.
-- The University of Engineering and Technology, Vietnam National University.
-- All right resevered.
--
-- Copyright notification
-- No part may be reproduced except as authorized by written permission.
-- 
-- @File            : add2numTB.vhd
-- @Author          : Van-Nam DINH @Modifier      : Huy-Hung Ho
-- @Created Date    : Th02 24 2018       @Modified Date : Th02 24 2018 13:30
-- @Project         : Artificial Neural Network
-- @Module          : add2numTB
-- @Description     :
-- @Version         :
-- @ID              :
--
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- Library declaration
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------- 
entity add2numTB is
       
end add2numTB; 

---------------------------------------------------------------------------------
-- Architecture description
---------------------------------------------------------------------------------
architecture behavior of add2numTB is

    COMPONENT add2num
       generic(WIDTH : integer := 8);
        port(
            A,B     : in std_logic_vector(WIDTH-1 DOWNTO 0);
            clk     : in std_logic;
            reset     : in std_logic;
            D       : out std_logic_vector(WIDTH-1 DOWNTO 0)
    );
    END COMPONENT;
    
    --Inputs
	constant WIDTH : integer :=8;
    signal A    : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0) := (others => '0');
    signal B    : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0) := (others => '0');
	signal clk	: STD_LOGIC := '0';
	signal reset	: STD_LOGIC := '0';
    --Outputs
    signal D    : STD_LOGIC_VECTOR(WIDTH -1 DOWNTO 0);
	constant half_period : time := 10 ns;

    begin
    uut: Add2num PORT MAP(

	A => A,B => B,D => D, clk => clk, reset => reset);
	clk <= not clk after half_period;
--Stimulus process
    stim_proc: process
begin
	reset <= '0';
    A <= "00000000";-- A = 0
    B <= "00000000";-- B = 0
    wait for 10 ns;
	reset <= '1';
    wait for 10 ns;
    assert (D = "00000000") report "No ERR!" severity error;--D = 0
    wait for 20 ns;

--case 2
    A <="00000001"; -- A = 1
    B <="00000000"; -- B = 0
    wait for 10 ns;
    assert (D = "00000001") report "No ERR!" severity error;--D = 1
    wait for 20 ns;

--case 3
    A <="00000011";--A = 3
    B <="00000010";--B = 2
    wait for 10 ns;
    assert (D = "00000101") report "No ERR!" severity error;--D = 5
    wait for 20 ns;

--case 4
    A <="00001011";--A = 11
    B <="00000110";--B = 6
    wait for 10 ns;
    assert (D = "00000000") report "No ERR!" severity error;--D = 17
    wait for 20 ns;

end process;
end behavior;

