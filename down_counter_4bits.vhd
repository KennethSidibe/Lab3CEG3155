LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity down_counter_4bits is
	port(
	
		input : in std_logic_vector(3 downto 0);
		enable : in std_logic;
		clock : in std_logic;
		resetBar : in std_logic;
		
		finish : out std_logic
	);
end entity down_counter_4bits;

architecture rtl of down_counter_4bits is

	signal Dff3, Dff2, Dff1, Dff0, y3, y2, y1, y0, Din3, Din2, Din1, Din0 : std_logic;
	
	component enabledDFF is
		port(
	
			d : in std_logic;
			d_clock : in std_logic;
			en_d : in std_logic;
			
			outQ, outQBar : out std_logic

		);
	end component enabledDFF;
	
	
	begin
		
		Dff3 <= y3 and (y2 or y1 or y0);
		Dff2 <= (y2 and (y0 or y1)) or (not(y0) and not(y1) and not(y2));
		Dff1 <= y0 xor not(y1);
		Dff0 <= not(y0);
		
		Din0 <= (Dff0 and input(0)) or (not(resetBar) and input(0)) or (Dff0 and resetBar);
		Din1 <= (Dff1 and input(1)) or (not(resetBar) and input(1)) or (Dff1 and resetBar);
		Din2 <= (Dff2 and input(2)) or (not(resetBar) and input(2)) or (Dff2 and resetBar);
		Din3 <= (Dff3 and input(3)) or (not(resetBar) and input(3)) or (Dff3 and resetBar);
		
		d0 : entity work.enabledDFF(rtl)
				port map(Din0, clock, enable, y0);
				
		d1 : entity work.enabledDFF(rtl)
				port map(Din1, clock, enable, y1);
				
		d2 : entity work.enabledDFF(rtl)
				port map(Din2, clock, enable, y2);
				
		d3 : entity work.enabledDFF(rtl)
				port map(Din3, clock, enable, y3);
		
		finish <= not(y0) and not(y1) and not(y2) and not(y3);
		
	
end architecture rtl;