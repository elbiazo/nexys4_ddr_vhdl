----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2020 01:21:35 AM
-- Design Name: 
-- Module Name: sample_rate_gen - Behavioral
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

entity sample_rate_gen is
  Port (
            clk_100mhz  : in std_logic;
            reset       : in std_logic;
            sw          : in std_logic_vector(2 downto 0);
            sample_rate : out std_logic
        );
end sample_rate_gen;

architecture Behavioral of sample_rate_gen is
    signal rate_cntr : integer := 0;
    signal freq : integer := 0;
    signal max_rate_cnt : integer := 0;
    signal cntr : unsigned(11 downto 0) := (others=>'0');
    signal clear : std_logic := '0';
begin

    -- Sets frequency depending on the switch setting
    with sw select
        freq <= 0    when "000",
                500 when "001",  
                1000 when "010",  
                1500 when "011",  
                2000 when "100",  
                2500 when "101",  
                3000 when "110",
                3500 when "111",
                0    when others;
                
    -- Sets the correct max rate depending on the freq. max_rate_cnt = (1/freq) * 100MHz * (1/256)
    with freq select               
        max_rate_cnt <= 0    when  0   , 
                        781  when  500 ,  
                        391 when  1000, 
                        260 when  1500, 
                        195 when  2000, 
                        156 when  2500, 
                        130 when  3000, 
                        112 when  3500, 
                        0    when others;
                             
     -- Counter that sets sample_rate high when counter reaches its max_rate_cnt
     process(reset, clk_100mhz)
     begin
        if(reset = '1') then
            cntr <= (others=>'0');
        elsif(rising_edge(clk_100mhz)) then
            if(clear = '1') then
                cntr <= (others=>'0');
            else
                cntr <= cntr + 1;
            end if;
        end if;
     end process;
     
     clear <= '1' when(cntr = to_unsigned(max_rate_cnt-1, cntr'length)) else '0';
     sample_rate <= clear;
end Behavioral;
