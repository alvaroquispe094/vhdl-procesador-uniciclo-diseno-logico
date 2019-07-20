library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use ieee.std_logic_unsigned.ALL;
entity rom_prog is
	Port(
		clk: in std_logic;
		addr: in std_logic_vector(6 downto 0);
		data: out std_logic_vector(15 downto 0)
	);
end rom_prog;

architecture Behavioral of rom_prog is
	type mem is array(127 downto 0) of std_logic_vector( 15 downto 0);
	constant rom: mem:= ( 
		"0000001000100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000000100100001","0000001000100001", "0000001100100001", "0000010000100001", "0000010100100001", "0000101000100001", "0000101100100001", "0001010000100001",
		"0000001000000000","0000001001000100", "0001000000110100", "0000010000110001", "0000001000110000", "0000000100000011", "0000001000010000", "0000001000000000"
   );
	
	begin
		process(addr)
		begin
			if(addr = "UUUUUUU") then
				data<="UUUUUUUUUUUUUUUU";
			else	
			data <= rom(conv_integer(addr));
			end if;
		end process;

end Behavioral;

