`timescale 1ns / 1ps



module OUTPUT_PASS(
input signed [40:0] IN_DATA,
input [7:0] INDEX,
input clk,reset,WRITEC,
output reg [7:0] OUT_DATA ,
output reg D0_TRANSMIT
    );
parameter size=10;  
reg signed [40:0] max;
reg [7:0] temp_index;
reg flag;
always@(posedge clk) 
begin

if (reset)
begin 
max<=-1600000;
temp_index<=0;
OUT_DATA<=0;
flag<=0;
D0_TRANSMIT<=0;
end
else 
begin
  
    if (INDEX<=size & !flag & WRITEC)
    begin 
        if (IN_DATA>max)begin
        max<=IN_DATA;
        temp_index<=INDEX;end
        else begin end
        if (INDEX==size)begin
        flag<=1;
        end
    end
    else if (flag)
    begin
    OUT_DATA<=temp_index-1;
    D0_TRANSMIT<=1;
    end
    else begin end
end

end
endmodule
