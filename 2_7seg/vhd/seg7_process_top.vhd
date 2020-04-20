----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Eric Biazo
-- 
-- Create Date: 01/31/2020 10:45:59 PM
-- Design Name: 
-- Module Name: lab1_top - Behavioral
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

entity seg7_process_top is
    Port ( 
        -- Push Buttons
        BTNC : in STD_LOGIC;
        BTND: in STD_LOGIC;
        BTNU : in STD_LOGIC;
        
        -- Switches (16 Switches)
        SW : in STD_LOGIC_VECTOR (15 downto 0);
        
        -- LEDs (16 LEDs)
        LED: out STD_LOGIC_VECTOR (15 downto 0);
        
        -- Set7 Display Signals
        SEG7_CATH : out STD_LOGIC_VECTOR (7 downto 0);
        AN : out STD_LOGIC_VECTOR (7 downto 0));
end seg7_process_top;

architecture seg7_process_top_a of seg7_process_top is
     signal display_digit : std_logic_vector(3 downto 0);
begin
    
    -- Set segment as hexidecimal depending on the four bit value of DIGIT
    i_SET_SEG7_HEX : entity work.set_seg7_hex(set_seg7_hex_a) port map(
        DIGIT => display_digit,
        SEG7 => SEG7_CATH
    );
    
    -- Set LED to HIGH when SW is set
    LED <= SW;

    process(BTNC, BTNU, BTND, SW)
    begin
        -- When BTNC is pressed, everything will be 0. Else it will set it to right value. display_digit signal is used to old the output of this conditional statement.
        if(BTNC = '1') then
            display_digit <= b"0000";
        else
            display_digit <= SW(3 downto 0);
        end if;

        -- Controls Anode 7 - 0. Since we are using when/else, there is priority in each conditional statement.
        -- First condition for each AN will check if BTNU and BTND is both pressed. If it is, set AN to '0'
        -- Second condition checks if BTNC is pressed. If it is, set AN to '0'
        -- Third condition, for AN 7 - 4, it will see if BTND is pressed. If it is, set AN to '1'. fFor AN 3 - 0, it will see if BTNU is pressed.
        -- Fourth condition will see if coresponding switch is pressed for each of AN and set AN value accordingly.
        -- Else, set AN to '1'
        if(BTNU = '1' and BTND = '1') then
            AN(7) <= '0';
        elsif(BTNC = '1') then
            AN(7) <= '0';
        elsif(BTND = '1') then
            AN(7) <= '1';
        elsif(SW(11) = '1' or BTNU = '1') then
            AN(7) <= '0';
        else
            AN(7) <= '1';
        end if;
        
        if(BTNU = '1' and BTND = '1') then
            AN(6) <= '0';
        elsif(BTNC = '1') then
            AN(6) <= '0';
        elsif(BTND = '1') then
            AN(6) <= '1';
        elsif(SW(10) = '1' or BTNU = '1') then
            AN(6) <= '0';
        else
            AN(6) <= '1';
        end if;
        
        if(BTNU = '1' and BTND = '1') then
            AN(5) <= '0';
        elsif(BTNC = '1') then
            AN(5) <= '0';
        elsif(BTND = '1') then
            AN(5) <= '1';
        elsif(SW(9) = '1' or BTNU = '1') then
            AN(5) <= '0';
        else
            AN(5) <= '1';
        end if;
        
        if(BTNU = '1' and BTND = '1') then
            AN(4) <= '0';
        elsif(BTNC = '1') then
            AN(4) <= '0';
        elsif(BTND = '1') then
            AN(4) <= '1';
        elsif(SW(8) = '1' or BTNU = '1') then
            AN(4) <= '0';
        else
            AN(4) <= '1';
        end if;
        
        if(BTNU = '1' and BTND = '1') then
            AN(3) <= '0';
        elsif(BTNC = '1') then
            AN(3) <= '0';
        elsif(BTNU = '1') then
            AN(3) <= '1';
        elsif(SW(7) = '1' or BTND = '1') then
            AN(3) <= '0';
        else
            AN(3) <= '1';
        end if;
        
        if(BTNU = '1' and BTND = '1') then
            AN(2) <= '0';
        elsif(BTNC = '1') then
            AN(2) <= '0';
        elsif(BTNU = '1') then
            AN(2) <= '1';
        elsif(SW(6) = '1' or BTND = '1') then
            AN(2) <= '0';
        else
            AN(2) <= '1';
        end if;
        
        if(BTNU = '1' and BTND = '1') then
            AN(1) <= '0';
        elsif(BTNC = '1') then
            AN(1) <= '0';
        elsif(BTNU = '1') then
            AN(1) <= '1';
        elsif(SW(5) = '1' or BTND = '1') then
            AN(1) <= '0';
        else
            AN(1) <= '1';
        end if;
        
        if(BTNU = '1' and BTND = '1') then
            AN(0) <= '0';
        elsif(BTNC = '1') then
            AN(0) <= '0';
        elsif(BTNU = '1') then
            AN(0) <= '1';
        elsif(SW(4) = '1' or BTND = '1') then
            AN(0) <= '0';
        else
            AN(0) <= '1';
        end if;
    end process;            
          
end seg7_process_top_a;
