`timescale 1ns / 1ps

module bram_tb();
reg clk=0,reset,Rx_data;
wire is_received;
wire tx_out;
wire is_transmitted;   

// layer 1

wire done1,multiplied1;

// layer 2

wire multiplied2,done2;



wire  signed [7:0] A_data,outA, outB,INDEX_COUNTER;
wire [6:0]address_A, address_B,address_C;
wire signed [15:0] OUT1,outC;
wire signed [15:0]RELU_OUT;
wire writeC,writeA,writeD,D0_TRANSMIT;
wire [23:0] OUT2;
wire [7:0] Final_out;

bram_ uut(.Rx_data(Rx_data), .reset(reset), .is_received(is_received), .clk(clk),. done1(done1), .done2(done2), .multiplied1(multiplied1), 
.multiplied2(multiplied2), .tx_out(tx_out),.is_transmitted(is_transmitted)  , .writeA(writeA) ,.writeC(writeC), .A_data(A_data), .outA(outA) ,.outB(outB) , .address_A(address_A) , .address_B(address_B) , .address_C(address_C) 
, .OUT1(OUT1) ,.outC(outC), .RELU_OUT(RELU_OUT) , .OUT2(OUT2) , .writeD(writeD),.INDEX_COUNTER(INDEX_COUNTER) , .D0_TRANSMIT(D0_TRANSMIT)  
 , .Final_out(Final_out) );
 
always #1 clk=~clk; 


initial 
begin
reset=1;Rx_data=1;#40;
reset=0;

// image data 0 2 1

// 0
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 1
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 2
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 3
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 1
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

///// weights 1 

///row 1

// 0
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 1
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 2
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 3
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// -3
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;

Rx_data=1;#20; // stop bit


///row 2


// 0
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 4
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 5
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 6
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// -4
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;

Rx_data=1;#20; // stop bit

///row3


// 0
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 7
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// -8
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;

Rx_data=1;#20; // stop bit

// 9
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 2
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit


///row 4


// 0
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 10
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 11
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 12
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 3
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit


// padding

//0  1
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

//0  2
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

//0  3
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

//0  4
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit


//1  5
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit



// weights 2 


///row 1


// 0
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 1
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 2
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit




// 3
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// -3
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;

Rx_data=1;#20; // stop bit

// 4
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit


///row 2


// 0
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 4
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 5
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit




// 6
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// -4
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;

Rx_data=1;#20; // stop bit

// 5
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

///row 3


// 0
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 7
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// -8
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=1;#4;

Rx_data=1;#20; // stop bit




// 9
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 2
Rx_data=0;#4;  // start bit

Rx_data=0;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#20; // stop bit

// 3
Rx_data=0;#4;  // start bit

Rx_data=1;#4;
Rx_data=1;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;
Rx_data=0;#4;

Rx_data=1;#2000; // stop bit

$finish();
end
endmodule