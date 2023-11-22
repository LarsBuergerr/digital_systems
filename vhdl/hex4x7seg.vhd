LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY hex4x7seg IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                       -- reset,           active RSTDEF
        clk:   IN  std_logic;                       -- clock,           rising edge
        data:  IN  std_logic_vector(15 DOWNTO 0);   -- data input,      active high
        dpin:  IN  std_logic_vector( 3 DOWNTO 0);   -- 4 decimal point, active high
        ena:   OUT std_logic_vector( 3 DOWNTO 0);   -- 4 digit enable  signals,                active high
        seg:   OUT std_logic_vector( 7 DOWNTO 1);   -- 7 connections to seven-segment display, active high
        dp:    OUT std_logic);                      -- decimal point output,                   active high
END hex4x7seg;

ARCHITECTURE struktur OF hex4x7seg IS

CONSTANT MAX: std_logic_vector := "11111111111111";

SIGNAL     cnt: std_logic_vector (0 TO 13);
SIGNAL cntMod4: std_logic_vector (0 TO 1);
SIGNAL  enMod4: std_logic;

SIGNAL           cc: std_logic_vector(0 TO 3);
SIGNAL selected_seg: std_logic_vector(3 DOWNTO 0);

BEGIN

   -- Modulo-2**14-Zaehler
   p1: PROCESS (rst, clk) IS
   BEGIN
      IF rst=RSTDEF THEN
         enMod4 <= '0';
         cnt <= (OTHERS => '0');
      ELSIF rising_edge(clk) THEN
         enMod4 <= '0';
         IF cnt= MAX THEN
            cnt <= (OTHERS => '0');
            enMod4 <= '1';
         ELSE
            cnt <= cnt + "1";
         END IF;
      END IF;
   END PROCESS;

   -- Modulo-4-Zaehler
   p2: PROCESS (rst, clk) IS
   BEGIN
      IF rst=RSTDEF THEN
         cntMod4 <= "00";
      ELSIF rising_edge(clk) THEN
         IF cntMod4="11" THEN
            IF enMod4='1' THEN
               cntMod4 <= "00";
            END IF;
         ELSE
            cntMod4 <= cntMod4 + enMod4;
         END IF;
      END IF;
   END PROCESS;

   -- 1-aus-4-Dekoder als Phasengenerator
   WITH cntMod4 SELECT
      cc <=    "0001" WHEN "00",
               "0010" WHEN "01",
               "0100" WHEN "10",
               "1000" WHEN "11",
               "1111" WHEN OTHERS;
      ena <= cc   WHEN rst/=RSTDEF
                  ELSE (OTHERS => '0');

   -- 1-aus-4-Multiplexer
   WITH cntMod4 SELECT
   selected_seg <=  data(3 DOWNTO 0) when "00",
                           data( 7 downto 4 ) when "01",
                           data(11 downto 8 ) when "10",
                           data(15 downto 12) when others;

   -- 7-aus-4-Dekoder
   WITH selected_seg SELECT
      seg <=   "0111111" WHEN "0000",
               "0000110" WHEN "0001",
               "1011011" WHEN "0010",
               "1001111" WHEN "0011",
               "1100110" WHEN "0100",
               "1101101" WHEN "0101",
               "1111101" WHEN "0110",
               "0000111" WHEN "0111",
               "1111111" WHEN "1000",
               "1101111" WHEN "1001",
               "1110111" WHEN "1010",
               "1111100" WHEN "1011",
               "0111001" WHEN "1100",
               "1011110" WHEN "1101",
               "1111001" WHEN "1110",
               "1110001" WHEN "1111",
               "0000000" WHEN OTHERS;

   -- 1-aus-4-Multiplexer
   WITH cntMod4 SELECT
         dp <=    dpin(0) WHEN "00",
                  dpin(1) WHEN "01",
                  dpin(2) WHEN "10",
                  dpin(3) WHEN OTHERS;


END struktur;