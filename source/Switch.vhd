library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Switch is
    Port (
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
end Switch;

architecture Behavioral of Switch is
    signal timer1:integer:=0;
    signal zero_timer1:integer:=0;
    signal timer50:integer:=0;
    signal zero_timer50:integer:=0;
    signal timer10:integer:=0;
    signal zero_timer10:integer:=0;
    signal timer5:integer:=0;
    signal zero_timer5:integer:=0;
    signal one_reg:std_logic:='0';
    signal fifty_reg:std_logic:='0';
    signal ten_reg:std_logic:='0';
    signal five_reg:std_logic:='0';

begin
process(CLK)
begin
    if(rising_edge(CLK))then
        if(OneDollar='1')then
            timer1<=timer1+1;
            if(timer1>1000)then
                timer1<=0;
                one_reg<='1';
            end if;
        elsif (OneDollar='0')then
            zero_timer1<=zero_timer1+1;
            if(zero_timer1>5000)then
                zero_timer1<=0;
                one_reg<='0';
            end if;
        end if;

        if(FiftyCents='1')then
            timer50<=timer50+1;
            if(timer50>1000)then
                fifty_reg<='1';
                timer50<=0;
            end if;
        elsif (FiftyCents='0')then
            zero_timer50<=zero_timer50+1;
            if(zero_timer50>5000)then
                zero_timer50<=0;
                Fifty_reg<='0';
            end if;
        end if;
        
        if(TenCents='1')then
            timer10<=timer10+1;
            if(timer10>1000)then
                timer10<=0;
                ten_reg<='1';
            end if;
        elsif (TenCents='0')then
            zero_timer10<=zero_timer10+1;
            if(zero_timer10>5000)then
                zero_timer10<=0;
                ten_reg<='0';
            end if;
        end if;
        
        if(FiveCents='1')then
            timer5<=timer5+1;
            if(timer5>1000)then
                timer5<=0;
                five_reg<='1';
            end if;
        elsif (FiveCents='0')then
            zero_timer5<=zero_timer5+1;
            if(zero_timer5>5000)then
                zero_timer5<=0;
                five_reg<='0';
            end if;
        end if;
    end if;
end process;
one<=one_reg;
fifty<=fifty_reg;
ten<=ten_reg;
five<=five_reg;

end Behavioral;
