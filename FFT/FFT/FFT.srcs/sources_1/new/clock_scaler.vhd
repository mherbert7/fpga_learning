----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.06.2018 01:40:22
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

entity clock_scaler is
    Port ( scale_factor : in STD_LOGIC_VECTOR (31 downto 0);
           clk          : in STD_LOGIC;
           divided_clk  : out STD_LOGIC;
           rst          : in STD_LOGIC);
end clock_scaler;

architecture Behavioral of clock_scaler is
   
    signal clockCounter : std_logic_vector(31 downto 0) := x"00000000";
    signal outputClk    : std_logic                     := '0';
    
begin

    --Block equation
    --                         clk
    --  divided_clk =  -------------------
    --                 2(scale_factor + 1)

    divided_clk <= outputClk ;

    process(clk) begin
        if(rst = '1') then
            outputClk <= '0';
            clockCounter <= x"00000000";
        elsif(rising_edge(clk)) then
            if(clockCounter >= scale_factor) then
                outputClk <= not outputClk;
                clockCounter <= x"00000000";
            else
                clockCounter <= clockCounter + '1';
            end if;
        end if;
    end process;
    

end Behavioral;
