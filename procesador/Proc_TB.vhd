LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Procesador_TB IS
END Procesador_TB;
 
ARCHITECTURE behavior OF Procesador_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT proc
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         input : IN  std_logic_vector(7 downto 0);
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal input : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: proc PORT MAP (
          clk => clk,
          rst => rst,
          input => input,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      --wait for clk_period*10;

      -- insert stimulus here 

		
		rst <= '0';
		input <="11111111";
		--clk <= '0';
		wait for 5 ns;
		
		
		rst <= '0';
		input <="10000000";
		--clk <= '1';
		wait for 5 ns;
		
		
		rst <= '0';
		input <="10101010";
		--clk <= '0';
		wait for 5 ns;
		
		
		rst <= '0';
		input <="11110000";
		--clk <= '1';
		wait for 5 ns;
		
		
		
		
		rst <= '0';
		input <="11111100";
		--clk <= '0';
		wait for 5 ns;
		
		
		rst <= '0';
		input <="00000110";
		--clk <= '1';
		wait for 5 ns;
		
		
		rst <= '0';
		input <="10000001";
		--clk <= '0';
		wait for 5 ns;
		
		
		rst <= '0';
		input <="00001111";
		--clk <= '1';
		wait for 5 ns;
		
		
		rst <= '0';
		input <="10010001";
		--clk <= '0';
		wait for 5 ns;
		
		--lda
		rst <= '0';
		input <="01001111";
		--clk <= '1';
		wait for 5 ns;
		
		rst <= '0';
		input <="11010001";
		--clk <= '0';
		wait for 5 ns;
		
		
		rst <= '0';
		input <="01001101";
		--clk <= '1';
		wait for 5 ns;
		
		
		
		rst <= '0';
		input <="00110111";
		--clk <= '0';
		wait for 5 ns;
		
		rst <= '0';
		input <="01001111";
		--clk <= '1';
		wait for 5 ns;
		
		
		
		
		rst <= '1';
		input <="00110111";
		--clk <= '0';
		wait for 5 ns;
		
		
		
		rst <= '0';
		input <="11001101";
		--clk <= '1';
		wait for 5 ns;
		
		
		
		rst <= '0';
		input <="10110111";
		--clk <= '0';
		wait for 5 ns;
		
		
		
		
		
      wait;
   end process;

END;
