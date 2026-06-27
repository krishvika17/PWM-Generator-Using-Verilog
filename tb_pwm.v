`timescale 1ns/1ps

module tb_pwm;

    // Testbench signals
    reg clk;
    reg reset;
    reg enable;
    reg [3:0] duty;
    wire pwm_out;

    // ---------------------------------------------------------
    // Instantiate the PWM Generator
    // ---------------------------------------------------------
    pwm_generator uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    // ---------------------------------------------------------
    // Clock Generation
    // Generates a clock with a period of 10 ns
    // ---------------------------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // ---------------------------------------------------------
    // Test Sequence
    // ---------------------------------------------------------
    initial begin

        // Generate waveform file
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_pwm);

        // Initialize signals
        reset  = 1;
        enable = 0;
        duty   = 0;

        // Hold reset for 20 ns
        #20;
        reset  = 0;
        enable = 1;

        // -----------------------------
        // Test different duty cycles
        // -----------------------------

        $display("Testing Duty = 0%");
        duty = 4'd0;
        #160;

        $display("Testing Duty = 6.25%");
        duty = 4'd1;
        #160;

        $display("Testing Duty = 25%");
        duty = 4'd4;
        #160;

        $display("Testing Duty = 50%");
        duty = 4'd8;
        #160;

        $display("Testing Duty = 75%");
        duty = 4'd12;
        #160;

        $display("Testing Duty = 93.75%");
        duty = 4'd15;
        #160;

        // -----------------------------
        // Test Enable Signal
        // -----------------------------

        $display("Disabling PWM...");
        enable = 0;
        #100;

        $display("Enabling PWM...");
        enable = 1;
        #160;

        $display("Simulation Completed Successfully.");

        $finish;

    end

endmodule
