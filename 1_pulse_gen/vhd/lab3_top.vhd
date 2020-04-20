----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Eric Biazo
-- 
-- Create Date: 02/16/2020 12:22:38 AM
-- Design Name: 
-- Module Name: lab3_top - Behavioral
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


entity lab3_top is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR(15 downto 0);
           LED : out STD_LOGIC_VECTOR(15 downto 0);
           SEG7_CATH : out STD_LOGIC_VECTOR(7 downto 0);
           AN : out STD_LOGIC_VECTOR(7 downto 0));
end lab3_top;

architecture Behavioral of lab3_top is
    -- 100,000,000 in binary. 100MHz / 100M = 1Hz.
    signal max_count_1hz : unsigned(26 downto 0):= "101111101011110000100000000";
    
    -- Pulse that will be HIGH every 1 second. Used as enable for shift_seg_left process.
    signal pulse_1hz : std_logic;
    signal char_7 : STD_LOGIC_VECTOR (3 downto 0);
    signal char_6 : STD_LOGIC_VECTOR (3 downto 0);
    signal char_5 : STD_LOGIC_VECTOR (3 downto 0);
    signal char_4 : STD_LOGIC_VECTOR (3 downto 0);
    signal char_3 : STD_LOGIC_VECTOR (3 downto 0);
    signal char_2 : STD_LOGIC_VECTOR (3 downto 0);
    signal char_1 : STD_LOGIC_VECTOR (3 downto 0);
    signal char_0 : STD_LOGIC_VECTOR (3 downto 0);

begin
    
    -- Set LED depending on the Switch.
    LED <= SW;

    pulse_generator_i : entity pulse_generator
        port map( clk => CLK100MHZ,
                  reset => BTNC,
                  max_count => max_count_1hz,
                  pulse_out => pulse_1hz );
                  
    shift_seg_left : process(CLK100MHZ, BTNC)
    begin
        -- When BTNC is HIGH, set every characters to 0. Reset.
        if(BTNC = '1') then
            char_7 <= x"0";
            char_6 <= x"0";
            char_5 <= x"0";
            char_4 <= x"0";
            char_3 <= x"0";
            char_2 <= x"0";
            char_1 <= x"0";
            char_0 <= x"0";
            
        elsif(rising_edge(CLK100MHZ)) then
            -- Every 1 second, shift value from sw(3 downto 0) to left segment.
            if(pulse_1hz = '1') then
                char_0 <= sw(3 downto 0);
                char_1 <= char_0;
                char_2 <= char_1;
                char_3 <= char_2;
                char_4 <= char_3;
                char_5 <= char_4;
                char_6 <= char_5;
                char_7 <= char_6;
            end if;
        end if;
    end process;

    seg7_controller_i : entity seg7_controller 
        port map( clk => CLK100MHZ,
                  reset => btnc,
                  char_7 => char_7,
                  char_6 => char_6,
                  char_5 => char_5,
                  char_4 => char_4,
                  char_3 => char_3,
                  char_2 => char_2,
                  char_1 => char_1,
                  char_0 => char_0,
                  seg7_cath => seg7_cath,
                  an => an);
end Behavioral;
