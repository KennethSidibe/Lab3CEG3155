LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity tFlipFlop is
	port(
	
		i_t : in std_logic;
		i_clock : in std_logic;
		o_q, o_qBar : out std_logic

	);
end entity tFlipFlop;

architecture rtl of tFlipFlop is

    component xor_gate is

        port (
            x_xor : in std_logic;
            y_xor : in std_logic;

            z_xor : out std_logic
        );

    end component xor_gate;

    component d_ff is
        
        port(

            i_d : in std_logic;
            i_clock : in std_logic;
            o_q, o_qBar : out std_logic

        );

    end component d_ff;

    signal q, qBar : std_logic;
    signal tXor : std_logic;

    begin 

        xorGate: xor_gate port map(

            x_xor => q,
            y_xor => i_t,
            z_xor => tXor
            
        );

        dFlipFlop: d_ff port map(

            i_d => tXor,
            i_clock => i_clock,
            o_q => q,
            o_qbar => qBar
            
        );

end rtl; 