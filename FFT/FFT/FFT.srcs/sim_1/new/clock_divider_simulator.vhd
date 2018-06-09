----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.06.2018 13:11:30
-- Design Name: 
-- Module Name: clock_divider_simulator - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider_simulator is
--  Port ( );
end clock_divider_simulator;

architecture Behavioral of clock_divider_simulator is
    component clock_scaler port (
        scale_factor    : in STD_LOGIC_VECTOR (31 downto 0);
        clk             : in STD_LOGIC;
        divided_clk     : out STD_LOGIC;
        rst             : in STD_LOGIC
    );
    end component;
    
    signal divider      : std_logic_vector(31 downto 0) := x"00000031";
    signal clock        : std_logic                     := '0';
    signal dividedClock : std_logic                     := '0';
    signal reset        : std_logic                     := '0';
        
    
begin
    u1: clock_scaler port map (
        scale_factor    => divider,
        clk             => clock,
        divided_clk     => dividedClock,
        rst             => reset
    );
    
    process 
    begin
        for I in 0 to 10 loop
            wait for 5ns;
            clock <= not clock;
        end loop;
    end process;

end Behavioral;
