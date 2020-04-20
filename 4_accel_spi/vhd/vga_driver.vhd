----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 12:14:41 AM
-- Design Name: 
-- Module Name: vga_driver - Behavioral
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

entity vga_driver is
  Port (  
            -- Input
            clk    : in  std_logic;
            reset  : in std_logic;
            vga_x  : in integer;
            vga_y  : in integer;
          
            -- Output
            vga_hs : out std_logic;
            vga_vs : out std_logic;
            vga_r  : out STD_LOGIC_VECTOR (3 downto 0);
            vga_b  : out STD_LOGIC_VECTOR (3 downto 0);
            vga_g  : out STD_LOGIC_VECTOR (3 downto 0)
       );
end vga_driver;

architecture Behavioral of vga_driver is
    -- Constants for VGA
    constant h_disp : integer := 640;
    constant h_total  : integer := 800;
    constant h_fp : integer := 16;
    constant h_pw  : integer := 96;
   
    constant v_disp : integer := 480;
    constant v_total  : integer := 521;
    constant v_fp : integer := 10;
    constant v_pw  : integer := 2;

    constant col_black : unsigned(11 downto 0) := (others=>'0');
    constant col_red  : unsigned(11 downto 0) := b"1111_0000_0000";
    constant col_green : unsigned(11 downto 0) := b"0000_1111_0000";
    constant col_blue  : unsigned(11 downto 0) := b"0000_0000_1111";

    -- Signals
    signal pulse_25mhz : std_logic;

    signal h_counter : unsigned(9 downto 0) := (others => '0');
    signal v_counter : unsigned(9 downto 0) := (others => '0');
   
    signal max_count_25mhz : unsigned(26 downto 0) := "000000000000000000000000011";

    signal vga_hs_t : std_logic := '0';
    signal vga_vs_t : std_logic := '0';
    signal vga_rgb_t : unsigned(11 downto 0);
    
begin
    -- Generates 25 MHz pulse
    pulse_generator_i : entity pulse_generator
        port map( clk => clk,
                  reset => reset,
                  max_count => max_count_25mhz,
                  pulse_out => pulse_25mhz );

    -- Horizontal counter that resets when it hits maximum horiontal pixel
    h_counter_proc : process(reset, clk)
    begin
        if(reset = '1') then
            h_counter <= (others => '0');
        elsif(rising_edge(clk)) then
            if(pulse_25mhz = '1') then
                if(h_counter = h_total-1) then
                    h_counter <= (others => '0');
                else
                    h_counter <= h_counter + 1;
                end if;
            end if;
        end if;
    end process h_counter_proc;

    -- Vertical counter that resets when it hits maximum vertical pixel
    v_counter_proc : process(reset, clk)
    begin
        if(reset = '1') then
            v_counter <= (others => '0');
        elsif(rising_edge(clk)) then
            if(pulse_25mhz = '1') then
                if(h_counter = h_total-1) then
                    if(v_counter = v_total-1) then
                        v_counter <= (others => '0');
                    else
                        v_counter <= v_counter + 1;
                    end if;
                end if;
            end if;
        end if;
    end process v_counter_proc;

    -- Calculates Horizontal Sync
    vga_hs_proc : process(reset, clk)
    begin
        if(reset = '1') then
            vga_hs_t <= '0';
        elsif(rising_edge(clk)) then
            if(pulse_25mhz = '1') then
                -- [656,752)
                if(((h_disp + h_fp) <= h_counter) and (h_counter < (h_disp + h_fp)+h_pw)) then
                    vga_hs_t <= '0';
                else
                    vga_hs_t <= '1';
                end if;
            end if;
        end if;
    end process vga_hs_proc;

    -- Calculates Vertical Sync
    vga_vs_proc : process(reset, clk)
    begin
        if(reset = '1') then
            vga_vs_t <= '0';
        elsif(rising_edge(clk)) then
            if(pulse_25mhz = '1') then
                -- [490,492)
                if(((v_disp + v_fp) <= v_counter) and (v_counter < (v_disp + v_fp)+v_pw)) then
                    vga_vs_t <= '0';
                else
                    vga_vs_t <= '1';
                end if;
            end if;
        end if;
    end process vga_vs_proc;
    
    -- Process that draws red box and blue and green checkerbox pattern.
    vga_col_proc : process(reset, clk)
        variable h_start : integer := vga_x * 32;
        variable h_end : integer := (vga_x + 1) * 32;
        variable v_start : integer := vga_y * 32;
        variable v_end : integer := (vga_y + 1) * 32;
    begin
        if(reset = '1') then
            vga_rgb_t <= col_black;
        elsif(rising_edge(clk)) then
            if(pulse_25mhz = '1') then
                if((h_start <= h_counter and h_counter <= h_end) and (v_start <= v_counter and v_counter <= v_end)) then
                    vga_rgb_t <= col_red;
                elsif((h_counter(5) xor v_counter(5)) = '1') then -- Generate checker board pattern
                    vga_rgb_t <= col_blue;
                else
                    vga_rgb_t <= col_green;
                end if;
    
                -- Make color black outside of active area
                if(h_counter >= h_disp or v_counter >= v_disp) then
                    vga_rgb_t <= col_black;
                end if;
            end if;
        end if;
    end process vga_col_proc;

    -- CSA for VGA output
    vga_hs  <= vga_hs_t;
    vga_vs  <= vga_vs_t;
    vga_r <= std_logic_vector(vga_rgb_t(11 downto 8));
    vga_g <= std_logic_vector(vga_rgb_t(7 downto 4));
    vga_b <= std_logic_vector(vga_rgb_t(3 downto 0));
end Behavioral;
