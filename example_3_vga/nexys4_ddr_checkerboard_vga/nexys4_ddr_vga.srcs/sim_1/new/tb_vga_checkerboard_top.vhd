----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2020 10:18:29 PM
-- Design Name: 
-- Module Name: tb_vga_checkerboard_top - Behavioral
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

entity tb_vga_checkerboard_top is
--  Port ( );
end tb_vga_checkerboard_top;

architecture testbench of tb_vga_checkerboard_top is
    signal CLK100MHZ : std_logic := '0';
    signal BTNC : std_logic := '0';
    signal BTNU : std_logic := '0';
    signal BTNR : std_logic := '0';
    signal BTND : std_logic := '0';
    signal BTNL : std_logic := '0';
    signal VGA_HS : std_logic := '0';
    signal VGA_VS: std_logic := '0';  
    signal VGA_R : std_logic_vector(3 downto 0) := (others=>'0'); 
    signal VGA_G : std_logic_vector(3 downto 0) := (others=>'0');
    signal VGA_B : std_logic_vector(3 downto 0) := (others=>'0');  
    signal AN : STD_LOGIC_VECTOR(7 downto 0);
    signal LED :  STD_LOGIC_VECTOR(15 downto 0);
    signal vga_x : integer := 0;
    signal vga_y : integer := 0;
    signal SEG7_CATH :  STD_LOGIC_VECTOR(7 downto 0);
begin
    generate_clk_100mhz : process
    begin
        CLK100MHZ <= '0';
        wait for 5 ns;
        CLK100MHZ <= '1';
        wait for 5 ns;
    end process;
    
    process
    begin
        BTNR <= '1';
        wait for 100 ms;
        BTNR <= '0';
        wait for 100 ms;
        
    end process;
--    vga_driver_ins : entity vga_driver port map(
--            clk    => CLK100MHZ,
--            reset  => BTNC,
--            vga_hs => VGA_HS,
--            vga_vs => VGA_VS,
--            vga_r  => VGA_R,
--            vga_g  => VGA_G,
--            vga_b  => VGA_B,
--            vga_x => vga_x,
--            vga_y => vga_y
--        );
        
    vga_red_controller_ins : entity vga_red_controller port map(
            CLK100MHZ     => CLK100MHZ,         
            LED           => LED,      
            SEG7_CATH     => SEG7_CATH,
            AN            => AN,       
            vga_x         => vga_x,    
            vga_y         => vga_y,
            BTNC          => BTNC,
            BTNL          => BTNL,
            BTNR          => BTNR,
            BTNU          => BTNU,
            BTND          => BTND
        );
end testbench;
