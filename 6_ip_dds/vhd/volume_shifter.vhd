----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2020 01:22:19 AM
-- Design Name: 
-- Module Name: volume_shifter - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity volume_shifter is
  Port (
            sw : in std_logic_vector(2 downto 0);
            sin_out : in std_logic_vector(15 downto 0);
            sin_shifted : out std_logic_vector(15 downto 0)
        );
end volume_shifter;

architecture Behavioral of volume_shifter is
    signal sin_shifted_t : unsigned(15 downto 0) := (others=>'0');
begin
    -- Shifts the sin signal right depening on the switch setting. Controls volumn.
    with sw select
        sin_shifted_t <= shift_right(unsigned(sin_out), 7) when "111",
                         shift_right(unsigned(sin_out), 6) when "110",  
                         shift_right(unsigned(sin_out), 5) when "101",  
                         shift_right(unsigned(sin_out), 4) when "100",  
                         shift_right(unsigned(sin_out), 3) when "011",  
                         shift_right(unsigned(sin_out), 2) when "010",  
                         shift_right(unsigned(sin_out), 1) when "001",
                         unsigned(sin_out)                 when "000",
                         unsigned(sin_out)                 when others;
                         
    sin_shifted <= std_logic_vector(sin_shifted_t);
end Behavioral;
