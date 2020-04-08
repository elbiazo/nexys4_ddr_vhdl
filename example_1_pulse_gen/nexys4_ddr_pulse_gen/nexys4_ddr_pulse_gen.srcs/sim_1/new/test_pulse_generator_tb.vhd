----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2020 03:07:03 AM
-- Design Name: Eric Biazo
-- Module Name: test_pulse_generator_tb - testbench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_pulse_generator_tb is
--  Port ( );
end test_pulse_generator_tb;

architecture testbench of test_pulse_generator_tb is
    signal clock : std_logic;
    signal reset : std_logic;
    signal max_count_1khz : unsigned(26 downto 0) := (others => '0');
    signal pulse_1khz : std_logic;
begin
pulse_generator_cut : entity pulse_generator 
port map(
    clk => clock,
    reset => reset,
    max_count => max_count_1khz,
    pulse_out => pulse_1khz);

-- Reference from the start of the simulation
reset <= '0', '1' after 20 ns, '0' after 100 ns;
max_count_1khz <= "000000000011000011010100000";

process -- No sensitivity list
begin
    clock <= '1';
    wait for 5 ns;
    clock <= '0';
    wait for 5 ns;
end process;
end testbench;
