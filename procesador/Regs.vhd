library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.ALL;
entity regs is
	Port ( 
		clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        we : in  STD_LOGIC;
        rd : in  STD_LOGIC_VECTOR (3 downto 0);
        rs : in  STD_LOGIC_VECTOR (3 downto 0);
        din : in  STD_LOGIC_VECTOR (7 downto 0);
        dout : out  STD_LOGIC_VECTOR (7 downto 0)
	);
end regs;

architecture Behavioral of regs is
	constant reg_tam : INTEGER := 16;
	--signal aux_reg: std_logic_vector(7 downto 0);
	type mem is array(reg_tam-1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal reg: mem:=("00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000",
					"00000000","00000000","00000000","00000000","00000000","00000000","11111111","00000001");
	--signal aux_rs : std_logic_vector(3 downto 0);
	
	begin 

	process (clk,rst)
	begin
		if (rst= '1') then
			for i in 0 to reg_tam-1 loop
				reg(i) <= (others => '0');
			end loop; 
		
		elsif (clk'event and clk = '0' ) then
			
			if (we = '1' ) then
				reg(conv_integer(rd)) <= din;
			
			end if;
			--aux_rs <= rs;
		--elsif(clk'event and clk = '0') then
			--din <= "UUUUUUUU";
		end if;
		
		--reg(to_integer(unsigned(rd))) <= din;
	end process; 
	
	--reg(conv_integer(unsigned(rd))) <= din when we='1';
		
	dout <= reg(conv_integer(rs)); 

end Behavioral;

