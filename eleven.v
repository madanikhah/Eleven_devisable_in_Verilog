module eleven (a, d);
    
    parameter n;
    input [4*n-1:0] a;
    output d;
    wire signed [6:0]res[n:0];
    
    assign res[0] = 0;
    
    genvar i;
    generate
    for(i = 1; i <= n; i = i + 1) begin
        assign res[i] = res[i - 1] + (i[0] == 0 ? -a[4 * i-1 -: 4] : a[4 * i - 1 -:4]);
    end
    endgenerate
    assign d = (res[n] == 44 ? 1'b1:
    res[n] == 33 ? 1'b1:
    res[n] == 22 ? 1'b1:
    res[n] == 11 ? 1'b1:
    res[n] == 0 ? 1'b1:
    res[n] == -11 ? 1'b1:
    res[n] == -22 ? 1'b1:
    res[n] == -33 ? 1'b1:
    res[n] == -44 ? 1'b1:
     1'b0);
    
endmodule
