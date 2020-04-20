----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2020 01:21:49 AM
-- Design Name: 
-- Module Name: phase_accum - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity phase_accum is
  Port (
            sample_rate : in std_logic;
            clk_100mhz  : in std_logic;
            reset       : in std_logic;
            phase       : out std_logic_vector(7 downto 0)
        );
end phase_accum;

architecture Behavioral of phase_accum is
    signal theta : unsigned(7 downto 0) := (others=>'0');
begin
    -- Counter that increments theta when sample_rate is high
    process(reset, clk_100mhz)
    begin
        if(reset = '1') then
            theta <= (others=>'0');
        elsif(rising_edge(clk_100mhz)) then
            if(sample_rate = '1') then
                theta <= theta + 1;
            end if;
        end if;
    end process;
    
    phase <= std_logic_vector(theta);
end Behavioral;
