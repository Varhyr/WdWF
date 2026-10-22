library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity tb_fifo is
end tb_fifo;

architecture Behavioral tb of tb_fifo is
    signal clk        : std_logic := '0';
    signal FIFO_clr_n : std_logic := '1';
    signal FIFO_rst_n : std_logic := '1';
    signal push       : std_logic := '0';
    signal pop        : std_logic := '0';
    signal data_in    : std_logic_vector(7 downto 0) := x"00";
    signal data_out   : std_logic_vector(7 downto 0) := x"00";