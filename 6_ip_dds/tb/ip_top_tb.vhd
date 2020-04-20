----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2020 06:25:21 PM
-- Design Name: 
-- Module Name: ip_top_tb - Behavioral
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

entity ip_top_tb is
--  Port ( );
end ip_top_tb;

architecture Behavioral of ip_top_tb is
	signal CLK100MHZ : std_logic;
    signal BTNC      : std_logic;
    signal AUD_PWM   : std_logic;
    signal AUD_SD    : std_logic;
    signal SW        : std_logic_vector(15 downto 0);
begin
	--100MHz clock
	process
	begin
		CLK100MHZ <= '0';
		wait for 5 ns;
		CLK100MHZ <= '1';
		wait for 5 ns;
	end process;
	
	SW(2 downto 0) <= b"001";
	SW(5 downto 3) <= b"000";
	DUT: entity ip_top
	   port map(
	               CLK100MHZ => CLK100MHZ,
	               SW        => SW,
	               BTNC      => BTNC,
	               AUD_PWM   => AUD_PWM,
	               AUD_SD    => AUD_SD
	           );

end Behavioral;
