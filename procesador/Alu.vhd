library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
	port(
		clk : std_logic;
		a: in std_logic_vector(7 downto 0);
		b: in std_logic_vector(7 downto 0);	
		op: in std_logic_vector(2 downto 0);
		s: out std_logic_vector(7 downto 0)
    );
end alu;

architecture Behavioral of alu is
	
	begin
		process(clk,a,b,op)
		begin
			case op is 
				when "000" => 
					s <= a;          
				when "001" => --shl--
					s(7 downto 1) <=  a(6 downto 0);
					s(0) <= '0';
				when "010" => --suma--
					s <= a + b;
				when "011" => --resta--
					s <= a - b;
				when "100" => --and--
					s <= a and b;          
				when "101" => --or--
					s <= a or b;
				when "110" => --xor--
					s <= a xor b;
				when "111" => --shr--
					s(6 downto 0) <= a(7 downto 1);	
					s(7) <= '0';
				when others =>
					s <= "01010101";    	
			end case;
			
		end process;

end Behavioral;

