----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 12:28:40 AM
-- Design Name: 
-- Module Name: tb_vga_driver - testbench
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
use ieee.numeric_std.all;
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_vga_driver is
--  Port ( );
end tb_vga_driver;

architecture testbench of tb_vga_driver is
    signal clock : std_logic;
    signal reset : std_logic;
    signal vga_hs : STD_LOGIC;                    
    signal vga_vs : STD_LOGIC;                    
    signal vga_r  : STD_LOGIC_VECTOR(3 downto 0); 
    signal vga_g  : STD_LOGIC_VECTOR(3 downto 0); 
    signal vga_b  : STD_LOGIC_VECTOR(3 downto 0);
    signal pulse : std_logic;
begin
pulse_generator_cut : entity vga_driver 
port map(
        clk => clock,
        reset => reset,
        vga_hs => vga_hs,
        vga_vs => vga_vs,
        vga_r  => vga_r,
        vga_g  => vga_g,
        vga_b  => vga_b,
        pulse => pulse
    );
-- Reference from the start of the simulation
--reset <= '0', '1' after 20 ns, '0' after 100 ns;

process -- No sensitivity list
begin
    clock <= '1';
    wait for 5 ns;
    clock <= '0';
    wait for 5 ns;
end process;

end testbench;
