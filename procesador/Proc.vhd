library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity proc is
	Port ( 
		clk : in  std_logic;
		rst : in  std_logic;
		input : in  STD_LOGIC_VECTOR (7 downto 0);
		output : out  std_logic_vector (7 downto 0)
	);
end proc;

architecture Behavioral of proc is
	-- Declaración de los componentes utilziados--

	component regs is
		Port ( 
			clk : in  std_logic;
			rst : in  std_logic;
			we : in  std_logic;
			rd : in  std_logic_vector (3 downto 0);
			rs : in  std_logic_vector (3 downto 0);
			din : in  std_logic_vector (7 downto 0);
			dout : out  std_logic_vector (7 downto 0)
		);
	end component;

	component alu is port ( 
			   clk: std_logic;
			   a : in  std_logic_vector (7 downto 0);
			   b : in  std_logic_vector (7 downto 0);
			   op: in  std_logic_vector(2 downto 0);
			   s : out  std_logic_vector (7 downto 0));
	end component;
	
	component mux port ( 
			   a : in  std_logic_vector (7 downto 0);
			   b : in  std_logic_vector (7 downto 0);
			   c: in  std_logic_vector (7 downto 0);
			   sel: in  std_logic_vector (1 downto 0);
			   s : out  std_logic_vector (7 downto 0));
	end component;

	component rom_prog port (clk: in std_logic;
						addr : in  std_logic_vector (6 downto 0);
						data : out  std_logic_vector (15 downto 0));
	end component; 
	
	component registro port (din : in  std_logic_vector (7 downto 0);
						we :in std_logic;	
						dout : out  std_logic_vector (7 downto 0));
	end component; 


	component decode port (
						clk : in  std_logic;
						input : in  std_logic_vector (7 downto 0);
						reg_we : out  std_logic;
						out_we : out  std_logic;
						reg_a_we: out  std_logic;
						alu_op : out  std_logic_vector (2 downto 0);
						bus_sel : out  std_logic_vector (1 downto 0));
	end component; 


	
	
	signal rd, rs: std_logic_vector(3 downto 0);
	signal aux_dout,res_op: std_logic_vector(7 downto 0); 
	signal PC: std_logic_vector(6 downto 0):="UUUUUUU";
	signal IR: std_logic_vector(15 downto 0);
	
	
	-- señales del decodificador --
	signal aux_reg_we: std_logic;
	signal aux_out_we: std_logic;
	signal aux_reg_a_we: std_logic;
	signal aux_alu_op: std_logic_vector(2 downto 0);
	signal aux_bus_sel: std_logic_vector(1 downto 0);
	signal s_mux: std_logic_vector(7 downto 0); 
	signal s_regA: std_logic_vector(7 downto 0);
	
	begin

	-- ================--
	-- Instaciacion de componentes utilziados--


	-- La ROM de programa --
	eROM_Prog: rom_prog port map (clk => clk,addr => PC,data => IR);

	-- El decodificador de la instrucción --
	eDecode: decode port map (clk => clk,input => IR(15 downto 8),reg_we => aux_reg_we,out_we => aux_out_we, reg_a_we => aux_reg_a_we, alu_op => aux_alu_op, bus_sel => aux_bus_sel);
	
	-- La ALU --
	eAlu: alu port map (clk => clk, a => s_mux, b => s_regA, op => aux_alu_op, s => res_op);
	
	--Banco de registros --
	eRegs:  regs Port map (clk => clk, rst => rst, we => aux_reg_we, rd => rd, rs => rs ,din => res_op , dout => aux_dout );

	-- Mux --
	eMux: mux port map (a => aux_dout,b => IR(7 downto 0),c => input,sel => aux_bus_sel,s => s_mux);	
	
	eRegA: registro port map (din => s_mux, we => aux_reg_a_we, dout => s_regA);
		
	eRegOut:  registro port map (din => res_op,we => aux_out_we, dout =>output);
	-- ================--
	-- Descripción de mux que funciona como "bus"--
	-- controlado por bus_sel-- 

	-- ================--


	-- ================--
	-- Descripción de los almacenamientos--
	-- Los almacenamientos que se deben decribir aca son:--
	-- <reg_a> 8 bits--
	-- <reg_out> de 8 bits--
	-- <pc> de 8 bits--
	-- <ir> de 16 bits--

	rd <= IR(3 downto 0);
	rs <= IR(7 downto 4);
		process (clk, rst)
		
		begin
			if (rst='1') then 
				pc <= "UUUUUUU";
			elsif (rising_edge(clk)) then
				--pc<="1111111";
				if(pc="UUUUUUU") then
					pc<="0000000";
		        else
					pc <= pc + 1;
		        end if;   
				
			end if;
			  
		end process;
	


end Behavioral;

