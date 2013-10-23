library ieee;
use ieee.std_logic_1164.all;

entity forwarding_unit is
	port (
		id_ex_register_rs: in std_logic_vector (4 downto 0);
		id_ex_register_rt: in std_logic_vector (4 downto 0);
		ex_mem_register_rd: in std_logic_vector (4 downto 0);
		mem_wb_register_rd: in std_logic_vector (4 downto 0);
		ex_mem_reg_write: in std_logic;
		mem_wb_reg_write: in std_logic;
		forwarding_A : out std_logic_vector (1 downto 0);
		forwarding_B : out std_logic_vector (1 downto 0)
	);
end entity;

architecture b of forwarding_unit is
begin
	-- Input A (RT) hazards
	process	(id_ex_register_rs, ex_mem_register_rd, mem_wb_register_rd, ex_mem_reg_write, mem_wb_reg_write)
	begin  
		-- type 1a hazard
		if (ex_mem_reg_write = '1' AND ex_mem_register_rd /= "00000" AND ex_mem_register_rd = id_ex_register_rs) then
			forwarding_A <= "10";
		-- type 2a hazard
		elsif (mem_wb_reg_write	= '1' AND mem_wb_register_rd /= "00000" AND mem_wb_register_rd = id_ex_register_rs) then 
			forwarding_A <= "01";
		else 
			forwarding_A <= "00";
		end if;
	end process;
		
	-- Input B (RS) hazards
	process	(id_ex_register_rt, ex_mem_register_rd, mem_wb_register_rd, ex_mem_reg_write, mem_wb_reg_write)
	begin
		-- type 1b hazard
		if (ex_mem_reg_write = '1' AND ex_mem_register_rd /= "00000" AND ex_mem_register_rd = id_ex_register_rt) then
			forwarding_B <= "10";
		-- type 2b hazard
		elsif (mem_wb_reg_write	= '1' AND (mem_wb_register_rd /= "00000") AND (mem_wb_register_rd = id_ex_register_rt)) then 
			forwarding_B <= "01"; 
		else 
			forwarding_B <= "00";
		end if;		
	end process;
end architecture;
