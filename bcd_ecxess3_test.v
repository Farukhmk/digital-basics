module bcd_excess3t();
reg [3:0] bcd_int;
wire [3:0] excess3_outt;
bcd_excess3 uut (
    .bcd_in(bcd_int),
    .excess3_out(excess3_outt)
);
reg clk;
reg rst;

initial begin
    clk = 0;
    rst = 1;
    #5 rst = 0;
end

always #10 clk = ~clk;

reg [3:0]i;
 always @(posedge clk or posedge rst) begin
    if (rst) begin
        i <= 4'b0000;
    end else begin
        if (i < 4'b1001) begin
            bcd_int <= i;
            #20;
            i <= i + 1;
            else
            i=4'b0000;
        end
    end
 end

