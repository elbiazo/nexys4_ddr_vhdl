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
               
            -- Switches
            SW : in std_logic_vector(15 downto 0);
            
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
            VGA_VS : out STD_LOGIC;

            -- Accelerometer
            ACL_MOSI  : out  std_logic;
            ACL_SCLK  : out  std_logic;
            ACL_MISO  : in std_logic;
            ACL_CSN   : out std_logic
        );
end accel_spi_top;

architecture Behavioral of accel_spi_top is
    signal seg_count : unsigned(3 downto 0) := (others => '0');
    signal debounced_signal : std_logic := '0';
    signal btn_pressed : std_logic := '0';
    signal pulse : std_logic := '0';
    
    signal vga_x : integer := 0;
    signal vga_y : integer := 0;

    signal vga_x_btn : integer := 0;
    signal vga_y_btn : integer := 0;

    signal vga_x_accel : integer := 0;
    signal vga_y_accel : integer := 0;

    signal DATA_X : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal DATA_Y : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal DATA_Z : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal ID_AD : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal ID_1D : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
    signal vga_x_slv : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal vga_y_slv : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    signal char_7 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_6 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_5 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_4 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_3 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_2 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_1 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_0 : std_logic_vector(3 downto 0) := (others => '0');
begin
    vga_x_slv <= std_logic_vector(to_unsigned(vga_x, vga_x_slv'length));
    vga_y_slv <= std_logic_vector(to_unsigned(vga_y, vga_y_slv'length));

    char_7 <= DATA_X(7 downto 4);
    char_6 <= DATA_X(3 downto 0);
    char_5 <= DATA_Y(7 downto 4);
    char_4 <= DATA_Y(3 downto 0);
    char_3 <= vga_x_slv(7 downto 4);
    char_2 <= vga_x_slv(3 downto 0);
    char_1 <= vga_y_slv(7 downto 4);
    char_0 <= vga_y_slv(3 downto 0);

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
        
     vga_red_controller_ins : entity vga_red_controller
        port map(
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
            BTND          => BTND,
            SW            => SW,
            --Values from Accel
            DATA_X => DATA_X,
            DATA_Y => DATA_Y,
            DATA_Z => DATA_Z,
            ID_AD => ID_AD,
            ID_1D => ID_1D,
            --SPI Signals
            CSb => ACL_CSN,
            MOSI => ACL_MOSI,
            SCLK => ACL_SCLK,
            MISO => ACL_MISO
        );
   
        

        
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
                  seg7_cath => SEG7_CATH,
                  an => AN
                );
end Behavioral;