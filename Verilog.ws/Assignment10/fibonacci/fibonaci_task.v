module fabinocci_seri(
    input [16:0]ip, 
    output reg [16:0]op );

    task fab_ser(
    input [16:0]ip,
    output [16:0]re
    );

    reg [16:0] n1;
    reg [16:0] n2;
    integer i;

    begin
        n1=16'd0;
        n2=16'd1;
        if(ip==1)
        re=n1;
        else if( ip ==2)
        re=n2;
        else 
        begin
            for(i=2;i<ip;i=i+1) 
            begin
            re=n1+n2;
            n1=n2;
            n2=re;
            end
        end
        end
    endtask

always @(*)
begin
    fab_ser(ip, op);
end
endmodule


module tb;
reg [16:0] ip;
wire [16:0] out;
integer i, file_handle;

fabinocci_seri uut(ip,out);

initial
begin

    file_handle = $fopen("fibonaci.txt", "w");    

    for(i=0;i<16;i=i+1)begin
            ip=i;#10
            $fdisplay(file_handle,"ip=%d op = %d",ip,out);
    end

    $fclose(file_handle);
end
endmodule