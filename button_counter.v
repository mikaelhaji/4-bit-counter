// Count up on button press and display on leds

module button_counter (
    // Inputs

    input  [1:0] BTN,

    // Outputs

    output reg [3:0] LED
);

    wire rst;
    wire clk;

    // Reset is the inverse of the 1st button
    assign rst = BTN[0];

    // Clock is the 2nd button (inverse of the second button)
    assign clk = BTN[1];

    // Count up on the clock rising edge or reset on the button push
    always @ (posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            LED <= 4'b0000; // loaded into the led bus
        end else begin
            LED <= LED + 1'b1; // increment the led bus
        end
    end

    
endmodule