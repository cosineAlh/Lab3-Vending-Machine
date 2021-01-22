library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Money_Deliver is
    Port (
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
end Money_Deliver;

architecture Behavioral of Money_Deliver is
    signal waiting_time: integer:=0;
    signal price_total: std_logic_vector(5 downto 0):="000000";
    signal price_one: std_logic_vector(5 downto 0):="000000";
    signal price_fifty: std_logic_vector(5 downto 0):="000000";
    signal price_ten: std_logic_vector(5 downto 0):="000000";
    signal price_five: std_logic_vector(5 downto 0):="000000";
    signal is_load1: std_logic:='0';
    signal is_load50: std_logic:='0';
    signal is_load10: std_logic:='0';
    signal is_load5: std_logic:='0';

begin
    process(CLK,RST,clear_cmd)
    begin
        if(RST='1'or clear_cmd='1')then
                Money<="000000";
                Deliver<='0';
                waiting_time<=0;
                price_one<=(others=>'0');
                price_fifty<=(others=>'0');
                price_ten<=(others=>'0');
                price_five<=(others=>'0');
                is_load1<='0';
                is_load50<='0';
                is_load10<='0';
                is_load5<='0';
        end if;
        
        if(rising_edge(CLK))then
            if(set_cmd='1')then
            -- one dollar: 010100; fifty cents: 001010; ten cents: 000010; five cents: 000001
                Deliver<='0';
                
                if(is_load1='0'and one='1')then
                    price_one<=price_one+"010100";
                    is_load1<='1';
                elsif(one='0')then
                    is_load1<='0';
                end if;  
                if(is_load50='0'and fifty='1')then
                    price_fifty<=price_fifty+"001010";
                    is_load50<='1';
                elsif(fifty='0')then
                    is_load50<='0';
                end if;
                if(is_load10='0'and ten='1')then
                    price_ten<=price_ten+"000010";
                    is_load10<='1';
                elsif(ten='0')then
                    is_load10<='0';
                end if;
                if(is_load5='0'and five='1')then
                    price_five<=price_five+"000001";
                    is_load5<='1';
                elsif(five='0')then
                    is_load5<='0';
                end if;
                
                if(price_one+price_fifty+price_ten+price_five="000000")then
                    price_total<="011001";--$1.25 = one dollar+2*ten cents+five cents
                else
                    price_total<=price_one+price_fifty+price_ten+price_five;
                end if;
                Money<=price_one+price_fifty+price_ten+price_five;
                
            elsif(sell_cmd='1')then
                if(is_load1='0'and one='1')then
                    price_one<=price_one+"010100";
                    is_load1<='1';
                elsif(one='0')then
                    is_load1<='0';
                end if;  
                if(is_load50='0'and fifty='1')then
                    price_fifty<=price_fifty+"001010";
                    is_load50<='1';
                elsif(fifty='0')then
                    is_load50<='0';
                end if;
                if(is_load10='0'and ten='1')then
                    price_ten<=price_ten+"000010";
                    is_load10<='1';
                elsif(ten='0')then
                    is_load10<='0';
                end if;
                if(is_load5='0'and five='1')then
                    price_five<=price_five+"000001";
                    is_load5<='1';
                elsif(five='0')then
                    is_load5<='0';
                end if;
                
                if(price_one+price_fifty+price_ten+price_five>=price_total)then
                    Money<=price_one+price_fifty+price_ten+price_five-price_total;
                    Deliver<='1';
                    waiting_time<=waiting_time+1;
                    if(waiting_time>50000000)then
                        waiting_time<=0;
                        price_one<=(others=>'0');
                        price_fifty<=(others=>'0');
                        price_ten<=(others=>'0');
                        price_five<=(others=>'0'); 
                        is_load1<='0';
                        is_load50<='0';
                        is_load10<='0';
                        is_load5<='0';
                    end if;
                else
                    Money<=price_one+price_fifty+price_ten+price_five;
                    Deliver<='0';
                end if;
            end if;
        end if;
    end process;
end Behavioral;