----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2020 06:13:18 PM
-- Design Name: 
-- Module Name: pwm_gen - Behavioral
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

entity pwm_gen is
  Port (
            clk : in std_logic;
            reset : in std_logic;
            duty_cycle : in std_logic_vector(9 downto 0);
            pwm_out : out std_logic
        );
end pwm_gen;

architecture Behavioral of pwm_gen is
    signal cntr : unsigned(9 downto 0) := (others => '0');
    signal duty_cycle_t : unsigned(9 downto 0) := (others => '0');
    signal pwm_out_t : std_logic;
begin

    -- Counts to 1023. Sets pwm_out high if cntr is less than the duty_cycle_y.
    process(reset, clk)
    begin
        if(reset = '1') then
            cntr <= (others=>'0');
        elsif(rising_edge(clk)) then
            if(cntr = 0) then
                duty_cycle_t <= unsigned(duty_cycle);
            else
                cntr <= cntr + 1;
            end if;
        end if;
    end process;
    
    pwm_out <= '1' when(cntr < duty_cycle_t) else '0';
end Behavioral;
