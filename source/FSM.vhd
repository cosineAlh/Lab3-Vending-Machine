library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port (
        CLK: in std_logic;
        RST: in std_logic;
        Enable: in std_logic;
        sell_cmd: out std_logic;
        set_cmd: out std_logic;
        clear_cmd: out std_logic
        );
end FSM;

architecture Behavioral of FSM is
    type state_type is (sell,setting);
    signal state:state_type;
begin
process(CLK,RST)
begin
    if RST='1' then
        state<=setting;
        set_cmd<='1';
        sell_cmd<='0';
        clear_cmd<='1';
    elsif rising_edge(CLK) then
        case state is
            when setting=>
                if Enable='1' then
                    state<=sell;
                    set_cmd<='0';
                    sell_cmd<='1';
                    clear_cmd<='1';
                else 
                    state<=setting;
                    set_cmd<='1';
                    sell_cmd<='0';
                    clear_cmd<='0';
                end if;
            when sell=>
                state<=sell;
                set_cmd<='0';
                sell_cmd<='1';
                clear_cmd<='0';
            when others=>state<=sell;
       end case;
    end if;
end process;
end Behavioral; 