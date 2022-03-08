// defining module
// ===============
module module_name(param1, param2, param3, param4); endmodule

// declaration
// ===========
parameter CYCLE = 20;

input param1, param2;
output param3, param4;

wire param1; // all input ports are wires
reg clk;
logic logic1;

bit b;
bit [31:0] b32;

byte b8;
shortint s;
int i;
int unsigned ui;
loginint l;

integer i4;
time t;
real r;


// declaring modules
// ================= 
not n1(out, in);
my_module m1(out1, out2, in1, in2, in3);

// arrays declaration
// ==================
int lo_hi[0:15]; // array of size 16
int c_style[16];
int a[0:7][0:3]; // 8x4 array
int a[8][4];
int arr[4] = '{1,2,3,4};
int arr[4] = '{1,2,3}; // WRONG - all must be initialized
bit [31:0] src; // packed
bit src[5]; // unpacked
bit [31:0] arr[5];
bit [1:0] arr = 1; // arr[0] = 1  // highest index (1) is the MSB
bit [0:1] arr = 1; // arr[1] = 1  // highest index (1) is the LSB

// display directive
// =================
$display("a");
$display("a", "b");
$display("%d", a); // decimal
$displayd(a); // decimal
$display("%b", b); //binary
$displayb(b); //binary
$write("a"); // write to buffer
$display; // display what is in buffer and insert a new line after it in the console
$display("%s", "a"); //string
$display("a",,"b"); // "a b"  // space

// other directives
// ================
$size(arr);

// assignment
// ==========
assign logic1 = ~param1 // continuous
a = 1'b0; // blocking
a <= 1'b0; // non blocking
a = 1'bx; // 1 don't care bit 
a = 4'b11; //0011 (padding with 0s)
a = 4'hA; // hexadecimal
int a = 1'bx; //0 (don't care bits converted to zeros in 2 states data types)
real r = 3.25; //3.25
bit [9:0] bit_arr = 5'b11111; //0000011111 // assigning to an array
a = 8'b1111_1111; // using underscore

// array assignemnt
// ================
arr[1] = 1;
arr[1][1] = 1;
arr = {1,2,3,4}; // size of arr must be 4
arr[0:2] = {1,2,3}; // bit 3 is not changed
arr = '{4{8}}; // {8,8,8,8}  // arr size must be 4
arr = '{default: 8}; // {8,8,8,8}  // arr can be of any size
arr1 = arr2; // assign an array to the other
bit [1:0] [3:0] arr1; bit [3:0] arr2; arr1[0] = arr2; // assigning array to another

arr1 == arr2 // compare arrays

// flow control
// ============
initial begin end
initial begin 
  #5 //after 5 ns
end
initial begin 
  forever begin end // same as always
end


always begin end
always @(posedge clk) begin end


if (1 == 1) begin end


for (int i = 0; i < $size(arr); i++) begin end

foreach(arr[j]) begin end
foreach(arr[i, j]) begin end // 2d array
foreach(arr[i]) begin // 2d array - step through the rows
  foreach(arr[,j]) begin end // step through the columns
end 


// snippet written in test bench for graphing
initial begin 
  $dumpfile("uvm.vcd");
  $dumpvars;
  #200 $finish
end