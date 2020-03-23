----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2020 10:55:42 PM
-- Design Name: 
-- Module Name: accel_spi_top - Behavioral
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

entity accel_spi_top is
  Port (
            -- Inputs
            -- Buttons
            BTNC : in STD_LOGIC;
            BTNL : in STD_LOGIC;
            BTNR : in STD_LOGIC;
            BTNU : in STD_LOGIC;
            BTND : in STD_LOGIC;        
            
            -- Clock
            CLK100MHZ : in STD_LOGIC;
            
            -- Outputs
            -- 7 Segment  
            SEG7_CATH : out STD_LOGIC_VECTOR(7 downto 0);
            AN :out STD_LOGIC_VECTOR(7 downto 0);
            
            -- LEDs
            LED : out STD_LOGIC_VECTOR(15 downto 0);
            
            -- VGA
            VGA_R : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_G : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_B : out STD_LOGIC_VECTOR(3 downto 0);
            
            VGA_HS : out STD_LOGIC;
            VGA_VS : out STD_LOGIC
        );
end accel_spi_top;

architecture Behavioral of accel_spi_top is
    signal seg_count : unsigned(3 downto 0) := (others => '0');
    signal debounced_signal : std_logic := '0';
    signal btn_pressed : std_logic := '0';
    signal pulse : std_logic := '0';
    
    signal vga_x : integer := 0;
    signal vga_y : integer := 0;
    
begin

    vga_driver_ins : entity vga_driver port map(
            clk    => CLK100MHZ,
            reset  => BTNC,
            vga_x => vga_x,
            vga_y => vga_y,
            vga_hs => VGA_HS,
            vga_vs => VGA_VS,
            vga_r  => VGA_R,
            vga_g  => VGA_G,
            vga_b  => VGA_B
        );
        
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
end Behavioral;