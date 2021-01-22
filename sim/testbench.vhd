library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    component vending_machine
        port(
            CLK: in std_logic;
            RST: in std_logic;
            Enable: in std_logic;
            OneDollar: in std_logic;
            FiftyCents: in std_logic;
            TenCents: in std_logic;
            FiveCents: in std_logic;
            Deliver: out std_logic;
            Money: out std_logic_vector(5 downto 0)
        );
    end component;
    
    signal CLK: std_logic;
    signal RST: std_logic;
    signal Enable: std_logic;
    signal OneDollar: std_logic;
    signal FiftyCents: std_logic;
    signal TenCents: std_logic;
    signal FiveCents: std_logic;
    signal Deliver: std_logic;
    signal Money: std_logic_vector(5 downto 0);

begin
uut:VENDING_MACHINE port map(
    CLK=>CLK,RST=>RST,Enable=>Enable,OneDollar=>OneDollar,FiftyCents=>FiftyCents,TenCents=>TenCents,
    FiveCents=>FiveCents,Deliver=>Deliver,Money=>Money);
    
process
begin
    CLK<='1';
    wait for 5ns;
    CLK<='0';
    wait for 5ns;
end process;

process
begin
    rst<='1';
    enable<='1';
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 10 us;
----------------
    rst<='0';
    enable<='0';
    onedollar<='1';
    fiftycents<='1';
    tencents<='1';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='1';
    fiftycents<='1';
    tencents<='1';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='1';
    fiftycents<='1';
    tencents<='1';
    fivecents<='0';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
----------------------
    wait for 75 us;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
-----------------------
    wait for 10 us;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
------------------------
    wait for 30 us;
    enable<='0';
    wait for 10 us;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='1';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='1';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='1';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
----------------------
    wait for 20 us;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='1';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='1';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='1';
    fivecents<='0';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
---------------------
    wait for 50 us;
    enable<='1';
    wait for 10 us;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
----------------------
    wait for 20 us;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='1';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='1';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='1';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
-----------------------
    wait for 60 us;
    enable<='0';
    wait for 10 us;
    ----
    onedollar<='0';
    fiftycents<='1';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='0';
    fiftycents<='1';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='0';
    fiftycents<='1';
    tencents<='0';
    fivecents<='0';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
---------------------
    wait for 5 us;
    enable<='1';
    wait for 5 us;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 20 ns;
    ----
    onedollar<='1';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 15 us;
    onedollar<='0';
    fiftycents<='0';
    tencents<='0';
    fivecents<='0';
    wait for 1000 us;
end process;
end Behavioral;
