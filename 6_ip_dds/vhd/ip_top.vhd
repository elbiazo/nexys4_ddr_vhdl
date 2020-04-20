----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2020 01:20:06 AM
-- Design Name: 
-- Module Name: ip_top - Behavioral
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

entity ip_top is
  Port (
            CLK100MHZ : IN STD_LOGIC;
            SW        : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            
            -- Button used for reset
            BTNC      : IN STD_LOGIC;
            
            -- Audio
            AUD_PWM   : OUT STD_LOGIC;
            AUD_SD    : OUT STD_LOGIC;
            
            -- Set7 Display Signals
            SEG7_CATH : out STD_LOGIC_VECTOR (7 downto 0);
            AN : out STD_LOGIC_VECTOR (7 downto 0)
        );
end ip_top;

architecture Behavioral of ip_top is
    component sine_lut_dds port(
        aclk : in std_logic;
        s_axis_phase_tvalid : in std_logic;
        s_axis_phase_tdata  : in std_logic_vector(7 downto 0);
        m_axis_data_tvalid : out std_logic;
        m_axis_data_tdata  : out std_logic_vector(15 downto 0)
    );
    end component;
    
    signal phase : std_logic_vector(7 downto 0) := (others=>'0');
    signal sin_out : std_logic_vector(15 downto 0) := (others=>'0');
    signal sample_rate : std_logic := '0';
    signal m_axis_data_tvalid : std_logic := '0';
    signal pwm_out : std_logic := '0';
    signal duty_cycle : std_logic_vector(9 downto 0) := (others=>'0');
    signal sin_shifted : std_logic_vector(15 downto 0);
    signal inverted_sin_out : std_logic_vector(15 downto 0);
    
    -- Signals for 7 segment display
    signal char_7 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_6 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_5 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_4 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_3 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_2 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_1 : std_logic_vector(3 downto 0) := (others => '0');
    signal char_0 : std_logic_vector(3 downto 0) := (others => '0');
    
begin
    -- Audio will be turned off when SW(15) is high
    AUD_SD <= '1' when sw(15) = '1' else '0';

    -- Generates correct sample rate enable that gets used in phase_accum
    sample_rate_gen_ins : entity sample_rate_gen
        port map(
                    clk_100mhz  => CLK100MHZ,
                    reset       => BTNC,
                    sw          => SW(2 downto 0),
                    sample_rate => sample_rate
                );
    
    -- Increments phase when ever sample rate counter reaches maximum sample rate           
    phase_accum_ins : entity phase_accum
        port map(
                    sample_rate => sample_rate,
                    clk_100mhz  => CLK100MHZ,
                    reset       => BTNC,
                    phase       => phase   
                );

    -- Use DDS IP to generate sine signal
    dds_ins : sine_lut_dds port map(aclk => CLK100MHZ, s_axis_phase_tvalid => '1', s_axis_phase_tdata => phase, m_axis_data_tvalid => m_axis_data_tvalid, m_axis_data_tdata => sin_out);
    
    -- Invert the MSB of sine signal
    inverted_sin_out <= (not sin_out(15)) & sin_out(14 downto 0); 
    
    -- Shift the Volumn depending on the switch setting
    vol_shifter_ins : entity volume_shifter
        port map(
                    sw => SW(5 downto 3),
                    sin_out => inverted_sin_out,
                    sin_shifted => sin_shifted
                );
                
    -- Get the first 10 bit of volumn shifted sine signal.
    duty_cycle <= sin_shifted(15 downto 6);
    
    -- Generates PWM with sine signal
    pwm_gen_ins : entity pwm_gen
        port map(
                    clk => CLK100MHZ,
                    reset => BTNC,
                    duty_cycle => duty_cycle,
                    pwm_out => pwm_out
                );
                
    -- Outputs PWM sine signal.
    AUD_PWM <= pwm_out;
    
    -- Displays volumn percent in decimal.
    vol_disp_func : process(CLK100MHZ, BTNC)
    begin
        if(BTNC = '1') then
            char_7 <= (others=>'0');
            char_6 <= (others=>'0');
            char_5 <= (others=>'0');
            char_4 <= (others=>'0');
        elsif(rising_edge(CLK100MHZ)) then
            if(SW(5 downto 3) = "111") then
                char_7 <= (others=>'0');
                char_6 <= x"1";
                char_5 <= (others=>'0');
                char_4 <= (others=>'0');
            elsif(SW(5 downto 3) = "110") then
                char_7 <= (others=>'0');
                char_6 <= (others=>'0');
                char_5 <= x"7";
                char_4 <= x"5";
            elsif(SW(5 downto 3) = "101") then
                char_7 <= (others=>'0');
                char_6 <= (others=>'0');
                char_5 <= x"6";
                char_4 <= x"3";
            elsif(SW(5 downto 3) = "100") then
                char_7 <= (others=>'0');
                char_6 <= (others=>'0');
                char_5 <= x"5";
                char_4 <= (others=>'0');            
            elsif(SW(5 downto 3) = "011") then
                char_7 <= (others=>'0');
                char_6 <= (others=>'0');
                char_5 <= x"3";
                char_4 <= x"8";
            elsif(SW(5 downto 3) = "010") then
                char_7 <= (others=>'0');
                char_6 <= (others=>'0');
                char_5 <= x"2";
                char_4 <= x"5";
            elsif(SW(5 downto 3) = "001") then
                char_7 <= (others=>'0');
                char_6 <= (others=>'0');
                char_5 <= x"1";
                char_4 <= x"3";
            else
                char_7 <= (others=>'0');
                char_6 <= (others=>'0');
                char_5 <= (others=>'0');
                char_4 <= (others=>'0');
            end if;
        end if;
    end process vol_disp_func;
    
    -- Displays correct frequency in decimal
    freq_dis_proc : process(CLK100MHZ, BTNC)
    begin
        if(BTNC = '1') then
            char_3 <= (others=>'0');
            char_2 <= (others=>'0');
            char_1 <= (others=>'0');
            char_0 <= (others=>'0');
        elsif(rising_edge(CLK100MHZ)) then
            if(SW(2 downto 0) = "111") then
                char_3 <= x"3";
                char_2 <= x"5";
                char_1 <= (others=>'0');
                char_0 <= (others=>'0');
            elsif(SW(2 downto 0) = "110") then
                char_3 <= x"3";
                char_2 <= (others=>'0');
                char_1 <= (others=>'0');
                char_0 <= (others=>'0');
            elsif(SW(2 downto 0) = "101") then
                char_3 <= x"2";
                char_2 <= x"5";
                char_1 <= (others=>'0');
                char_0 <= (others=>'0');
            elsif(SW(2 downto 0) = "100") then
                char_3 <= x"2";
                char_2 <= (others=>'0');
                char_1 <= (others=>'0');
                char_0 <= (others=>'0');            
            elsif(SW(2 downto 0) = "011") then
                char_3 <= x"1";
                char_2 <= x"5";
                char_1 <= (others=>'0');
                char_0 <= (others=>'0');
            elsif(SW(2 downto 0) = "010") then
                char_3 <= x"1";
                char_2 <= (others=>'0');
                char_1 <= (others=>'0');
                char_0 <= (others=>'0');
            elsif(SW(2 downto 0) = "001") then
                char_3 <= (others=>'0');
                char_2 <= x"5";
                char_1 <= (others=>'0');
                char_0 <= (others=>'0');
            else
                char_3 <= (others=>'0');
                char_2 <= (others=>'0');
                char_1 <= (others=>'0');
                char_0 <= (others=>'0');
            end if;
        end if;
    end process freq_dis_proc;
    
    -- Component that drives 7 segment display.
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
