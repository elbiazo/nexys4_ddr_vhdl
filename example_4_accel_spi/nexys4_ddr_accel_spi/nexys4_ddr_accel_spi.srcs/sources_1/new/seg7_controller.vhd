----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Eric Biazo
-- 
-- Create Date: 02/16/2020 12:22:38 AM
-- Design Name: 
-- Module Name: seg7_controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Controls 7 Segment. Changes each segment sequentially every 1ms with given characters.
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


entity seg7_controller is
    Port (  
        -- Clock
        clk : in STD_LOGIC;
        -- Reset
        reset: in STD_LOGIC;
        -- 8 Display Character
        char_7 : in STD_LOGIC_VECTOR (3 downto 0);
        char_6 : in STD_LOGIC_VECTOR (3 downto 0);
        char_5 : in STD_LOGIC_VECTOR (3 downto 0);
        char_4 : in STD_LOGIC_VECTOR (3 downto 0);
        char_3 : in STD_LOGIC_VECTOR (3 downto 0);
        char_2 : in STD_LOGIC_VECTOR (3 downto 0);
        char_1 : in STD_LOGIC_VECTOR (3 downto 0);
        char_0 : in STD_LOGIC_VECTOR (3 downto 0);
        -- Set7 Display Signals
        seg7_cath : out STD_LOGIC_VECTOR (7 downto 0);
        -- Anode
        an : out STD_LOGIC_VECTOR(7 downto 0));
end seg7_controller;

architecture Behavioral of seg7_controller is
     signal display_digit : std_logic_vector(3 downto 0);
     signal cntr3bit : unsigned(2 downto 0) := (others => '0');
     -- 100000 in binary. Used as counter with clock to make 1KHz pulse.
     signal max_count_1khz : unsigned(26 downto 0) := "000000000011000011010100000";
     -- Enable bit for the pulse that goes HIGH every 1ms.
     signal pulse_1khz : std_logic;
begin
    -- Set segment as hexidecimal depending on the four bit value of digit
    set_seg7_hex_i : entity set_seg7_hex(Behavioral) port map(
        digit => display_digit,
        seg7 => seg7_cath
    );
    
    pulse_generator_i : entity pulse_generator
        port map( clk => clk,
                  reset => reset,
                  max_count => max_count_1khz,
                  pulse_out => pulse_1khz );
                  
    set_anode_1ms : process(clk, reset)
    begin
        if(reset = '1') then
            -- Start from right most segment again.
            cntr3bit <= (others => '0');
            -- Set all segment to 0.
            display_digit <=  x"0";
            -- Turn on all the segment.
            an(7 downto 0) <= (others => '0');
            
        elsif(rising_edge(clk)) then 
            -- Every millisecond, set anode and character for right segment to left.
            if(pulse_1khz ='1') then
                if(cntr3bit = "000") then
                    an(0) <= '0';
                    an(7 downto 1) <= (others => '1');
                    display_digit <= char_0; 
                elsif(cntr3bit = "001") then
                    an(0) <= '1';
                    an(1) <= '0';
                    display_digit <= char_1;
                elsif(cntr3bit = "010") then
                    an(1) <= '1';
                    an(2) <= '0';
                    display_digit <= char_2;
                elsif(cntr3bit = "011") then
                    an(2) <= '1';
                    an(3) <= '0';
                    display_digit <= char_3;
                elsif(cntr3bit = "100") then
                    an(3) <= '1';
                    an(4) <= '0';
                    display_digit <= char_4;
                elsif(cntr3bit = "101") then
                    an(4) <= '1';
                    an(5) <= '0';
                    display_digit <= char_5;
                elsif(cntr3bit = "110") then
                    an(5) <= '1';
                    an(6) <= '0';
                    display_digit <= char_6;
                elsif(cntr3bit = "111") then
                    an(6) <= '1';
                    an(7) <= '0';
                    display_digit <= char_7;
                else
                    an(7 downto 0) <= (others => '1');
                    display_digit <= (others => '0');
                end if;
                
                cntr3bit <= cntr3bit + 1;
            end if;
        end if;
    end process;
end Behavioral;
