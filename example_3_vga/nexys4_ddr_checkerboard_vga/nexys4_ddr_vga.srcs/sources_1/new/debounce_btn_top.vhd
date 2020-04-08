----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2020 10:55:42 PM
-- Design Name: 
-- Module Name: debounce_btn_top - Behavioral
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

entity debounce_btn_top is
  Port (
            -- Buttons
            BTNC : in STD_LOGIC;
            BTNL : in STD_LOGIC;
            BTNR : in STD_LOGIC;
            BTNU : in STD_LOGIC;
            BTND : in STD_LOGIC;   
            SEG7_CATH : out STD_LOGIC_VECTOR(7 downto 0);
            AN :out STD_LOGIC_VECTOR(7 downto 0);
            CLK100MHZ : in STD_LOGIC
        );
end debounce_btn_top;

architecture Behavioral of debounce_btn_top is
    signal vga_x_index : unsigned(9 downto 0) := (others => '0');
    signal vga_y_index : unsigned(9 downto 0) := (others => '0');
    
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
    signal vga_x_t : unsigned(4 downto 0) := (others=>'0');
    signal vga_y_t : unsigned(3 downto 0) := (others=>'0');
    signal seg_count : unsigned(3 downto 0) := (others => '0');
    signal btn_pressed : std_logic := '0';
    
    signal debounced_btnu : std_logic := '0';
    signal debounced_btnr : std_logic := '0';
    signal debounced_btnd : std_logic := '0';
    signal debounced_btnl : std_logic := '0';
    
    signal btnu_enable : std_logic := '0';
    signal btnr_enable : std_logic := '0';
    signal btnd_enable : std_logic := '0';
    signal btnl_enable : std_logic := '0';
begin
    ------------------------------------------------------
    -- Debounce Buttons
    ------------------------------------------------------
    debounce_btn_u_ins : entity debounce_btn port map(
            btn_debounce_in => BTNU,
            btn_reset_in    => BTNC,
            clk_in          => CLK100MHZ,
            debounced_signal   => debounced_btnu
        );
    debounce_btn_r_ins : entity debounce_btn port map(
            btn_debounce_in => BTNR,
            btn_reset_in    => BTNC,
            clk_in          => CLK100MHZ,
            debounced_signal   => debounced_btnr
        );
        
    debounce_btn_d_ins : entity debounce_btn port map(
            btn_debounce_in => BTND,
            btn_reset_in    => BTNC,
            clk_in          => CLK100MHZ,
            debounced_signal   => debounced_btnd
        );  
        
    debounce_btn_l_ins : entity debounce_btn port map(
            btn_debounce_in => BTNL,
            btn_reset_in    => BTNC,
            clk_in          => CLK100MHZ,
            debounced_signal   => debounced_btnl
        );  

    ------------------------------------------------------
    -- Detect Button Press and Increment
    ------------------------------------------------------
    detect_btnu_pressed: process(CLK100MHZ)
        variable last_inc : std_logic := '0';
    begin
        if(rising_edge(CLK100MHZ)) then
            btnu_enable <= '0';
            if(last_inc = '0' and debounced_btnu = '1') then
                btnu_enable <= '1';
            end if;
            last_inc := debounced_btnu;
        end if;
    end process;
     
    detect_btnr_pressed: process(CLK100MHZ)
        variable last_inc : std_logic := '0';
    begin
        if(rising_edge(CLK100MHZ)) then
            btnr_enable <= '0';
            if(last_inc = '0' and debounced_btnr = '1') then
                btnr_enable <= '1';
            end if;
            last_inc := debounced_btnr;
        end if;
    end process;
    
    detect_btnd_pressed: process(CLK100MHZ)
        variable last_inc : std_logic := '0';
    begin
        if(rising_edge(CLK100MHZ)) then
            btnd_enable <= '0';
            if(last_inc = '0' and debounced_btnd = '1') then
                btnd_enable <= '1';
            end if;
            last_inc := debounced_btnd;
        end if;
    end process;
    
    detect_btnl_pressed: process(CLK100MHZ)
        variable last_inc : std_logic := '0';
    begin
        if(rising_edge(CLK100MHZ)) then
            btnl_enable <= '0';
            if(last_inc = '0' and debounced_btnl = '1') then
                btnl_enable <= '1';
            end if;
            last_inc := debounced_btnl;
        end if;
    end process;
    
                  
    set_seg_proc : process(CLK100MHZ)
    begin
        -- When BTNC is HIGH, set every characters to 0. Reset.
        if(rising_edge(CLK100MHZ)) then
            if(BTNC = '1') then
                vga_y_t <= (others=>'0');
                vga_x_t <= (others=>'0');
            else
                if(btnu_enable = '1') then

                    if(vga_y_t = b"0000") then -- if it was all 0 then make it 0xe
                        vga_y_t <= x"e";
                    else
                        vga_y_t <= vga_y_t - 1;
                    end if;
                end if;

                if(btnr_enable = '1') then
                    if(vga_x_t = b"10011") then -- if it was 0x13 set it 0
                        vga_x_t <= (others=>'0');
                    else
                        vga_x_t <= vga_x_t + 1;
                    end if;
                end if;
                
                if(btnd_enable = '1') then
                    if(vga_y_t = x"e") then -- if it was 0xe then set it all 0
                        vga_y_t <= (others=>'0');
                    else
                        vga_y_t <= vga_y_t + 1;
                    end if;
                end if;
                
                if(btnl_enable = '1') then
                    if(vga_x_t = b"00000") then
                        vga_x_t <= b"10011"; -- Set ut as 0x13
                    else
                        vga_x_t <= vga_x_t - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    char_0 <= std_logic_vector(vga_y_t);
    char_2 <= std_logic_vector(vga_x_t(3 downto 0)); -- truncate if it is greater than 0xf
    char_3 <= x"0" when(vga_x_t < b"10000") else x"1";
    
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
