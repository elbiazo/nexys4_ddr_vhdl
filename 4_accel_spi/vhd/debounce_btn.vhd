----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2020 10:11:19 PM
-- Design Name: 
-- Module Name: debounce_btn - Behavioral
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
use work.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce_btn is
  Port (
            btn_debounce_in : in STD_LOGIC;
            btn_reset_in    : in std_logic;
            clk_in          : in std_logic;
            debounced_signal   : out std_logic
        );
end debounce_btn;

architecture Behavioral of debounce_btn is
--    constant max_count_100ms : unsigned(26 downto 0) := "000100110001001011010000000"; -- 10M in binary since 100MHz/10MHz == 10Hz == 100ms.
    constant max_count_100ms : unsigned(26 downto 0) := "000010011000100101101000000"; -- 50e5 in binary for 50ms.
    signal pulse_100ms : std_logic := '0';
    signal pulse_counter : unsigned(26 downto 0) := (others => '0');
    signal clear : std_logic := '0';
begin
    process(clk_in, btn_reset_in, btn_debounce_in)
    begin
        if(btn_reset_in = '1') then
            pulse_counter <= (others => '0');
        elsif(rising_edge(clk_in)) then
            if(btn_debounce_in = '1') then
                if(pulse_counter < max_count_100ms) then
                    pulse_counter <= pulse_counter + 1;
                else
                    debounced_signal <= '1';
                end if;
            else
                debounced_signal <= '0';
                pulse_counter <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;
