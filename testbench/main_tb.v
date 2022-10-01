module test_div();
reg [7:0]dividend ,divisor;

wire [7:0]quotient ,remainder;
int_div dut(dividend,divisor,quotient,remainder);
initial
begin
 dividend = 8'b0000_1010 ; divisor = 8'b0101_0000;
#10 dividend = 8'b01111000 ; divisor = 8'b00100010;
#10 dividend = 8'b00011000 ; divisor = 8'b00000110;
#10 dividend = -8'd8 ; divisor = 8'b00000010;
#10 dividend = 8'd48 ; divisor = -8'd4;
#10 dividend = -8'd45 ; divisor = -8'd5;
#10 $stop;
end 
endmodule
