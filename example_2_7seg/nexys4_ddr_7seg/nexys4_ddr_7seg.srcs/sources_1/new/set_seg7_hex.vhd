----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity set_seg7_hex is
    Port ( DIGIT : in STD_LOGIC_VECTOR (3 downto 0);
           SEG7 : out STD_LOGIC_VECTOR (7 downto 0));
end set_seg7_hex;

architecture set_seg7_hex_a of set_seg7_hex is

begin

    p_SET_SEG7_HEX : process(DIGIT)
    
    begin
        case DIGIT is
            when x"0" =>
                SEG7 <= "11000000";
            when x"1" =>
                SEG7 <= "11111001";
            when x"2" =>
                SEG7 <= "10100100"; 
            when x"3" =>
                SEG7 <= "10110000";
            when x"4" =>
                SEG7 <= "10011001";
            when x"5" =>
                SEG7 <= "10010010";
            when x"6" =>
                SEG7 <= "10000010";
            when x"7" =>
                SEG7 <= "11111000";
            when x"8" =>
                SEG7 <= "10000000";
            when x"9" =>
                SEG7 <= "10010000";
            when x"A" =>
                SEG7 <= "10001000";
            when x"B" =>
                SEG7 <= "10000011";
            when x"C" =>
                SEG7 <= "11000110";
            when x"D" =>
                SEG7 <= "10100001";
            when x"E" =>
                SEG7 <= "10000110";
            when others  =>
                SEG7 <= "10001110";      
        end case;        
    end process;
 
end set_seg7_hex_a;
