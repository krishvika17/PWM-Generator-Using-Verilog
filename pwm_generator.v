module pwm_generator(
    input clk,              // System clock input
    input reset,            // Reset signal to initialize counter
    input enable,           // Enables/disables PWM generation
    input [3:0] duty,       // 4-bit duty cycle input (0–15)
    output pwm_out          // PWM output signal
);

    // ---------------------------------------------------------
    // Internal register declaration
    // 4-bit counter used to generate PWM time base
    // ---------------------------------------------------------
    // 4-bit counter used as the PWM time base
    reg [3:0] counter;

    // ---------------------------------------------------------
    // Counter logic
    // Counter increments at every rising clock edge
    // Counter generates one complete PWM period by counting
    // from 0 to 15. After reaching 15, it wraps back to 0.
    // ---------------------------------------------------------
   always @(posedge clk or posedge reset)
    begin
        if (reset) // Reset the counter to its initial state
            counter <= 4'd0;
        else if (enable) // Counter operates only when enable is HIGH
        begin
            // Restart counting after one PWM period
            if (counter == 4'd15)
                counter <= 4'd0;
            else
                counter <= counter + 4'd1; // Increment counter on every clock cycle
        end
    end

    // ---------------------------------------------------------
    // Comparator logic
    // PWM output remains HIGH while the counter value
    // is less than the programmed duty cycle.
    // ---------------------------------------------------------
    assign pwm_out = (counter < duty); 
endmodule