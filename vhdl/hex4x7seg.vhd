
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

CONSTANT N: natural := 2**14;
CONSTANT NMod4: natural := 4;

SIGNAL cnt: integer RANGE 0 TO N-1;
SIGNAL cntMod4: integer RANGE 0 TO NMod4-1;

SIGNAL enMod4: integer RANGE 0 TO 1;

BEGIN

   -- Modulo-2**14-Zaehler
   
   p1: PROCESS (rst, clk) IS
   BEGIN
      IF rst=RSTDEF THEN
         enMod4 <= 0;
         cnt <= 0;
      ELSIF rising_edge(clk) THEN
         enMod4 <= 0;
         IF cnt=N-1 THEN
            cnt <= 0;
            enMod4 <= 1;
         ELSE
            cnt <= cnt + 1;
         END IF;
      END IF;
   END PROCESS;

   -- Modulo-4-Zaehler

   p2: PROCESS (rst, clk) IS
   BEGIN
      IF rst=RSTDEF THEN
         cntMod4 <= 0;
      ELSIF rising_edge(clk) THEN
         IF enMod4=1 THEN
            IF cntMod4=NMod4-1 THEN
               cntMod4 <= 0;
            ELSE
               cntMod4 <= cntMod4 + 1;
            END IF;
         END IF;
      END IF;
   END PROCESS;

   -- 1-aus-4-Dekoder als Phasengenerator
    
   -- 1-aus-4-Multiplexer

   -- 7-aus-4-Dekoder

   -- 1-aus-4-Multiplexer

END struktur;