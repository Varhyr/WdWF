library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity tb_fifo is
end tb_fifo;

architecture Behavioral of tb_fifo is
    signal clk        : std_logic := '0';
    signal FIFO_clr_n : std_logic := '1';
    signal FIFO_rst_n : std_logic := '1';
    signal push       : std_logic := '0';
    signal pop        : std_logic := '0';
    signal data_in    : std_logic_vector(7 downto 0) := x"00";
    signal data_out   : std_logic_vector(7 downto 0) := x"00";

begin
    DUT: entity work.fifo port map (
        clk        ,
        FIFO_clr_n ,
        FIFO_rst_n ,
        push       ,
        pop        ,
        data_in    ,
        data_out   
    );


    classic_tb1: process
    begin
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        data_in <= x"01";
        push <= '1';
        clk <= '0'; wait for 10 ns;        
        clk <= '1'; wait for 10 ns;
        push <= '0';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        data_in <= x"02";
        push <= '1';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        push <= '0';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        data_in <= x"03";
        push <= '1';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        push <= '0';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        pop <= '1';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        pop <= '0';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        pop <= '1';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        pop <= '0';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        pop <= '1';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        pop <= '0';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;

    end process;
end Behavioral;