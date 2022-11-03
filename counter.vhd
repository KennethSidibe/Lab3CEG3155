library ieee;
use ieee.std_logic_1164.all;

entity counter is
    port (
        GClock : in std_logic;
        reset: in std_logic;

        counter : in std_logic_vector(3 downto 0);
        currentCounterValue : out std_logic_vector(3 downto 0) 
    );
end counter;

architecture rtl of counter is

    begin
         

end rtl;