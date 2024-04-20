`timescale 1ns / 1ps

module RELU( ENABLE ,IN,OUT);
input ENABLE;
input [31:0] IN;
output  reg [31:0] OUT;

always@(posedge ENABLE)
begin
if (IN[31])
begin 
OUT<=0;
end

else
begin 
OUT<=IN;
end
end

endmodule


//////////////////////////////////////////////////////////////////////////////////
module bram_(
input Rx_data, reset, clk, 
output reg done1,done2, multiplied1, multiplied2,writeA,writeC,writeD,
output D0_TRANSMIT,
output tx_out,is_transmitted,is_received,
//output  signed [7:0] A_data,outA, outB,
//output reg [19:0]address_A, address_B, address_C,
//output reg signed [15:0] OUT1,
//output signed [15:0] outC,
//output signed [15:0]RELU_OUT,
//output reg signed [23:0] OUT2,
//output reg [7:0]INDEX_COUNTER ,
output [7:0] Final_out
    );
 parameter image_size=786;
 parameter Neuron_Layer1=512+1;
 parameter Neuron_Layer2=10;
 parameter total_size =(image_size*(1+Neuron_Layer1))+((Neuron_Layer1+1)*Neuron_Layer2);
   
 
wire signed [7:0] A_data,outA, outB;
wire signed [31:0] outC;
reg [19:0]address_A, address_B;
reg [9:0] address_C;
reg signed [31:0] OUT1; 
wire signed [31:0]RELU_OUT;
reg signed [40:0] OUT2;
reg [7:0]INDEX_COUNTER ;
//reg writeA;
//reg writeC;

reg row_change;
reg loop_B;


bram_1 l1 (
  .clka(clk),    // input wire clka
  .wea(writeA),      // input wire [0 : 0] wea
  .addra(address_A),  // input wire [5 : 0] addra
  .dina(A_data),    // input wire [7 : 0] dina
  .douta(outA),  // output wire [7 : 0] douta
  
  
  .clkb(clk),    // input wire clkb
  .web(0),      // input wire [0 : 0] web
  .addrb(address_B),  // input wire [5 : 0] addrb
  .dinb(),    // input wire [7 : 0] dinb
  .doutb(outB)  // output wire [7 : 0] doutb
);

bram_2 l2 (
  .clka(clk),    // input wire clka
  .wea(writeC),      // input wire [0 : 0] wea
  .addra(address_C),  // input wire [5 : 0] addra
  .dina(RELU_OUT),    // input wire [15 : 0] dina
  .douta(outC)  // output wire [15 : 0] douta
);

OUTPUT_PASS outpass(
.IN_DATA(OUT2),
.INDEX(INDEX_COUNTER),
.clk(clk),.reset(reset),.WRITEC(writeD),
.OUT_DATA(Final_out) ,
.D0_TRANSMIT(D0_TRANSMIT)
    );
    

receiver inst1(.clk(clk),.Rx_data(Rx_data),.reset(reset),.Data(A_data),.is_received(is_received));

RELU  Relu ( .ENABLE(writeC) ,.IN(OUT1) , . OUT(RELU_OUT) ) ;


always @(posedge clk or posedge reset) 
begin   ////////////////////////////////////////////////////////
if (reset)begin
address_A<=0;
address_B<=0;
address_C<=0;

writeA<=1; writeC<=0;writeD<=0;
done1<=0;
done2<=0;
row_change<=0;

multiplied1<=0;
multiplied2<=0;
OUT1<=0;
OUT2<=0;

loop_B<=0;

INDEX_COUNTER<=0;
end

//////writing
else if(writeA & is_received )begin
    address_A<=address_A+1;
    // for padding 0 in OUT  
    if(address_A==0) writeC<=1;
   
        else writeC<=0;
        
    if (address_A== total_size-1)begin
        writeA<=0;
        address_A<=1;
        address_B<= image_size+1;
    end
    else begin end 
    end
    
//////reading layer 1
else if (~writeA & ~done1) begin
    multiplied1<=1;
    OUT1<= OUT1+ (outA*outB);
    address_A<=address_A+1;
    address_B<=address_B+1;
    
        if(address_A==0) begin 
        address_C<=address_C+1;
        writeC<=1;
        end
        else begin
            
            writeC<=0;
        end
        
        if(address_A ==image_size-1 & address_B==(image_size*(1+Neuron_Layer1))-1) // all multiplications done 
        begin 
           address_A<=0;
           address_B<=image_size; 
        end
    
        else if(address_A==0 & address_B==image_size)
        begin
            address_B<=image_size*(1+Neuron_Layer1);
            writeA<=0;
            done1<=1;
            
        end
        
        else if(address_A==image_size-1)
        begin
        address_A<=0; row_change<=1;
        end
        
        else if(address_A==1 & row_change & address_B<(image_size*(1+Neuron_Layer1))) begin
        OUT1<=0; end
        
        else begin end
    end // end reading layer 1
    
else if (done1 & !done2) begin
    multiplied2<=1;
    address_C<=address_C+1;
    address_B<=address_B+1;
    OUT2<= OUT2 + (outB*outC);
      
    if (address_B==total_size)
    begin 
    done2<=1;
    address_B<=0;
    end 
    
    else if (address_C==Neuron_Layer1) begin 
    writeC<=0; 
    address_C<=0;
        if (!loop_B)
        begin 
        address_B<=image_size*(1+Neuron_Layer1); 
        loop_B<=1;
        end
        
    end
    
    else if (address_C==1)
    begin 
    OUT2<=0;
    INDEX_COUNTER<=INDEX_COUNTER+1;
    end 
    else begin end 
 
    if (address_C==0 & INDEX_COUNTER>0)
    begin 
    writeD<=1;
    end 
    else
     writeD<=0;begin
     end 
end 




else begin
writeD<=0; end 




end      /////////////////////////////////////////

Transmitter TI(
    .clk(clk),             // System clock
    .reset(reset),         // Reset signal (active low)
    .data_in(Final_out),   // Data to be transmitted
    .send_data(D0_TRANSMIT),
    .tx_out(tx_out),
    .is_transmitted(is_transmitted)   // UART transmit output
);
endmodule
