library ieee;
use ieee.std_logic_1164.all;

entity forwarding_unit is
	port (
		if_id_register_rs: in std_logic_vector (4 downto 0);
		if_id_register_rt: in std_logic_vector (4 downto 0);
		ex_mem_register_rd: in std_logic_vector (4 downto 0);
		mem_wb_register_rd: in std_logic_vector (4 downto 0);
		ex_mem_reg_write: in std_logic;
		mem_wb_reg_write: in std_logic;
		forwarding_A : out std_logic_vector (1 downto 0);
		forwarding_B : out std_logic_vector (1 downto 0);
	);
end entity;

architecture b of forwarding_unit is
begin
	process	(if_id_register_rs, if_id_register_rt, ex_mem_register_rd, mem_wb_register_wb, ex_mem_regwrite, mem_wb_regwrite)
	begin  
		-- type 1a hazard
		if (ex_mem_reg_write = '1' AND (ex_mem_register_rd /= "00000") AND (ex_mem_register_rd = id_ex_register_rs)) then
			forward_A <= "10";
		-- type 2a hazard
		elsif (mem_wb_reg_write	= '1' AND (mem_wb_register_rd /= "00000") AND NOT(ex_mem_reg_write AND (ex_mem_register_rd /= "00000")) 
				AND (ex_mem_register_rd /= id_ex_register_rs) AND mem_wb_register_rd = id_ex_register_rs)) then 
			forward_A <= "01";
		else 
			forward_A <= "00";
		end if;
		-- type 1b hazard
		if (ex_mem_reg_write = '1' AND (ex_mem_register_rd /= "00000") AND (ex_mem_register_rd = id_ex_register_rt)) then
			forward_B <= "10";
		-- type 2b hazard
		elsif (mem_wb_reg_write	= '1' AND (mem_wb_register_rd /= "00000") AND NOT(ex_mem_reg_write AND (ex_mem_register_rd /= "00000")) 
				AND (ex_mem_register_rd /= id_ex_register_rt) AND mem_wb_register_rd = id_ex_register_rt)) then 
			forward_B <= "01"; 
		else 
			forward_B <= "00";
		end if;
	end process;
end architecture;