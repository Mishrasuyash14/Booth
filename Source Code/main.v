module int_div(dividend,divisor,quotient,remainder);
input [7:0]dividend ,divisor;
//output reg[11:0]ans ;
output reg[11:0]quotient;
output reg[7:0]remainder;
reg [7:0]x,y,A;
reg [11:0]Q;
integer n ;
always @(dividend,divisor,quotient,remainder)
begin 
//y=divisor;
//x=dividend;
A=0;Q=0;
if(dividend[7]==1'b1 && divisor[7]==1'b1)
begin
x = dividend +1;
y = divisor + 1;
for (n=0;n<=11;n=n+1)
begin
{A,x} = {A,x} << 1;
Q = Q << 1;
if (A>=y)
begin
A=A-y;
Q[0]=1;
end
if (n==7)
begin
remainder = A;
end
end
quotient = Q ;
end
else if(dividend[7]==1'b0 && divisor[7]==1'b0)
begin
y=divisor;
x=dividend;
for (n=0;n<=11;n=n+1)
begin
{A,x} = {A,x} << 1;
Q = Q << 1;
//ans = Q;
//ans = ans<<1;
if (A>=y)
begin
A=A-y;
Q[0]=1;
end
if (n==7)
begin
remainder = A;
end
end
quotient = Q;
end
///////
else
begin
//y=divisor;
//x=dividend;
if(dividend[7]==1'b1)
begin
y=divisor;
x= ~(dividend[6:0]) +1;
end
else
begin
y=~divisor[6:0] +1;
x=dividend;
end
for (n=0;n<=11;n=n+1)
begin
{A,x} = {A,x} << 1;
Q = Q << 1;
//ans = Q;
//ans = ans<<1;
if (A>=y)
begin
A=A-y;
Q[0]=1;
end
if (n==7)
begin
remainder = A;
end
end
if(Q[11]==1'b1)
quotient = ~Q+1 ;
else
quotient = Q ;
end
//{A,x} = {A,x} << 1;
//Q = Q << 1;
//ans = Q;
//ans = ans<<1;
//if (A>=y)
//begin
//A=A-y;
//Q=Q+1;
//end
//if (n==7)
//begin
//remainder = A;
//end
//end
//end
//quotient=Q;
//remainder=A;
end


endmodule

