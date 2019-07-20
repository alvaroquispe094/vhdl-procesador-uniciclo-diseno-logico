library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode is
	Port(
		clk: in std_logic;
		input: in std_logic_vector(7 downto 0);
		reg_we: out std_logic;
		out_we: out std_logic;
		reg_a_we: out std_logic;
		alu_op: out std_logic_vector(2 downto 0);
		bus_sel: out std_logic_vector(1 downto 0)
	);
end decode;

architecture Behavioral of decode is


	begin
		process(input)
		begin
			
			case input is
				when "00000001" => -- in x01
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "000";
					bus_sel<="10";
				when "00000010" => -- out x02 
					reg_we <= '0';  
					out_we <= '1';
					reg_a_we <='0';
					alu_op<= "000";
					bus_sel<="00";
				when "00000011" => --mov x03
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "000";
					bus_sel<="00";
				when "00000100" => --lda x04
					reg_we <= '0';  
					out_we <= '0';
					reg_a_we <='1';
					alu_op<= "000";
					bus_sel<="00";
				when "00000101" => --ldi x05
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='1';
					alu_op<= "000";
					bus_sel<="01";          
				when "00010000" => --add x10
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "010";
					bus_sel<="00";
				when "00010001" => --sub x11
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "011";
					bus_sel<="00";
				when "00100000" => --shl x20
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "001";
					bus_sel<="00";
				when "00100001" => --shr x21
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "111";
					bus_sel<="00";
				when "00010010" => --and x12
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "100";
					bus_sel<="00";
				when "00010011" => --or x13
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "101";
					bus_sel<="00";
				when "00010100" => -- xor x14
					reg_we <= '1';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "110";
					bus_sel<="00";						
				when others =>
					reg_we <= '0';  
					out_we <= '0';
					reg_a_we <='0';
					alu_op<= "000";
					bus_sel<="00";  	
			end case;
			
		end process;



end Behavioral;

