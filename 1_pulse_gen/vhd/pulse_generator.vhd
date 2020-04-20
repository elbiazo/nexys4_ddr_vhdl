----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Eric Biazo
-- 
-- Create Date: 02/16/2020 01:11:52 AM
-- Design Name: 
-- Module Name: pulse_generator - Behavioral
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

entity pulse_generator is Port(
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    max_count : in unsigned(26 downto 0);
    pulse_out : out STD_LOGIC);
end pulse_generator;

architecture Behavioral of pulse_generator is
    signal pulse_cnt : unsigned(26 downto 0);
    signal clear : std_logic;
begin
    process(clk, reset)
    begin
        if(reset = '1') then
            pulse_cnt <= (others => '0');
        elsif(rising_edge(clk)) then
            if(clear = '1') then
                pulse_cnt <= (others=>'0');
            else
                pulse_cnt <= pulse_cnt + 1;
            end if;
        end if;
    end process;
    
    clear <= '1' when (pulse_cnt = max_count) else '0';
    pulse_out <= clear;
end Behavioral;
