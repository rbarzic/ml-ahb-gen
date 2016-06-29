module HastiBus(input clk, input reset,
    input [31:0] io_master_haddr,
    input  io_master_hwrite,
    input [2:0] io_master_hsize,
    input [2:0] io_master_hburst,
    input [3:0] io_master_hprot,
    input [1:0] io_master_htrans,
    input  io_master_hmastlock,
    input [31:0] io_master_hwdata,
    output[31:0] io_master_hrdata,
    output io_master_hready,
    output io_master_hresp,
    output[31:0] io_slaves_1_haddr,
    output io_slaves_1_hwrite,
    output[2:0] io_slaves_1_hsize,
    output[2:0] io_slaves_1_hburst,
    output[3:0] io_slaves_1_hprot,
    output[1:0] io_slaves_1_htrans,
    output io_slaves_1_hmastlock,
    output[31:0] io_slaves_1_hwdata,
    input [31:0] io_slaves_1_hrdata,
    output io_slaves_1_hsel,
    output io_slaves_1_hreadyin,
    input  io_slaves_1_hreadyout,
    input  io_slaves_1_hresp,
    output[31:0] io_slaves_0_haddr,
    output io_slaves_0_hwrite,
    output[2:0] io_slaves_0_hsize,
    output[2:0] io_slaves_0_hburst,
    output[3:0] io_slaves_0_hprot,
    output[1:0] io_slaves_0_htrans,
    output io_slaves_0_hmastlock,
    output[31:0] io_slaves_0_hwdata,
    input [31:0] io_slaves_0_hrdata,
    output io_slaves_0_hsel,
    output io_slaves_0_hreadyin,
    input  io_slaves_0_hreadyout,
    input  io_slaves_0_hresp
);

  wire T0;
  reg  skb_valid;
  wire T47;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire[1:0] T7;
  wire[1:0] T8;
  wire T9;
  wire T10;
  wire[1:0] master_htrans;
  reg [1:0] skb_htrans;
  wire[1:0] T11;
  wire T12;
  wire T13;
  wire[3:0] T14;
  wire[31:0] master_haddr;
  reg [31:0] skb_haddr;
  wire[31:0] T15;
  wire T16;
  wire T17;
  wire T18;
  wire[3:0] T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  reg  R24;
  wire T48;
  wire T25;
  reg  R26;
  wire T49;
  wire T27;
  wire master_hready;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire[31:0] master_hwdata;
  reg [31:0] skb_hwdata;
  wire master_hmastlock;
  reg  skb_hmastlock;
  wire T33;
  wire[3:0] master_hprot;
  reg [3:0] skb_hprot;
  wire[3:0] T34;
  wire[2:0] master_hburst;
  reg [2:0] skb_hburst;
  wire[2:0] T35;
  wire[2:0] master_hsize;
  reg [2:0] skb_hsize;
  wire[2:0] T36;
  wire master_hwrite;
  reg  skb_hwrite;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire[31:0] T44;
  wire[31:0] T45;
  wire[31:0] T46;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    skb_valid = {1{$random}};
    skb_htrans = {1{$random}};
    skb_haddr = {1{$random}};
    R24 = {1{$random}};
    R26 = {1{$random}};
    skb_hwdata = {1{$random}};
    skb_hmastlock = {1{$random}};
    skb_hprot = {1{$random}};
    skb_hburst = {1{$random}};
    skb_hsize = {1{$random}};
    skb_hwrite = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_slaves_0_hreadyin = T0;
  assign T0 = skb_valid | io_master_hready;
  assign T47 = reset ? 1'h0 : T1;
  assign T1 = master_hready ? T2 : skb_valid;
  assign T2 = T23 & T3;
  assign T3 = T20 | T4;
  assign T4 = T6 & T5;
  assign T5 = io_slaves_1_hreadyout ^ 1'h1;
  assign T6 = T7[1];
  assign T7 = T16 ? 2'h1 : T8;
  assign T8 = T9 ? 2'h2 : 2'h0;
  assign T9 = T13 & T10;
  assign T10 = master_htrans != 2'h0;
  assign master_htrans = skb_valid ? skb_htrans : io_master_htrans;
  assign T11 = T12 ? io_master_htrans : skb_htrans;
  assign T12 = master_hready & T2;
  assign T13 = T14 == 4'h0;
  assign T14 = master_haddr[31:28];
  assign master_haddr = skb_valid ? skb_haddr : io_master_haddr;
  assign T15 = T12 ? io_master_haddr : skb_haddr;
  assign T16 = T18 & T17;
  assign T17 = master_htrans != 2'h0;
  assign T18 = T19 == 4'h2;
  assign T19 = master_haddr[31:28];
  assign T20 = T22 & T21;
  assign T21 = io_slaves_0_hreadyout ^ 1'h1;
  assign T22 = T7[0];
  assign T23 = R26 | R24;
  assign T48 = reset ? 1'h0 : T25;
  assign T25 = master_hready ? T6 : R24;
  assign T49 = reset ? 1'h0 : T27;
  assign T27 = master_hready ? T22 : R26;
  assign master_hready = T31 | T28;
  assign T28 = T30 | T29;
  assign T29 = R24 ? io_slaves_1_hreadyout : 1'h0;
  assign T30 = R26 ? io_slaves_0_hreadyout : 1'h0;
  assign T31 = T32 == 1'h0;
  assign T32 = R26 | R24;
  assign io_slaves_0_hsel = T22;
  assign io_slaves_0_hwdata = master_hwdata;
  assign master_hwdata = skb_valid ? skb_hwdata : io_master_hwdata;
  assign io_slaves_0_hmastlock = master_hmastlock;
  assign master_hmastlock = skb_valid ? skb_hmastlock : io_master_hmastlock;
  assign T33 = T12 ? io_master_hmastlock : skb_hmastlock;
  assign io_slaves_0_htrans = master_htrans;
  assign io_slaves_0_hprot = master_hprot;
  assign master_hprot = skb_valid ? skb_hprot : io_master_hprot;
  assign T34 = T12 ? io_master_hprot : skb_hprot;
  assign io_slaves_0_hburst = master_hburst;
  assign master_hburst = skb_valid ? skb_hburst : io_master_hburst;
  assign T35 = T12 ? io_master_hburst : skb_hburst;
  assign io_slaves_0_hsize = master_hsize;
  assign master_hsize = skb_valid ? skb_hsize : io_master_hsize;
  assign T36 = T12 ? io_master_hsize : skb_hsize;
  assign io_slaves_0_hwrite = master_hwrite;
  assign master_hwrite = skb_valid ? skb_hwrite : io_master_hwrite;
  assign T37 = T12 ? io_master_hwrite : skb_hwrite;
  assign io_slaves_0_haddr = master_haddr;
  assign io_slaves_1_hreadyin = T38;
  assign T38 = skb_valid | io_master_hready;
  assign io_slaves_1_hsel = T6;
  assign io_slaves_1_hwdata = master_hwdata;
  assign io_slaves_1_hmastlock = master_hmastlock;
  assign io_slaves_1_htrans = master_htrans;
  assign io_slaves_1_hprot = master_hprot;
  assign io_slaves_1_hburst = master_hburst;
  assign io_slaves_1_hsize = master_hsize;
  assign io_slaves_1_hwrite = master_hwrite;
  assign io_slaves_1_haddr = master_haddr;
  assign io_master_hresp = T39;
  assign T39 = T41 | T40;
  assign T40 = R24 ? io_slaves_1_hresp : 1'h0;
  assign T41 = R26 ? io_slaves_0_hresp : 1'h0;
  assign io_master_hready = T42;
  assign T42 = T43 & master_hready;
  assign T43 = skb_valid ^ 1'h1;
  assign io_master_hrdata = T44;
  assign T44 = T46 | T45;
  assign T45 = R24 ? io_slaves_1_hrdata : 32'h0;
  assign T46 = R26 ? io_slaves_0_hrdata : 32'h0;

  always @(posedge clk) begin
    if(reset) begin
      skb_valid <= 1'h0;
    end else if(master_hready) begin
      skb_valid <= T2;
    end
    if(T12) begin
      skb_htrans <= io_master_htrans;
    end
    if(T12) begin
      skb_haddr <= io_master_haddr;
    end
    if(reset) begin
      R24 <= 1'h0;
    end else if(master_hready) begin
      R24 <= T6;
    end
    if(reset) begin
      R26 <= 1'h0;
    end else if(master_hready) begin
      R26 <= T22;
    end
    skb_hwdata <= skb_hwdata;
    if(T12) begin
      skb_hmastlock <= io_master_hmastlock;
    end
    if(T12) begin
      skb_hprot <= io_master_hprot;
    end
    if(T12) begin
      skb_hburst <= io_master_hburst;
    end
    if(T12) begin
      skb_hsize <= io_master_hsize;
    end
    if(T12) begin
      skb_hwrite <= io_master_hwrite;
    end
  end
endmodule

module HastiSlaveMux(input clk, input reset,
    input [31:0] io_ins_2_haddr,
    input  io_ins_2_hwrite,
    input [2:0] io_ins_2_hsize,
    input [2:0] io_ins_2_hburst,
    input [3:0] io_ins_2_hprot,
    input [1:0] io_ins_2_htrans,
    input  io_ins_2_hmastlock,
    input [31:0] io_ins_2_hwdata,
    output[31:0] io_ins_2_hrdata,
    input  io_ins_2_hsel,
    input  io_ins_2_hreadyin,
    output io_ins_2_hreadyout,
    output io_ins_2_hresp,
    input [31:0] io_ins_1_haddr,
    input  io_ins_1_hwrite,
    input [2:0] io_ins_1_hsize,
    input [2:0] io_ins_1_hburst,
    input [3:0] io_ins_1_hprot,
    input [1:0] io_ins_1_htrans,
    input  io_ins_1_hmastlock,
    input [31:0] io_ins_1_hwdata,
    output[31:0] io_ins_1_hrdata,
    input  io_ins_1_hsel,
    input  io_ins_1_hreadyin,
    output io_ins_1_hreadyout,
    output io_ins_1_hresp,
    input [31:0] io_ins_0_haddr,
    input  io_ins_0_hwrite,
    input [2:0] io_ins_0_hsize,
    input [2:0] io_ins_0_hburst,
    input [3:0] io_ins_0_hprot,
    input [1:0] io_ins_0_htrans,
    input  io_ins_0_hmastlock,
    input [31:0] io_ins_0_hwdata,
    output[31:0] io_ins_0_hrdata,
    input  io_ins_0_hsel,
    input  io_ins_0_hreadyin,
    output io_ins_0_hreadyout,
    output io_ins_0_hresp,
    output[31:0] io_out_haddr,
    output io_out_hwrite,
    output[2:0] io_out_hsize,
    output[2:0] io_out_hburst,
    output[3:0] io_out_hprot,
    output[1:0] io_out_htrans,
    output io_out_hmastlock,
    output[31:0] io_out_hwdata,
    input [31:0] io_out_hrdata,
    output io_out_hsel,
    output io_out_hreadyin,
    input  io_out_hreadyout,
    input  io_out_hresp
);

  wire T0;
  wire T1;
  wire[2:0] T2;
  wire[2:0] T3;
  wire[2:0] T4;
  wire requests_2;
  reg  R5;
  wire T168;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire requests_1;
  reg  R15;
  wire T169;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire requests_0;
  reg  R26;
  wire T170;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire[31:0] T38;
  wire[31:0] T39;
  reg  R40;
  wire T171;
  wire T41;
  wire[31:0] T42;
  wire[31:0] T43;
  reg  R44;
  wire T172;
  wire T45;
  wire[31:0] T46;
  reg  R47;
  wire T173;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  reg  R52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  reg  R58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  reg  R63;
  wire T64;
  wire T65;
  wire[1:0] T66;
  wire[1:0] T67;
  wire[1:0] T68;
  reg [1:0] R69;
  wire[1:0] T70;
  wire[1:0] T71;
  wire[1:0] T72;
  wire[1:0] T73;
  reg [1:0] R74;
  wire[1:0] T75;
  wire[1:0] T76;
  wire[1:0] T77;
  reg [1:0] R78;
  wire[1:0] T79;
  wire[3:0] T80;
  wire[3:0] T81;
  wire[3:0] T82;
  reg [3:0] R83;
  wire[3:0] T84;
  wire[3:0] T85;
  wire[3:0] T86;
  wire[3:0] T87;
  reg [3:0] R88;
  wire[3:0] T89;
  wire[3:0] T90;
  wire[3:0] T91;
  reg [3:0] R92;
  wire[3:0] T93;
  wire[2:0] T94;
  wire[2:0] T95;
  wire[2:0] T96;
  reg [2:0] R97;
  wire[2:0] T98;
  wire[2:0] T99;
  wire[2:0] T100;
  wire[2:0] T101;
  reg [2:0] R102;
  wire[2:0] T103;
  wire[2:0] T104;
  wire[2:0] T105;
  reg [2:0] R106;
  wire[2:0] T107;
  wire[2:0] T108;
  wire[2:0] T109;
  wire[2:0] T110;
  reg [2:0] R111;
  wire[2:0] T112;
  wire[2:0] T113;
  wire[2:0] T114;
  wire[2:0] T115;
  reg [2:0] R116;
  wire[2:0] T117;
  wire[2:0] T118;
  wire[2:0] T119;
  reg [2:0] R120;
  wire[2:0] T121;
  wire T122;
  wire T123;
  wire T124;
  reg  R125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  reg  R130;
  wire T131;
  wire T132;
  wire T133;
  reg  R134;
  wire T135;
  wire[31:0] T136;
  wire[31:0] T137;
  wire[31:0] T138;
  reg [31:0] R139;
  wire[31:0] T140;
  wire[31:0] T141;
  wire[31:0] T142;
  wire[31:0] T143;
  reg [31:0] R144;
  wire[31:0] T145;
  wire[31:0] T146;
  wire[31:0] T147;
  reg [31:0] R148;
  wire[31:0] T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire[31:0] T154;
  wire[31:0] T155;
  wire[31:0] T174;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire[31:0] T160;
  wire[31:0] T161;
  wire[31:0] T175;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire[31:0] T166;
  wire[31:0] T167;
  wire[31:0] T176;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R5 = {1{$random}};
    R15 = {1{$random}};
    R26 = {1{$random}};
    R40 = {1{$random}};
    R44 = {1{$random}};
    R47 = {1{$random}};
    R52 = {1{$random}};
    R58 = {1{$random}};
    R63 = {1{$random}};
    R69 = {1{$random}};
    R74 = {1{$random}};
    R78 = {1{$random}};
    R83 = {1{$random}};
    R88 = {1{$random}};
    R92 = {1{$random}};
    R97 = {1{$random}};
    R102 = {1{$random}};
    R106 = {1{$random}};
    R111 = {1{$random}};
    R116 = {1{$random}};
    R120 = {1{$random}};
    R125 = {1{$random}};
    R130 = {1{$random}};
    R134 = {1{$random}};
    R139 = {1{$random}};
    R144 = {1{$random}};
    R148 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_hreadyin = io_out_hreadyout;
  assign io_out_hsel = T0;
  assign T0 = T37 | T1;
  assign T1 = T2[2];
  assign T2 = requests_0 ? 3'h1 : T3;
  assign T3 = requests_1 ? 3'h2 : T4;
  assign T4 = requests_2 ? 3'h4 : 3'h0;
  assign requests_2 = T14 | R5;
  assign T168 = reset ? 1'h0 : T6;
  assign T6 = T10 ? T9 : T7;
  assign T7 = T8 ? 1'h0 : R5;
  assign T8 = io_out_hreadyout & T1;
  assign T9 = io_ins_2_hsel & io_ins_2_hreadyin;
  assign T10 = io_out_hreadyout & T11;
  assign T11 = T13 & T12;
  assign T12 = R5 ^ 1'h1;
  assign T13 = T1 ^ 1'h1;
  assign T14 = io_ins_2_hsel & io_ins_2_hreadyin;
  assign requests_1 = T25 | R15;
  assign T169 = reset ? 1'h0 : T16;
  assign T16 = T21 ? T20 : T17;
  assign T17 = T18 ? 1'h0 : R15;
  assign T18 = io_out_hreadyout & T19;
  assign T19 = T2[1];
  assign T20 = io_ins_1_hsel & io_ins_1_hreadyin;
  assign T21 = io_out_hreadyout & T22;
  assign T22 = T24 & T23;
  assign T23 = R15 ^ 1'h1;
  assign T24 = T19 ^ 1'h1;
  assign T25 = io_ins_1_hsel & io_ins_1_hreadyin;
  assign requests_0 = T36 | R26;
  assign T170 = reset ? 1'h0 : T27;
  assign T27 = T32 ? T31 : T28;
  assign T28 = T29 ? 1'h0 : R26;
  assign T29 = io_out_hreadyout & T30;
  assign T30 = T2[0];
  assign T31 = io_ins_0_hsel & io_ins_0_hreadyin;
  assign T32 = io_out_hreadyout & T33;
  assign T33 = T35 & T34;
  assign T34 = R26 ^ 1'h1;
  assign T35 = T30 ^ 1'h1;
  assign T36 = io_ins_0_hsel & io_ins_0_hreadyin;
  assign T37 = T30 | T19;
  assign io_out_hwdata = T38;
  assign T38 = T42 | T39;
  assign T39 = R40 ? io_ins_2_hwdata : 32'h0;
  assign T171 = reset ? 1'h1 : T41;
  assign T41 = io_out_hreadyout ? T1 : R40;
  assign T42 = T46 | T43;
  assign T43 = R44 ? io_ins_1_hwdata : 32'h0;
  assign T172 = reset ? 1'h1 : T45;
  assign T45 = io_out_hreadyout ? T19 : R44;
  assign T46 = R47 ? io_ins_0_hwdata : 32'h0;
  assign T173 = reset ? 1'h1 : T48;
  assign T48 = io_out_hreadyout ? T30 : R47;
  assign io_out_hmastlock = T49;
  assign T49 = T55 | T50;
  assign T50 = T1 ? T51 : 1'h0;
  assign T51 = R5 ? R52 : io_ins_2_hmastlock;
  assign T53 = T54 ? io_ins_2_hmastlock : R52;
  assign T54 = T10 & T9;
  assign T55 = T61 | T56;
  assign T56 = T19 ? T57 : 1'h0;
  assign T57 = R15 ? R58 : io_ins_1_hmastlock;
  assign T59 = T60 ? io_ins_1_hmastlock : R58;
  assign T60 = T21 & T20;
  assign T61 = T30 ? T62 : 1'h0;
  assign T62 = R26 ? R63 : io_ins_0_hmastlock;
  assign T64 = T65 ? io_ins_0_hmastlock : R63;
  assign T65 = T32 & T31;
  assign io_out_htrans = T66;
  assign T66 = T71 | T67;
  assign T67 = T1 ? T68 : 2'h0;
  assign T68 = R5 ? R69 : io_ins_2_htrans;
  assign T70 = T54 ? io_ins_2_htrans : R69;
  assign T71 = T76 | T72;
  assign T72 = T19 ? T73 : 2'h0;
  assign T73 = R15 ? R74 : io_ins_1_htrans;
  assign T75 = T60 ? io_ins_1_htrans : R74;
  assign T76 = T30 ? T77 : 2'h0;
  assign T77 = R26 ? R78 : io_ins_0_htrans;
  assign T79 = T65 ? io_ins_0_htrans : R78;
  assign io_out_hprot = T80;
  assign T80 = T85 | T81;
  assign T81 = T1 ? T82 : 4'h0;
  assign T82 = R5 ? R83 : io_ins_2_hprot;
  assign T84 = T54 ? io_ins_2_hprot : R83;
  assign T85 = T90 | T86;
  assign T86 = T19 ? T87 : 4'h0;
  assign T87 = R15 ? R88 : io_ins_1_hprot;
  assign T89 = T60 ? io_ins_1_hprot : R88;
  assign T90 = T30 ? T91 : 4'h0;
  assign T91 = R26 ? R92 : io_ins_0_hprot;
  assign T93 = T65 ? io_ins_0_hprot : R92;
  assign io_out_hburst = T94;
  assign T94 = T99 | T95;
  assign T95 = T1 ? T96 : 3'h0;
  assign T96 = R5 ? R97 : io_ins_2_hburst;
  assign T98 = T54 ? io_ins_2_hburst : R97;
  assign T99 = T104 | T100;
  assign T100 = T19 ? T101 : 3'h0;
  assign T101 = R15 ? R102 : io_ins_1_hburst;
  assign T103 = T60 ? io_ins_1_hburst : R102;
  assign T104 = T30 ? T105 : 3'h0;
  assign T105 = R26 ? R106 : io_ins_0_hburst;
  assign T107 = T65 ? io_ins_0_hburst : R106;
  assign io_out_hsize = T108;
  assign T108 = T113 | T109;
  assign T109 = T1 ? T110 : 3'h0;
  assign T110 = R5 ? R111 : io_ins_2_hsize;
  assign T112 = T54 ? io_ins_2_hsize : R111;
  assign T113 = T118 | T114;
  assign T114 = T19 ? T115 : 3'h0;
  assign T115 = R15 ? R116 : io_ins_1_hsize;
  assign T117 = T60 ? io_ins_1_hsize : R116;
  assign T118 = T30 ? T119 : 3'h0;
  assign T119 = R26 ? R120 : io_ins_0_hsize;
  assign T121 = T65 ? io_ins_0_hsize : R120;
  assign io_out_hwrite = T122;
  assign T122 = T127 | T123;
  assign T123 = T1 ? T124 : 1'h0;
  assign T124 = R5 ? R125 : io_ins_2_hwrite;
  assign T126 = T54 ? io_ins_2_hwrite : R125;
  assign T127 = T132 | T128;
  assign T128 = T19 ? T129 : 1'h0;
  assign T129 = R15 ? R130 : io_ins_1_hwrite;
  assign T131 = T60 ? io_ins_1_hwrite : R130;
  assign T132 = T30 ? T133 : 1'h0;
  assign T133 = R26 ? R134 : io_ins_0_hwrite;
  assign T135 = T65 ? io_ins_0_hwrite : R134;
  assign io_out_haddr = T136;
  assign T136 = T141 | T137;
  assign T137 = T1 ? T138 : 32'h0;
  assign T138 = R5 ? R139 : io_ins_2_haddr;
  assign T140 = T54 ? io_ins_2_haddr : R139;
  assign T141 = T146 | T142;
  assign T142 = T19 ? T143 : 32'h0;
  assign T143 = R15 ? R144 : io_ins_1_haddr;
  assign T145 = T60 ? io_ins_1_haddr : R144;
  assign T146 = T30 ? T147 : 32'h0;
  assign T147 = R26 ? R148 : io_ins_0_haddr;
  assign T149 = T65 ? io_ins_0_haddr : R148;
  assign io_ins_0_hresp = T150;
  assign T150 = R47 & io_out_hresp;
  assign io_ins_0_hreadyout = T151;
  assign T151 = io_out_hreadyout & T152;
  assign T152 = T153 | R47;
  assign T153 = R26 ^ 1'h1;
  assign io_ins_0_hrdata = T154;
  assign T154 = T155 & io_out_hrdata;
  assign T155 = 32'h0 - T174;
  assign T174 = {31'h0, R47};
  assign io_ins_1_hresp = T156;
  assign T156 = R44 & io_out_hresp;
  assign io_ins_1_hreadyout = T157;
  assign T157 = io_out_hreadyout & T158;
  assign T158 = T159 | R44;
  assign T159 = R15 ^ 1'h1;
  assign io_ins_1_hrdata = T160;
  assign T160 = T161 & io_out_hrdata;
  assign T161 = 32'h0 - T175;
  assign T175 = {31'h0, R44};
  assign io_ins_2_hresp = T162;
  assign T162 = R40 & io_out_hresp;
  assign io_ins_2_hreadyout = T163;
  assign T163 = io_out_hreadyout & T164;
  assign T164 = T165 | R40;
  assign T165 = R5 ^ 1'h1;
  assign io_ins_2_hrdata = T166;
  assign T166 = T167 & io_out_hrdata;
  assign T167 = 32'h0 - T176;
  assign T176 = {31'h0, R40};

  always @(posedge clk) begin
    if(reset) begin
      R5 <= 1'h0;
    end else if(T10) begin
      R5 <= T9;
    end else if(T8) begin
      R5 <= 1'h0;
    end
    if(reset) begin
      R15 <= 1'h0;
    end else if(T21) begin
      R15 <= T20;
    end else if(T18) begin
      R15 <= 1'h0;
    end
    if(reset) begin
      R26 <= 1'h0;
    end else if(T32) begin
      R26 <= T31;
    end else if(T29) begin
      R26 <= 1'h0;
    end
    if(reset) begin
      R40 <= 1'h1;
    end else if(io_out_hreadyout) begin
      R40 <= T1;
    end
    if(reset) begin
      R44 <= 1'h1;
    end else if(io_out_hreadyout) begin
      R44 <= T19;
    end
    if(reset) begin
      R47 <= 1'h1;
    end else if(io_out_hreadyout) begin
      R47 <= T30;
    end
    if(T54) begin
      R52 <= io_ins_2_hmastlock;
    end
    if(T60) begin
      R58 <= io_ins_1_hmastlock;
    end
    if(T65) begin
      R63 <= io_ins_0_hmastlock;
    end
    if(T54) begin
      R69 <= io_ins_2_htrans;
    end
    if(T60) begin
      R74 <= io_ins_1_htrans;
    end
    if(T65) begin
      R78 <= io_ins_0_htrans;
    end
    if(T54) begin
      R83 <= io_ins_2_hprot;
    end
    if(T60) begin
      R88 <= io_ins_1_hprot;
    end
    if(T65) begin
      R92 <= io_ins_0_hprot;
    end
    if(T54) begin
      R97 <= io_ins_2_hburst;
    end
    if(T60) begin
      R102 <= io_ins_1_hburst;
    end
    if(T65) begin
      R106 <= io_ins_0_hburst;
    end
    if(T54) begin
      R111 <= io_ins_2_hsize;
    end
    if(T60) begin
      R116 <= io_ins_1_hsize;
    end
    if(T65) begin
      R120 <= io_ins_0_hsize;
    end
    if(T54) begin
      R125 <= io_ins_2_hwrite;
    end
    if(T60) begin
      R130 <= io_ins_1_hwrite;
    end
    if(T65) begin
      R134 <= io_ins_0_hwrite;
    end
    if(T54) begin
      R139 <= io_ins_2_haddr;
    end
    if(T60) begin
      R144 <= io_ins_1_haddr;
    end
    if(T65) begin
      R148 <= io_ins_0_haddr;
    end
  end
endmodule

module HastiXbar(input clk, input reset,
    input [31:0] io_masters_2_haddr,
    input  io_masters_2_hwrite,
    input [2:0] io_masters_2_hsize,
    input [2:0] io_masters_2_hburst,
    input [3:0] io_masters_2_hprot,
    input [1:0] io_masters_2_htrans,
    input  io_masters_2_hmastlock,
    input [31:0] io_masters_2_hwdata,
    output[31:0] io_masters_2_hrdata,
    output io_masters_2_hready,
    output io_masters_2_hresp,
    input [31:0] io_masters_1_haddr,
    input  io_masters_1_hwrite,
    input [2:0] io_masters_1_hsize,
    input [2:0] io_masters_1_hburst,
    input [3:0] io_masters_1_hprot,
    input [1:0] io_masters_1_htrans,
    input  io_masters_1_hmastlock,
    input [31:0] io_masters_1_hwdata,
    output[31:0] io_masters_1_hrdata,
    output io_masters_1_hready,
    output io_masters_1_hresp,
    input [31:0] io_masters_0_haddr,
    input  io_masters_0_hwrite,
    input [2:0] io_masters_0_hsize,
    input [2:0] io_masters_0_hburst,
    input [3:0] io_masters_0_hprot,
    input [1:0] io_masters_0_htrans,
    input  io_masters_0_hmastlock,
    input [31:0] io_masters_0_hwdata,
    output[31:0] io_masters_0_hrdata,
    output io_masters_0_hready,
    output io_masters_0_hresp,
    output[31:0] io_slaves_1_haddr,
    output io_slaves_1_hwrite,
    output[2:0] io_slaves_1_hsize,
    output[2:0] io_slaves_1_hburst,
    output[3:0] io_slaves_1_hprot,
    output[1:0] io_slaves_1_htrans,
    output io_slaves_1_hmastlock,
    output[31:0] io_slaves_1_hwdata,
    input [31:0] io_slaves_1_hrdata,
    output io_slaves_1_hsel,
    output io_slaves_1_hreadyin,
    input  io_slaves_1_hreadyout,
    input  io_slaves_1_hresp,
    output[31:0] io_slaves_0_haddr,
    output io_slaves_0_hwrite,
    output[2:0] io_slaves_0_hsize,
    output[2:0] io_slaves_0_hburst,
    output[3:0] io_slaves_0_hprot,
    output[1:0] io_slaves_0_htrans,
    output io_slaves_0_hmastlock,
    output[31:0] io_slaves_0_hwdata,
    input [31:0] io_slaves_0_hrdata,
    output io_slaves_0_hsel,
    output io_slaves_0_hreadyin,
    input  io_slaves_0_hreadyout,
    input  io_slaves_0_hresp
);

  wire[31:0] HastiBus_io_master_hrdata;
  wire HastiBus_io_master_hready;
  wire HastiBus_io_master_hresp;
  wire[31:0] HastiBus_io_slaves_1_haddr;
  wire HastiBus_io_slaves_1_hwrite;
  wire[2:0] HastiBus_io_slaves_1_hsize;
  wire[2:0] HastiBus_io_slaves_1_hburst;
  wire[3:0] HastiBus_io_slaves_1_hprot;
  wire[1:0] HastiBus_io_slaves_1_htrans;
  wire HastiBus_io_slaves_1_hmastlock;
  wire[31:0] HastiBus_io_slaves_1_hwdata;
  wire HastiBus_io_slaves_1_hsel;
  wire HastiBus_io_slaves_1_hreadyin;
  wire[31:0] HastiBus_io_slaves_0_haddr;
  wire HastiBus_io_slaves_0_hwrite;
  wire[2:0] HastiBus_io_slaves_0_hsize;
  wire[2:0] HastiBus_io_slaves_0_hburst;
  wire[3:0] HastiBus_io_slaves_0_hprot;
  wire[1:0] HastiBus_io_slaves_0_htrans;
  wire HastiBus_io_slaves_0_hmastlock;
  wire[31:0] HastiBus_io_slaves_0_hwdata;
  wire HastiBus_io_slaves_0_hsel;
  wire HastiBus_io_slaves_0_hreadyin;
  wire[31:0] HastiBus_1_io_master_hrdata;
  wire HastiBus_1_io_master_hready;
  wire HastiBus_1_io_master_hresp;
  wire[31:0] HastiBus_1_io_slaves_1_haddr;
  wire HastiBus_1_io_slaves_1_hwrite;
  wire[2:0] HastiBus_1_io_slaves_1_hsize;
  wire[2:0] HastiBus_1_io_slaves_1_hburst;
  wire[3:0] HastiBus_1_io_slaves_1_hprot;
  wire[1:0] HastiBus_1_io_slaves_1_htrans;
  wire HastiBus_1_io_slaves_1_hmastlock;
  wire[31:0] HastiBus_1_io_slaves_1_hwdata;
  wire HastiBus_1_io_slaves_1_hsel;
  wire HastiBus_1_io_slaves_1_hreadyin;
  wire[31:0] HastiBus_1_io_slaves_0_haddr;
  wire HastiBus_1_io_slaves_0_hwrite;
  wire[2:0] HastiBus_1_io_slaves_0_hsize;
  wire[2:0] HastiBus_1_io_slaves_0_hburst;
  wire[3:0] HastiBus_1_io_slaves_0_hprot;
  wire[1:0] HastiBus_1_io_slaves_0_htrans;
  wire HastiBus_1_io_slaves_0_hmastlock;
  wire[31:0] HastiBus_1_io_slaves_0_hwdata;
  wire HastiBus_1_io_slaves_0_hsel;
  wire HastiBus_1_io_slaves_0_hreadyin;
  wire[31:0] HastiBus_2_io_master_hrdata;
  wire HastiBus_2_io_master_hready;
  wire HastiBus_2_io_master_hresp;
  wire[31:0] HastiBus_2_io_slaves_1_haddr;
  wire HastiBus_2_io_slaves_1_hwrite;
  wire[2:0] HastiBus_2_io_slaves_1_hsize;
  wire[2:0] HastiBus_2_io_slaves_1_hburst;
  wire[3:0] HastiBus_2_io_slaves_1_hprot;
  wire[1:0] HastiBus_2_io_slaves_1_htrans;
  wire HastiBus_2_io_slaves_1_hmastlock;
  wire[31:0] HastiBus_2_io_slaves_1_hwdata;
  wire HastiBus_2_io_slaves_1_hsel;
  wire HastiBus_2_io_slaves_1_hreadyin;
  wire[31:0] HastiBus_2_io_slaves_0_haddr;
  wire HastiBus_2_io_slaves_0_hwrite;
  wire[2:0] HastiBus_2_io_slaves_0_hsize;
  wire[2:0] HastiBus_2_io_slaves_0_hburst;
  wire[3:0] HastiBus_2_io_slaves_0_hprot;
  wire[1:0] HastiBus_2_io_slaves_0_htrans;
  wire HastiBus_2_io_slaves_0_hmastlock;
  wire[31:0] HastiBus_2_io_slaves_0_hwdata;
  wire HastiBus_2_io_slaves_0_hsel;
  wire HastiBus_2_io_slaves_0_hreadyin;
  wire[31:0] HastiSlaveMux_io_ins_2_hrdata;
  wire HastiSlaveMux_io_ins_2_hreadyout;
  wire HastiSlaveMux_io_ins_2_hresp;
  wire[31:0] HastiSlaveMux_io_ins_1_hrdata;
  wire HastiSlaveMux_io_ins_1_hreadyout;
  wire HastiSlaveMux_io_ins_1_hresp;
  wire[31:0] HastiSlaveMux_io_ins_0_hrdata;
  wire HastiSlaveMux_io_ins_0_hreadyout;
  wire HastiSlaveMux_io_ins_0_hresp;
  wire[31:0] HastiSlaveMux_io_out_haddr;
  wire HastiSlaveMux_io_out_hwrite;
  wire[2:0] HastiSlaveMux_io_out_hsize;
  wire[2:0] HastiSlaveMux_io_out_hburst;
  wire[3:0] HastiSlaveMux_io_out_hprot;
  wire[1:0] HastiSlaveMux_io_out_htrans;
  wire HastiSlaveMux_io_out_hmastlock;
  wire[31:0] HastiSlaveMux_io_out_hwdata;
  wire HastiSlaveMux_io_out_hsel;
  wire HastiSlaveMux_io_out_hreadyin;
  wire[31:0] HastiSlaveMux_1_io_ins_2_hrdata;
  wire HastiSlaveMux_1_io_ins_2_hreadyout;
  wire HastiSlaveMux_1_io_ins_2_hresp;
  wire[31:0] HastiSlaveMux_1_io_ins_1_hrdata;
  wire HastiSlaveMux_1_io_ins_1_hreadyout;
  wire HastiSlaveMux_1_io_ins_1_hresp;
  wire[31:0] HastiSlaveMux_1_io_ins_0_hrdata;
  wire HastiSlaveMux_1_io_ins_0_hreadyout;
  wire HastiSlaveMux_1_io_ins_0_hresp;
  wire[31:0] HastiSlaveMux_1_io_out_haddr;
  wire HastiSlaveMux_1_io_out_hwrite;
  wire[2:0] HastiSlaveMux_1_io_out_hsize;
  wire[2:0] HastiSlaveMux_1_io_out_hburst;
  wire[3:0] HastiSlaveMux_1_io_out_hprot;
  wire[1:0] HastiSlaveMux_1_io_out_htrans;
  wire HastiSlaveMux_1_io_out_hmastlock;
  wire[31:0] HastiSlaveMux_1_io_out_hwdata;
  wire HastiSlaveMux_1_io_out_hsel;
  wire HastiSlaveMux_1_io_out_hreadyin;


  assign io_slaves_0_hreadyin = HastiSlaveMux_io_out_hreadyin;
  assign io_slaves_0_hsel = HastiSlaveMux_io_out_hsel;
  assign io_slaves_0_hwdata = HastiSlaveMux_io_out_hwdata;
  assign io_slaves_0_hmastlock = HastiSlaveMux_io_out_hmastlock;
  assign io_slaves_0_htrans = HastiSlaveMux_io_out_htrans;
  assign io_slaves_0_hprot = HastiSlaveMux_io_out_hprot;
  assign io_slaves_0_hburst = HastiSlaveMux_io_out_hburst;
  assign io_slaves_0_hsize = HastiSlaveMux_io_out_hsize;
  assign io_slaves_0_hwrite = HastiSlaveMux_io_out_hwrite;
  assign io_slaves_0_haddr = HastiSlaveMux_io_out_haddr;
  assign io_slaves_1_hreadyin = HastiSlaveMux_1_io_out_hreadyin;
  assign io_slaves_1_hsel = HastiSlaveMux_1_io_out_hsel;
  assign io_slaves_1_hwdata = HastiSlaveMux_1_io_out_hwdata;
  assign io_slaves_1_hmastlock = HastiSlaveMux_1_io_out_hmastlock;
  assign io_slaves_1_htrans = HastiSlaveMux_1_io_out_htrans;
  assign io_slaves_1_hprot = HastiSlaveMux_1_io_out_hprot;
  assign io_slaves_1_hburst = HastiSlaveMux_1_io_out_hburst;
  assign io_slaves_1_hsize = HastiSlaveMux_1_io_out_hsize;
  assign io_slaves_1_hwrite = HastiSlaveMux_1_io_out_hwrite;
  assign io_slaves_1_haddr = HastiSlaveMux_1_io_out_haddr;
  assign io_masters_0_hresp = HastiBus_io_master_hresp;
  assign io_masters_0_hready = HastiBus_io_master_hready;
  assign io_masters_0_hrdata = HastiBus_io_master_hrdata;
  assign io_masters_1_hresp = HastiBus_1_io_master_hresp;
  assign io_masters_1_hready = HastiBus_1_io_master_hready;
  assign io_masters_1_hrdata = HastiBus_1_io_master_hrdata;
  assign io_masters_2_hresp = HastiBus_2_io_master_hresp;
  assign io_masters_2_hready = HastiBus_2_io_master_hready;
  assign io_masters_2_hrdata = HastiBus_2_io_master_hrdata;
  HastiBus HastiBus(.clk(clk), .reset(reset),
       .io_master_haddr( io_masters_0_haddr ),
       .io_master_hwrite( io_masters_0_hwrite ),
       .io_master_hsize( io_masters_0_hsize ),
       .io_master_hburst( io_masters_0_hburst ),
       .io_master_hprot( io_masters_0_hprot ),
       .io_master_htrans( io_masters_0_htrans ),
       .io_master_hmastlock( io_masters_0_hmastlock ),
       .io_master_hwdata( io_masters_0_hwdata ),
       .io_master_hrdata( HastiBus_io_master_hrdata ),
       .io_master_hready( HastiBus_io_master_hready ),
       .io_master_hresp( HastiBus_io_master_hresp ),
       .io_slaves_1_haddr( HastiBus_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HastiBus_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HastiBus_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HastiBus_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HastiBus_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HastiBus_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HastiBus_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HastiBus_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HastiSlaveMux_1_io_ins_0_hrdata ),
       .io_slaves_1_hsel( HastiBus_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HastiBus_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HastiSlaveMux_1_io_ins_0_hreadyout ),
       .io_slaves_1_hresp( HastiSlaveMux_1_io_ins_0_hresp ),
       .io_slaves_0_haddr( HastiBus_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HastiBus_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HastiBus_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HastiBus_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HastiBus_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HastiBus_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HastiBus_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HastiBus_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HastiSlaveMux_io_ins_0_hrdata ),
       .io_slaves_0_hsel( HastiBus_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HastiBus_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HastiSlaveMux_io_ins_0_hreadyout ),
       .io_slaves_0_hresp( HastiSlaveMux_io_ins_0_hresp )
  );
  HastiBus HastiBus_1(.clk(clk), .reset(reset),
       .io_master_haddr( io_masters_1_haddr ),
       .io_master_hwrite( io_masters_1_hwrite ),
       .io_master_hsize( io_masters_1_hsize ),
       .io_master_hburst( io_masters_1_hburst ),
       .io_master_hprot( io_masters_1_hprot ),
       .io_master_htrans( io_masters_1_htrans ),
       .io_master_hmastlock( io_masters_1_hmastlock ),
       .io_master_hwdata( io_masters_1_hwdata ),
       .io_master_hrdata( HastiBus_1_io_master_hrdata ),
       .io_master_hready( HastiBus_1_io_master_hready ),
       .io_master_hresp( HastiBus_1_io_master_hresp ),
       .io_slaves_1_haddr( HastiBus_1_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HastiBus_1_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HastiBus_1_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HastiBus_1_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HastiBus_1_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HastiBus_1_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HastiBus_1_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HastiBus_1_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HastiSlaveMux_1_io_ins_1_hrdata ),
       .io_slaves_1_hsel( HastiBus_1_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HastiBus_1_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HastiSlaveMux_1_io_ins_1_hreadyout ),
       .io_slaves_1_hresp( HastiSlaveMux_1_io_ins_1_hresp ),
       .io_slaves_0_haddr( HastiBus_1_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HastiBus_1_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HastiBus_1_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HastiBus_1_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HastiBus_1_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HastiBus_1_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HastiBus_1_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HastiBus_1_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HastiSlaveMux_io_ins_1_hrdata ),
       .io_slaves_0_hsel( HastiBus_1_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HastiBus_1_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HastiSlaveMux_io_ins_1_hreadyout ),
       .io_slaves_0_hresp( HastiSlaveMux_io_ins_1_hresp )
  );
  HastiBus HastiBus_2(.clk(clk), .reset(reset),
       .io_master_haddr( io_masters_2_haddr ),
       .io_master_hwrite( io_masters_2_hwrite ),
       .io_master_hsize( io_masters_2_hsize ),
       .io_master_hburst( io_masters_2_hburst ),
       .io_master_hprot( io_masters_2_hprot ),
       .io_master_htrans( io_masters_2_htrans ),
       .io_master_hmastlock( io_masters_2_hmastlock ),
       .io_master_hwdata( io_masters_2_hwdata ),
       .io_master_hrdata( HastiBus_2_io_master_hrdata ),
       .io_master_hready( HastiBus_2_io_master_hready ),
       .io_master_hresp( HastiBus_2_io_master_hresp ),
       .io_slaves_1_haddr( HastiBus_2_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HastiBus_2_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HastiBus_2_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HastiBus_2_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HastiBus_2_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HastiBus_2_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HastiBus_2_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HastiBus_2_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HastiSlaveMux_1_io_ins_2_hrdata ),
       .io_slaves_1_hsel( HastiBus_2_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HastiBus_2_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HastiSlaveMux_1_io_ins_2_hreadyout ),
       .io_slaves_1_hresp( HastiSlaveMux_1_io_ins_2_hresp ),
       .io_slaves_0_haddr( HastiBus_2_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HastiBus_2_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HastiBus_2_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HastiBus_2_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HastiBus_2_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HastiBus_2_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HastiBus_2_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HastiBus_2_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HastiSlaveMux_io_ins_2_hrdata ),
       .io_slaves_0_hsel( HastiBus_2_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HastiBus_2_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HastiSlaveMux_io_ins_2_hreadyout ),
       .io_slaves_0_hresp( HastiSlaveMux_io_ins_2_hresp )
  );
  HastiSlaveMux HastiSlaveMux(.clk(clk), .reset(reset),
       .io_ins_2_haddr( HastiBus_2_io_slaves_0_haddr ),
       .io_ins_2_hwrite( HastiBus_2_io_slaves_0_hwrite ),
       .io_ins_2_hsize( HastiBus_2_io_slaves_0_hsize ),
       .io_ins_2_hburst( HastiBus_2_io_slaves_0_hburst ),
       .io_ins_2_hprot( HastiBus_2_io_slaves_0_hprot ),
       .io_ins_2_htrans( HastiBus_2_io_slaves_0_htrans ),
       .io_ins_2_hmastlock( HastiBus_2_io_slaves_0_hmastlock ),
       .io_ins_2_hwdata( HastiBus_2_io_slaves_0_hwdata ),
       .io_ins_2_hrdata( HastiSlaveMux_io_ins_2_hrdata ),
       .io_ins_2_hsel( HastiBus_2_io_slaves_0_hsel ),
       .io_ins_2_hreadyin( HastiBus_2_io_slaves_0_hreadyin ),
       .io_ins_2_hreadyout( HastiSlaveMux_io_ins_2_hreadyout ),
       .io_ins_2_hresp( HastiSlaveMux_io_ins_2_hresp ),
       .io_ins_1_haddr( HastiBus_1_io_slaves_0_haddr ),
       .io_ins_1_hwrite( HastiBus_1_io_slaves_0_hwrite ),
       .io_ins_1_hsize( HastiBus_1_io_slaves_0_hsize ),
       .io_ins_1_hburst( HastiBus_1_io_slaves_0_hburst ),
       .io_ins_1_hprot( HastiBus_1_io_slaves_0_hprot ),
       .io_ins_1_htrans( HastiBus_1_io_slaves_0_htrans ),
       .io_ins_1_hmastlock( HastiBus_1_io_slaves_0_hmastlock ),
       .io_ins_1_hwdata( HastiBus_1_io_slaves_0_hwdata ),
       .io_ins_1_hrdata( HastiSlaveMux_io_ins_1_hrdata ),
       .io_ins_1_hsel( HastiBus_1_io_slaves_0_hsel ),
       .io_ins_1_hreadyin( HastiBus_1_io_slaves_0_hreadyin ),
       .io_ins_1_hreadyout( HastiSlaveMux_io_ins_1_hreadyout ),
       .io_ins_1_hresp( HastiSlaveMux_io_ins_1_hresp ),
       .io_ins_0_haddr( HastiBus_io_slaves_0_haddr ),
       .io_ins_0_hwrite( HastiBus_io_slaves_0_hwrite ),
       .io_ins_0_hsize( HastiBus_io_slaves_0_hsize ),
       .io_ins_0_hburst( HastiBus_io_slaves_0_hburst ),
       .io_ins_0_hprot( HastiBus_io_slaves_0_hprot ),
       .io_ins_0_htrans( HastiBus_io_slaves_0_htrans ),
       .io_ins_0_hmastlock( HastiBus_io_slaves_0_hmastlock ),
       .io_ins_0_hwdata( HastiBus_io_slaves_0_hwdata ),
       .io_ins_0_hrdata( HastiSlaveMux_io_ins_0_hrdata ),
       .io_ins_0_hsel( HastiBus_io_slaves_0_hsel ),
       .io_ins_0_hreadyin( HastiBus_io_slaves_0_hreadyin ),
       .io_ins_0_hreadyout( HastiSlaveMux_io_ins_0_hreadyout ),
       .io_ins_0_hresp( HastiSlaveMux_io_ins_0_hresp ),
       .io_out_haddr( HastiSlaveMux_io_out_haddr ),
       .io_out_hwrite( HastiSlaveMux_io_out_hwrite ),
       .io_out_hsize( HastiSlaveMux_io_out_hsize ),
       .io_out_hburst( HastiSlaveMux_io_out_hburst ),
       .io_out_hprot( HastiSlaveMux_io_out_hprot ),
       .io_out_htrans( HastiSlaveMux_io_out_htrans ),
       .io_out_hmastlock( HastiSlaveMux_io_out_hmastlock ),
       .io_out_hwdata( HastiSlaveMux_io_out_hwdata ),
       .io_out_hrdata( io_slaves_0_hrdata ),
       .io_out_hsel( HastiSlaveMux_io_out_hsel ),
       .io_out_hreadyin( HastiSlaveMux_io_out_hreadyin ),
       .io_out_hreadyout( io_slaves_0_hreadyout ),
       .io_out_hresp( io_slaves_0_hresp )
  );
  HastiSlaveMux HastiSlaveMux_1(.clk(clk), .reset(reset),
       .io_ins_2_haddr( HastiBus_2_io_slaves_1_haddr ),
       .io_ins_2_hwrite( HastiBus_2_io_slaves_1_hwrite ),
       .io_ins_2_hsize( HastiBus_2_io_slaves_1_hsize ),
       .io_ins_2_hburst( HastiBus_2_io_slaves_1_hburst ),
       .io_ins_2_hprot( HastiBus_2_io_slaves_1_hprot ),
       .io_ins_2_htrans( HastiBus_2_io_slaves_1_htrans ),
       .io_ins_2_hmastlock( HastiBus_2_io_slaves_1_hmastlock ),
       .io_ins_2_hwdata( HastiBus_2_io_slaves_1_hwdata ),
       .io_ins_2_hrdata( HastiSlaveMux_1_io_ins_2_hrdata ),
       .io_ins_2_hsel( HastiBus_2_io_slaves_1_hsel ),
       .io_ins_2_hreadyin( HastiBus_2_io_slaves_1_hreadyin ),
       .io_ins_2_hreadyout( HastiSlaveMux_1_io_ins_2_hreadyout ),
       .io_ins_2_hresp( HastiSlaveMux_1_io_ins_2_hresp ),
       .io_ins_1_haddr( HastiBus_1_io_slaves_1_haddr ),
       .io_ins_1_hwrite( HastiBus_1_io_slaves_1_hwrite ),
       .io_ins_1_hsize( HastiBus_1_io_slaves_1_hsize ),
       .io_ins_1_hburst( HastiBus_1_io_slaves_1_hburst ),
       .io_ins_1_hprot( HastiBus_1_io_slaves_1_hprot ),
       .io_ins_1_htrans( HastiBus_1_io_slaves_1_htrans ),
       .io_ins_1_hmastlock( HastiBus_1_io_slaves_1_hmastlock ),
       .io_ins_1_hwdata( HastiBus_1_io_slaves_1_hwdata ),
       .io_ins_1_hrdata( HastiSlaveMux_1_io_ins_1_hrdata ),
       .io_ins_1_hsel( HastiBus_1_io_slaves_1_hsel ),
       .io_ins_1_hreadyin( HastiBus_1_io_slaves_1_hreadyin ),
       .io_ins_1_hreadyout( HastiSlaveMux_1_io_ins_1_hreadyout ),
       .io_ins_1_hresp( HastiSlaveMux_1_io_ins_1_hresp ),
       .io_ins_0_haddr( HastiBus_io_slaves_1_haddr ),
       .io_ins_0_hwrite( HastiBus_io_slaves_1_hwrite ),
       .io_ins_0_hsize( HastiBus_io_slaves_1_hsize ),
       .io_ins_0_hburst( HastiBus_io_slaves_1_hburst ),
       .io_ins_0_hprot( HastiBus_io_slaves_1_hprot ),
       .io_ins_0_htrans( HastiBus_io_slaves_1_htrans ),
       .io_ins_0_hmastlock( HastiBus_io_slaves_1_hmastlock ),
       .io_ins_0_hwdata( HastiBus_io_slaves_1_hwdata ),
       .io_ins_0_hrdata( HastiSlaveMux_1_io_ins_0_hrdata ),
       .io_ins_0_hsel( HastiBus_io_slaves_1_hsel ),
       .io_ins_0_hreadyin( HastiBus_io_slaves_1_hreadyin ),
       .io_ins_0_hreadyout( HastiSlaveMux_1_io_ins_0_hreadyout ),
       .io_ins_0_hresp( HastiSlaveMux_1_io_ins_0_hresp ),
       .io_out_haddr( HastiSlaveMux_1_io_out_haddr ),
       .io_out_hwrite( HastiSlaveMux_1_io_out_hwrite ),
       .io_out_hsize( HastiSlaveMux_1_io_out_hsize ),
       .io_out_hburst( HastiSlaveMux_1_io_out_hburst ),
       .io_out_hprot( HastiSlaveMux_1_io_out_hprot ),
       .io_out_htrans( HastiSlaveMux_1_io_out_htrans ),
       .io_out_hmastlock( HastiSlaveMux_1_io_out_hmastlock ),
       .io_out_hwdata( HastiSlaveMux_1_io_out_hwdata ),
       .io_out_hrdata( io_slaves_1_hrdata ),
       .io_out_hsel( HastiSlaveMux_1_io_out_hsel ),
       .io_out_hreadyin( HastiSlaveMux_1_io_out_hreadyin ),
       .io_out_hreadyout( io_slaves_1_hreadyout ),
       .io_out_hresp( io_slaves_1_hresp )
  );
endmodule

module Ahbmli(input clk, input reset,
    input [31:0] io_jtag_haddr,
    input  io_jtag_hwrite,
    input [2:0] io_jtag_hsize,
    input [2:0] io_jtag_hburst,
    input [3:0] io_jtag_hprot,
    input [1:0] io_jtag_htrans,
    input  io_jtag_hmastlock,
    input [31:0] io_jtag_hwdata,
    output[31:0] io_jtag_hrdata,
    output io_jtag_hready,
    output io_jtag_hresp,
    input [31:0] io_dmem_haddr,
    input  io_dmem_hwrite,
    input [2:0] io_dmem_hsize,
    input [2:0] io_dmem_hburst,
    input [3:0] io_dmem_hprot,
    input [1:0] io_dmem_htrans,
    input  io_dmem_hmastlock,
    input [31:0] io_dmem_hwdata,
    output[31:0] io_dmem_hrdata,
    output io_dmem_hready,
    output io_dmem_hresp,
    input [31:0] io_imem_haddr,
    input  io_imem_hwrite,
    input [2:0] io_imem_hsize,
    input [2:0] io_imem_hburst,
    input [3:0] io_imem_hprot,
    input [1:0] io_imem_htrans,
    input  io_imem_hmastlock,
    input [31:0] io_imem_hwdata,
    output[31:0] io_imem_hrdata,
    output io_imem_hready,
    output io_imem_hresp,
    output[31:0] io_datamem_haddr,
    output io_datamem_hwrite,
    output[2:0] io_datamem_hsize,
    output[2:0] io_datamem_hburst,
    output[3:0] io_datamem_hprot,
    output[1:0] io_datamem_htrans,
    output io_datamem_hmastlock,
    output[31:0] io_datamem_hwdata,
    input [31:0] io_datamem_hrdata,
    output io_datamem_hsel,
    output io_datamem_hreadyin,
    input  io_datamem_hreadyout,
    input  io_datamem_hresp,
    output[31:0] io_codemem_haddr,
    output io_codemem_hwrite,
    output[2:0] io_codemem_hsize,
    output[2:0] io_codemem_hburst,
    output[3:0] io_codemem_hprot,
    output[1:0] io_codemem_htrans,
    output io_codemem_hmastlock,
    output[31:0] io_codemem_hwdata,
    input [31:0] io_codemem_hrdata,
    output io_codemem_hsel,
    output io_codemem_hreadyin,
    input  io_codemem_hreadyout,
    input  io_codemem_hresp
);

  wire[31:0] xbar_io_masters_2_hrdata;
  wire xbar_io_masters_2_hready;
  wire xbar_io_masters_2_hresp;
  wire[31:0] xbar_io_masters_1_hrdata;
  wire xbar_io_masters_1_hready;
  wire xbar_io_masters_1_hresp;
  wire[31:0] xbar_io_masters_0_hrdata;
  wire xbar_io_masters_0_hready;
  wire xbar_io_masters_0_hresp;
  wire[31:0] xbar_io_slaves_1_haddr;
  wire xbar_io_slaves_1_hwrite;
  wire[2:0] xbar_io_slaves_1_hsize;
  wire[2:0] xbar_io_slaves_1_hburst;
  wire[3:0] xbar_io_slaves_1_hprot;
  wire[1:0] xbar_io_slaves_1_htrans;
  wire xbar_io_slaves_1_hmastlock;
  wire[31:0] xbar_io_slaves_1_hwdata;
  wire xbar_io_slaves_1_hsel;
  wire xbar_io_slaves_1_hreadyin;
  wire[31:0] xbar_io_slaves_0_haddr;
  wire xbar_io_slaves_0_hwrite;
  wire[2:0] xbar_io_slaves_0_hsize;
  wire[2:0] xbar_io_slaves_0_hburst;
  wire[3:0] xbar_io_slaves_0_hprot;
  wire[1:0] xbar_io_slaves_0_htrans;
  wire xbar_io_slaves_0_hmastlock;
  wire[31:0] xbar_io_slaves_0_hwdata;
  wire xbar_io_slaves_0_hsel;
  wire xbar_io_slaves_0_hreadyin;


  assign io_codemem_hreadyin = xbar_io_slaves_1_hreadyin;
  assign io_codemem_hsel = xbar_io_slaves_1_hsel;
  assign io_codemem_hwdata = xbar_io_slaves_1_hwdata;
  assign io_codemem_hmastlock = xbar_io_slaves_1_hmastlock;
  assign io_codemem_htrans = xbar_io_slaves_1_htrans;
  assign io_codemem_hprot = xbar_io_slaves_1_hprot;
  assign io_codemem_hburst = xbar_io_slaves_1_hburst;
  assign io_codemem_hsize = xbar_io_slaves_1_hsize;
  assign io_codemem_hwrite = xbar_io_slaves_1_hwrite;
  assign io_codemem_haddr = xbar_io_slaves_1_haddr;
  assign io_datamem_hreadyin = xbar_io_slaves_0_hreadyin;
  assign io_datamem_hsel = xbar_io_slaves_0_hsel;
  assign io_datamem_hwdata = xbar_io_slaves_0_hwdata;
  assign io_datamem_hmastlock = xbar_io_slaves_0_hmastlock;
  assign io_datamem_htrans = xbar_io_slaves_0_htrans;
  assign io_datamem_hprot = xbar_io_slaves_0_hprot;
  assign io_datamem_hburst = xbar_io_slaves_0_hburst;
  assign io_datamem_hsize = xbar_io_slaves_0_hsize;
  assign io_datamem_hwrite = xbar_io_slaves_0_hwrite;
  assign io_datamem_haddr = xbar_io_slaves_0_haddr;
  assign io_imem_hresp = xbar_io_masters_2_hresp;
  assign io_imem_hready = xbar_io_masters_2_hready;
  assign io_imem_hrdata = xbar_io_masters_2_hrdata;
  assign io_dmem_hresp = xbar_io_masters_1_hresp;
  assign io_dmem_hready = xbar_io_masters_1_hready;
  assign io_dmem_hrdata = xbar_io_masters_1_hrdata;
  assign io_jtag_hresp = xbar_io_masters_0_hresp;
  assign io_jtag_hready = xbar_io_masters_0_hready;
  assign io_jtag_hrdata = xbar_io_masters_0_hrdata;
  HastiXbar xbar(.clk(clk), .reset(reset),
       .io_masters_2_haddr( io_imem_haddr ),
       .io_masters_2_hwrite( io_imem_hwrite ),
       .io_masters_2_hsize( io_imem_hsize ),
       .io_masters_2_hburst( io_imem_hburst ),
       .io_masters_2_hprot( io_imem_hprot ),
       .io_masters_2_htrans( io_imem_htrans ),
       .io_masters_2_hmastlock( io_imem_hmastlock ),
       .io_masters_2_hwdata( io_imem_hwdata ),
       .io_masters_2_hrdata( xbar_io_masters_2_hrdata ),
       .io_masters_2_hready( xbar_io_masters_2_hready ),
       .io_masters_2_hresp( xbar_io_masters_2_hresp ),
       .io_masters_1_haddr( io_dmem_haddr ),
       .io_masters_1_hwrite( io_dmem_hwrite ),
       .io_masters_1_hsize( io_dmem_hsize ),
       .io_masters_1_hburst( io_dmem_hburst ),
       .io_masters_1_hprot( io_dmem_hprot ),
       .io_masters_1_htrans( io_dmem_htrans ),
       .io_masters_1_hmastlock( io_dmem_hmastlock ),
       .io_masters_1_hwdata( io_dmem_hwdata ),
       .io_masters_1_hrdata( xbar_io_masters_1_hrdata ),
       .io_masters_1_hready( xbar_io_masters_1_hready ),
       .io_masters_1_hresp( xbar_io_masters_1_hresp ),
       .io_masters_0_haddr( io_jtag_haddr ),
       .io_masters_0_hwrite( io_jtag_hwrite ),
       .io_masters_0_hsize( io_jtag_hsize ),
       .io_masters_0_hburst( io_jtag_hburst ),
       .io_masters_0_hprot( io_jtag_hprot ),
       .io_masters_0_htrans( io_jtag_htrans ),
       .io_masters_0_hmastlock( io_jtag_hmastlock ),
       .io_masters_0_hwdata( io_jtag_hwdata ),
       .io_masters_0_hrdata( xbar_io_masters_0_hrdata ),
       .io_masters_0_hready( xbar_io_masters_0_hready ),
       .io_masters_0_hresp( xbar_io_masters_0_hresp ),
       .io_slaves_1_haddr( xbar_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( xbar_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( xbar_io_slaves_1_hsize ),
       .io_slaves_1_hburst( xbar_io_slaves_1_hburst ),
       .io_slaves_1_hprot( xbar_io_slaves_1_hprot ),
       .io_slaves_1_htrans( xbar_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( xbar_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( xbar_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( io_codemem_hrdata ),
       .io_slaves_1_hsel( xbar_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( xbar_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( io_codemem_hreadyout ),
       .io_slaves_1_hresp( io_codemem_hresp ),
       .io_slaves_0_haddr( xbar_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( xbar_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( xbar_io_slaves_0_hsize ),
       .io_slaves_0_hburst( xbar_io_slaves_0_hburst ),
       .io_slaves_0_hprot( xbar_io_slaves_0_hprot ),
       .io_slaves_0_htrans( xbar_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( xbar_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( xbar_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( io_datamem_hrdata ),
       .io_slaves_0_hsel( xbar_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( xbar_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( io_datamem_hreadyout ),
       .io_slaves_0_hresp( io_datamem_hresp )
  );
endmodule

