----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2020 11:41:23 PM
-- Design Name: 
-- Module Name: tb_debounce_btn - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_debounce_btn is
--  Port ( );
end tb_debounce_btn;

architecture testbench of tb_debounce_btn is
    signal btn_debounce_in : std_logic := '0';
    signal btn_reset_in    : std_logic := '0';
    signal clk_in          : std_logic := '0';
    signal pulse_btn_out   : std_logic := '0';
begin
    dut : entity debounce_btn port map(
            btn_debounce_in => btn_debounce_in,
            btn_reset_in    => btn_reset_in,   
            clk_in          => clk_in,         
            debounced_signal   => pulse_btn_out  
        );
    
    generate_clk_100mhz : process
    begin
        clk_in <= '0';
        wait for 5 ns;
        clk_in <= '1';
        wait for 5 ns;
    end process;
    
    generate_btn_press : process
    begin
        -- First test shouldn't trigger the button since its below 100ms.
        btn_debounce_in <= '0';
        wait for 10 ms;
        btn_debounce_in <= '1';
        wait for 50 ms;
        
        -- Second test shouldn't trigger the button HIGH. Pretty close to triggering the button HIGH.
        btn_debounce_in <= '0';
        wait for 10 ms;
        btn_debounce_in <= '1';
        wait for 100 ms; 
        
        -- Third test should trigger the button HIGH.
        btn_debounce_in <= '0';
        wait for 10 ms;
        btn_debounce_in <= '1';
        wait for 150 ms; 
        
        -- Fourth test should trigger the button HIGH.
        btn_debounce_in <= '0';
        wait for 10 ms;
        btn_debounce_in <= '1';
        wait for 200 ms; 

        -- Resetting the button to see if button is set to LOW.
        btn_debounce_in <= '0';
        wait for 10 ms;
    end process;
end testbench;
