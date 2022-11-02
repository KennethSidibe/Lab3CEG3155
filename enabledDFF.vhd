LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity enabledDFF is
	port(
	
		d : in std_logic;
		d_clock : in std_logic;
		en_d : in std_logic;
		
		outQ, outQBar : out std_logic

	);
end entity enabledDFF;

architecture rtl of enabledDFF is

	signal AND1toOR, AND2toOR, ORtoDFF, Q : std_logic;
	
	component or_gate
		port(

			x_or : in std_logic;
			y_or : in std_logic;

			z_or : out std_logic

		);
	end component or_gate;

	component and_gate
		port(

			x_and : in std_logic;
			y_and : in std_logic;

			z_and : out std_logic

		);
	end component and_gate;
	
	component d_ff
		port(

			i_d : in std_logic;
			i_clock : in std_logic;
			o_q, o_qBar : out std_logic

		);
	end component d_ff;
	
	
	begin
	
		and1 : entity work.and_gate(rtl)
					port map (d, en_d, AND1toOR);
					
		and2 : entity work.and_gate(rtl)
					port map (Q, not(en_d), AND2toOR);
					
		or1 : entity work.or_gate(rtl)
					port map (AND1toOR, AND2toOR, ORtoDFF);
					
		dflipflop : entity work.d_ff(rtl)
							port map (ORtoDFF, d_clock, Q, outQBar);
	
		outQ <= Q;
		
end architecture rtl;