`timescale 1ns/1ps

module tb_aes_cipher_top;

reg         clk;
reg         rst;
reg         ld;
reg [127:0] key;
reg [127:0] text_in;
wire [127:0] text_out;
wire        done;

aes_cipher_top uut (
    .clk(clk),
    .rst(rst),
    .ld(ld),
    .key(key),
    .text_in(text_in),
    .text_out(text_out),
    .done(done)
);

// Clock generation
always #5 clk = ~clk;  // 100 MHz clock

// Test vectors from NIST and standard suites
reg [127:0] keys      [0:3];
reg [127:0] plaintext [0:3];
reg [127:0] expected  [0:3];

integer i;
integer pass_count = 0;
integer total_tests = 4;

initial begin
    $dumpfile("aes.vcd");
    $dumpvars(0, tb_aes_cipher_top);

    // Test Vector Set
    keys[0]      = 128'h2b7e151628aed2a6abf7158809cf4f3c;
    plaintext[0] = 128'h6bc1bee22e409f96e93d7e117393172a;
    expected[0]  = 128'h4e2a9dd9fdb04829c1efb1fb499eac5c;

    keys[1]      = 128'h000102030405060708090a0b0c0d0e0f;
    plaintext[1] = 128'h00112233445566778899aabbccddeeff;
    expected[1]  = 128'h6e438b7a7f79e9bbe46737c1fa8cfba0;

    keys[2]      = 128'h10a58869d74be5a374cf867cfb473859;
    plaintext[2] = 128'h0111110076094e000023989502600000;
    expected[2]  = 128'h43fb0dca9577912e3d5d2f689317c2f8;

    keys[3]      = 128'h034672947809fabc45e345621075fecd;
    plaintext[3] = 128'hf226354987febc34afef49864378287f;
    expected[3]  = 128'hb4ba008085002d2562e9815921de80f5;


    // Initialize
    clk = 0;
    rst = 0;
    ld  = 0;
    #20 rst = 1; // Release reset

    for (i = 0; i < total_tests; i = i + 1) begin
        @(posedge clk);
        key      <= keys[i];
        text_in  <= plaintext[i];
        ld       <= 1;
        @(posedge clk);
        ld       <= 0;

        // Wait for done signal
        wait (done);

        $display("--------------------------------------------------");
        $display("Test %0d:", i + 1);
        $display("Key       : %h", keys[i]);
        $display("Plaintext : %h", plaintext[i]);
        $display("Expected  : %h", expected[i]);
        $display("Output    : %h", text_out);

        if (text_out === expected[i]) begin
            $display("Test %0d PASSED", i + 1);
            pass_count = pass_count + 1;
        end else begin
            $display("Test %0d FAILED", i + 1);
        end

        // Small delay before next test
        repeat (5) @(posedge clk);
    end

    $display("--------------------------------------------------");
    $display("PERCENTAGE TEST PASSED: %0d%% (%0d/%0d)", 
        (pass_count * 100) / total_tests, pass_count, total_tests);
    $display("--------------------------------------------------");

    $finish;
end

endmodule

