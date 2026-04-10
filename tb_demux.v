`timescale 1ns / 1ps

module tb_demux();
    reg D, EN;
    reg [2:0] S;
    wire [7:0] Y;

    // Instantiate the Unit Under Test (UUT)
    demux1to8 uut (
        .D(D),
        .S(S),
        .EN(EN),
        .Y(Y)
    );

    initial begin
        // Console monitoring for ModelSim
        $monitor("Time=%0t | EN=%b | S=%d | D=%b | Y=%b", $time, EN, S, D, Y);

        // Test 1: Verify high-impedance state (EN = 1)
        EN = 1; D = 1; S = 3'd5; #10;
        
        // Test 2: Normal operation (EN = 0)
        EN = 0;
        D = 1;
        S = 3'd0; #10;
        S = 3'd3; #10;
        S = 3'd7; #10;
        
        // Test 3: Change input data D
        D = 0; S = 3'd7; #10;
        
        // Test 4: Return to Z-state during operation
        EN = 1; #10;

        $stop;
    end
endmodule