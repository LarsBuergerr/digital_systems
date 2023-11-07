--
-- Synopsys
-- Vhdl wrapper for top level design, written on Tue Oct 31 10:43:21 2023
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_blink is
   port (
      rst : in std_logic;
      clk : in std_logic;
      led : out std_logic
   );
end wrapper_for_blink;

architecture verhalten of wrapper_for_blink is

component blink
 port (
   rst : in std_logic;
   clk : in std_logic;
   led : out std_logic
 );
end component;

signal tmp_rst : std_logic;
signal tmp_clk : std_logic;
signal tmp_led : std_logic;

begin

tmp_rst <= rst;

tmp_clk <= clk;

led <= tmp_led;



u1:   blink port map (
		rst => tmp_rst,
		clk => tmp_clk,
		led => tmp_led
       );
end verhalten;
