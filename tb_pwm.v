`timescale 1ns/1ps

module tb_pwm;

reg clk;
reg reset;
reg [3:0] duty;
wire pwm_out;

// instantiate module
pwm_generator uut(
    .clk(clk),
    .reset(reset),
    .duty(duty),
    .pwm_out(pwm_out)
);

// clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// test sequence
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb_pwm);

    reset = 1;
    duty = 3;

    #20 reset = 0;

    #100 duty = 5;   // 50%
    #100 duty = 8;   // 80%

    #100 $finish;
end

endmodule
