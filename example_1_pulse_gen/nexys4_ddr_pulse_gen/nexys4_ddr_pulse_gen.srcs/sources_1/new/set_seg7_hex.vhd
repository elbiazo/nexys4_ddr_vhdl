----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Eric Biazo
-- 
-- Create Date: 01/31/2020 10:44:42 PM
-- Design Name: Eric Biazo
-- Module Name: seg7_hex - Behavioral
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

entity set_seg7_hex is
    Port ( digit : in STD_LOGIC_VECTOR (3 downto 0);
           seg7 : out STD_LOGIC_VECTOR (7 downto 0));
end set_seg7_hex;

architecture Behavioral of set_seg7_hex is

begin

    p_SET_seg7_HEX : process(digit)
    
    begin
        case digit is
            when x"0" =>
                seg7 <= "11000000";
            when x"1" =>
                seg7 <= "11111001";
            when x"2" =>
                seg7 <= "10100100"; 
            when x"3" =>
                seg7 <= "10110000";
            when x"4" =>
                seg7 <= "10011001";
            when x"5" =>
                seg7 <= "10010010";
            when x"6" =>
                seg7 <= "10000010";
            when x"7" =>
                seg7 <= "11111000";
            when x"8" =>
                seg7 <= "10000000";
            when x"9" =>
                seg7 <= "10010000";
            when x"A" =>
                seg7 <= "10001000";
            when x"B" =>
                seg7 <= "10000011";
            when x"C" =>
                seg7 <= "11000110";
            when x"D" =>
                seg7 <= "10100001";
            when x"E" =>
                seg7 <= "10000110";
            when others  =>
                seg7 <= "10001110";      
        end case;        
    end process;
 
end Behavioral;