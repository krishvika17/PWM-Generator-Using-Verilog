module pwm_generator(
    input clk,
    input reset,
    input [3:0] duty,   // duty cycle (0–9)
    output pwm_out
);

reg [3:0] counter = 0;

// counter logic
always @(posedge clk or posedge reset)
begin
    if(reset)
        counter <= 0;
    else if(counter == 9)
        counter <= 0;
    else
        counter <= counter + 1;
end

// PWM output
assign pwm_out = (counter < duty);

endmodule
