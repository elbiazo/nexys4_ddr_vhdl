----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2020 04:03:41 PM
-- Design Name: 
-- Module Name: accel_spi_rw - Behavioral
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

entity accel_spi_rw is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           DATA_X : out STD_LOGIC_VECTOR(7 downto 0);
           DATA_Y : out STD_LOGIC_VECTOR(7 downto 0);
           DATA_Z : out STD_LOGIC_VECTOR(7 downto 0);
           ID_AD : out STD_LOGIC_VECTOR(7 downto 0);
           ID_1D : out STD_LOGIC_VECTOR(7 downto 0);
           CSb : out STD_LOGIC;
           MOSI : out STD_LOGIC;
           SCLK : out STD_LOGIC;
           MISO : in STD_LOGIC);
end accel_spi_rw;

architecture Behavioral of accel_spi_rw is
    type cmd_state_type is (idle, w_pow_ctl_on, done_pow_ctl_on, r_id_ad, done_id_ad, r_id_1d, done_id_1d, r_x, done_x, r_y, done_y, r_z, done_z);
    signal cmd_state : cmd_state_type := idle;
    signal spi_start : STD_LOGIC := '0';
    signal to_spi_bytes : std_logic_vector(23 downto 0) := (others=>'0');
    signal spi_done : std_logic := '0';
    
    -- Signal for SPI FSM
    type spi_state_type is (idle, set_cs_low, sclk_hi, sclk_lo, wait_100ms, set_cs_hi, chk_sclk_cntr, inc_sclk_cntr);
    signal spi_state : spi_state_type := idle;

    signal sclk_cntr : integer := 0;
    
    signal timer_done : std_logic := '0';
    signal timer_start : std_logic := '0';
    signal timer_max : integer := 0;
    signal timer_cntr : integer := 0;

    signal mosi_bytes : unsigned(23 downto 0) := (others=>'0');
    signal miso_data : unsigned(23 downto 0) := (others=>'0');
begin
    cmd_fsm : process(clk, reset)
    begin
        if(reset = '1') then
            cmd_state <= idle;
        elsif(rising_edge(clk)) then
            case cmd_state is
                when idle =>
                    cmd_state <= w_pow_ctl_on;
                -- Write to Accel to power on and start reading
                when w_pow_ctl_on =>
                    if(spi_done = '1') then
                        cmd_state <= done_pow_ctl_on;
                    end if;
                when done_pow_ctl_on =>
                    cmd_state <= r_id_ad;
                when r_id_ad =>
                    if(spi_done = '1') then
                        cmd_state <= done_id_ad;
                    end if;
                when done_id_ad =>
                    cmd_state <= r_id_1d;
                when r_id_1d =>
                    if(spi_done = '1') then
                        cmd_state <= done_id_1d;
                    end if;
                when done_id_1d =>
                    cmd_state <= r_x;
                when r_x =>
                    if(spi_done = '1') then
                        cmd_state <= done_x;
                    end if;
                when done_x =>
                    cmd_state <= r_y;
                when r_y =>
                    if(spi_done = '1') then
                        cmd_state <= done_y;
                    end if;
                when done_y =>
                    cmd_state <= r_z;
                when r_z =>
                    if(spi_done = '1') then
                        cmd_state <= done_z;
                    end if;
                when done_z =>
                    cmd_state <= r_id_ad;
                when others =>
                    cmd_state <= idle;
            end case;
        end if;
    end process cmd_fsm;
    spi_start <= '1' when (cmd_state = idle) or (cmd_state = done_pow_ctl_on) or (cmd_state = done_id_ad) or 
                    (cmd_state = done_id_1d) or (cmd_state = done_x) or (cmd_state = done_y) or (cmd_state = done_z) else '0';
    to_spi_bytes <= x"0A2D02" when cmd_state = idle else
                    x"0B0000" when (cmd_state = done_pow_ctl_on) or (cmd_state = done_z) else
                    x"0B0100" when cmd_state = done_id_ad else
                    x"0B0800" when cmd_state = done_id_1d else
                    x"0B0900" when cmd_state = done_x else
                    x"0B0A00" when cmd_state = done_y else
                    x"000000";


    spi_fsm : process(clk, reset)
    begin
        if(reset = '1') then
            spi_state <= idle;
        elsif(rising_edge(clk)) then
            case spi_state is
                when idle =>
                    if(spi_start = '1') then
                        spi_state <= set_cs_low;
                    end if;
                when set_cs_low =>
                    if(timer_done = '1') then
                        spi_state <= sclk_hi;
                    end if;
                when sclk_hi =>
                    if(timer_done = '1') then
                        spi_state <= sclk_lo;
                    end if;
                when sclk_lo =>
                    if(timer_done = '1') then
                        spi_state <= inc_sclk_cntr;
                    end if;
                when inc_sclk_cntr =>
                    spi_state <= chk_sclk_cntr;
                when chk_sclk_cntr =>
                    if(sclk_cntr = 24) then
                        spi_state <= set_cs_hi;
                    else
                        spi_state <= sclk_hi;
                    end if;
                when set_cs_hi =>
                    spi_state <= wait_100ms;
                when wait_100ms =>
                    if(timer_done = '1') then
                        spi_state <= idle;
                    end if;
            end case;
        end if;
    end process spi_fsm;
    CSb <= '1' when spi_state = idle or spi_state = wait_100ms else '0';
    timer_start <= '1' when (spi_state = set_cs_low) or (spi_state = sclk_hi) or (spi_state = sclk_lo) or (spi_state = wait_100ms) else '0';
    timer_max <= 19 when spi_state = set_cs_low else
                 49 when spi_state = sclk_hi or spi_state = sclk_lo else
                 100000 when spi_state = wait_100ms else 0;
    SCLK <= '1' when spi_state = sclk_hi else '0';
    spi_done <= '1' when (spi_state = wait_100ms) and (timer_done = '1') else '0';
    
    sclk_counter_proc : process(clk,reset)
    begin
        if(rising_edge(clk)) then
            if(spi_state = wait_100ms) then
                sclk_cntr <= 0;
            elsif(spi_state = inc_sclk_cntr) then
                sclk_cntr <= sclk_cntr + 1;
            end if;
        end if;
    end process sclk_counter_proc;

    fsm_timer : process(clk, reset)
    begin
        if(reset = '1') then
            timer_cntr <= 0;
        elsif(rising_edge(clk)) then
            if(timer_start = '1') then
                if(timer_cntr < timer_max) then
                    timer_cntr <= timer_cntr + 1;
                else
                    timer_cntr <= 0;
                end if;
            end if;
        end if;
    end process fsm_timer;

    timer_done <= '1' when timer_cntr = timer_max else '0';

    p2s_proc : process(clk, reset)
    begin
        if(rising_edge(clk)) then
            if(spi_start = '1') then
                mosi_bytes <= unsigned(to_spi_bytes);
            elsif(spi_state = sclk_hi and timer_done = '1') then
                MOSI <= std_logic(mosi_bytes(23));
                mosi_bytes <= shift_left(mosi_bytes, 1);
            end if;
        end if;
    end process p2s_proc;

    s2p_proc : process(clk, reset)
    begin
        if(rising_edge(clk)) then
            if(spi_state = sclk_lo) then
                miso_data(0) <= MISO;
            elsif(spi_state = chk_sclk_cntr and sclk_cntr < 24) then
                miso_data <= shift_left(miso_data, 1);
            elsif(spi_state = set_cs_hi) then
                case cmd_state is
                    when r_id_ad =>
                        ID_AD <= std_logic_vector(miso_data(7 downto 0));
                    when r_id_1d =>
                        ID_1D <= std_logic_vector(miso_data(7 downto 0));
                    when r_x =>
                        DATA_X <= std_logic_vector(miso_data(7 downto 0));
                    when r_y =>
                        DATA_Y <= std_logic_vector(miso_data(7 downto 0));
                    when r_z =>
                        DATA_Z <= std_logic_vector(miso_data(7 downto 0));
                    when others =>
                        ID_AD <= (others=>'0');
                        ID_1D <= (others=>'0');
                        DATA_X <= (others=>'0');
                        DATA_Y <= (others=>'0');
                        DATA_Z <= (others=>'0');
                end case;
            end if;
        end if;
    end process s2p_proc;
end Behavioral;
