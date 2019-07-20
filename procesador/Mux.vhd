library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0));
end mux;

architecture Behavioral of mux is

	begin
		process (sel, a, b,c)
		begin
			if sel = "00" then 
				s <= a;
			elsif sel = "01" then 
				s <= b;
			elsif sel = "10" then 
				s <= c;	
			else 
				s <= "XXXXXXXX";
			end if;   
   end process;    

end Behavioral;

