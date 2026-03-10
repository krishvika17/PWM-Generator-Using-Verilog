module pwm_generator(
    input clk,              // System clock input
    input reset,            // Reset signal to initialize counter
    input [3:0] duty,       // 4-bit duty cycle control input
    output pwm_out          // PWM output signal
);

    // ---------------------------------------------------------
    // Internal register declaration
    // 4-bit counter used to generate PWM time base
    // ---------------------------------------------------------
    reg [3:0] counter = 0;

    // ---------------------------------------------------------
    // Counter logic
    // Counter increments at every rising clock edge
    // Counts from 0 to 9 and then resets to 0
    // ---------------------------------------------------------
    always @(posedge clk or posedge reset)
    begin
        if(reset)
            counter <= 0;           // Reset counter
        else if(counter == 9)
            counter <= 0;           // Restart PWM period
        else
            counter <= counter + 1; // Increment counter
    end

    // ---------------------------------------------------------
    // Comparator logic
    // Generates PWM output based on duty cycle comparison
    // ---------------------------------------------------------
    assign pwm_out = (counter < duty);

endmodule

💡 If you want, I can also give you a similarly well-commented tb_pwm.v testbench so both files in your repo look professional.
