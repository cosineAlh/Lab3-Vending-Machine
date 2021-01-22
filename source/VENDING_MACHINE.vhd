library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VENDING_MACHINE is
    Port (
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
end VENDING_MACHINE;

architecture Behavioral of VENDING_MACHINE is
    component FSM
        port(
            CLK: in std_logic;
            RST: in std_logic;
            Enable: in std_logic;
            
            sell_cmd: out std_logic;
            set_cmd: out std_logic;
            clear_cmd: out std_logic
        );
    end component;
    
    component Money_Deliver
        port(
            CLK: in std_logic;
            RST: in std_logic;
            sell_cmd: in std_logic;
            set_cmd: in std_logic;
            clear_cmd: in std_logic;
            one: in std_logic;
            fifty: in std_logic;
            ten: in std_logic;
            five: in std_logic;
            
            Money: out std_logic_vector(5 downto 0);
            Deliver: out std_logic
        );
    end component;
    
    component Switch
        port(
            CLK: in std_logic;
            OneDollar: in std_logic;
            FiftyCents: in std_logic;
            TenCents: in std_logic;
            FiveCents: in std_logic;
            
            one: out std_logic;
            fifty: out std_logic;
            ten: out std_logic;
            five: out std_logic
        );
    end component;
    
    signal one,five,ten,fifty:std_logic;
    signal sell_cmd,set_cmd,clear_cmd:std_logic;
begin
u1:FSM port map(
                CLK=>CLK,RST=>RST,Enable=>Enable,sell_cmd=>sell_cmd,
                set_cmd=>set_cmd,clear_cmd=>clear_cmd);
u2:Money_Deliver port map(
                        CLK=>CLK,RST=>RST,one=>one,fifty=>fifty,ten=>ten,five=>five,
                        Deliver=>Deliver,Money=>Money,sell_cmd=>sell_cmd,
                        set_cmd=>set_cmd,clear_cmd=>clear_cmd);
u3:Switch port map(
                   CLK=>CLK,OneDollar=>OneDollar,FiftyCents=>FiftyCents,TenCents=>TenCents,
                   FiveCents=>FiveCents,one=>one,fifty=>fifty,ten=>ten,five=>five);             

end Behavioral;
