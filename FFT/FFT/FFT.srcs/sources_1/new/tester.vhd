----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.06.2018 01:57:53
-- Design Name: 
-- Module Name: tester - Behavioral
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

entity tester is
      Port ( 
             CLK100MHZ : in STD_LOGIC;
             ja : out std_logic_vector (7 downto 0);
             btn : in std_logic_vector (3 downto 0);
             led : out std_logic_vector (3 downto 0);
             sw : in std_logic_vector (3 downto 0)
            );
end tester;

architecture Behavioral of tester is
    component clock_scaler port (
        scale_factor    : in STD_LOGIC_VECTOR (31 downto 0);
        clk             : in STD_LOGIC;
        divided_clk     : out STD_LOGIC
    );
    end component;
    
    signal divider      : std_logic_vector(31 downto 0) := x"00000031";
    signal default_ja   : std_logic_vector(7 downto 1)  := "1111111";
    --signal reset        : std_logic                     := '0';

begin
    
    led <= btn;
    
    ja(7 downto 1) <= default_ja;
    
    divider(7 downto 0) <= sw & btn;
    
    u1: clock_scaler port map (
        scale_factor    => divider,
        clk             => CLK100MHZ,
        divided_clk     => ja(0)
    );

end Behavioral;
