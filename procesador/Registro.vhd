library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
    Port ( din : in  STD_LOGIC_VECTOR (7 downto 0);
           we : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (7 downto 0));
end registro;

architecture Behavioral of registro is
	
	begin
		process(din,we)
			begin
				if(we = '1') then
					dout <= din;
				end if;
		end process;

end Behavioral;

