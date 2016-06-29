module MasterDiversion(input clk, input reset,
    input [1:0] io_in_htrans,
    input  io_in_hmastlock,
    input [31:0] io_in_haddr,
    input  io_in_hwrite,
    input [2:0] io_in_hburst,
    input [2:0] io_in_hsize,
    input [3:0] io_in_hprot,
    input [31:0] io_in_hwdata,
    output[31:0] io_in_hrdata,
    output io_in_hready,
    output io_in_hresp,
    output[1:0] io_out_htrans,
    output io_out_hmastlock,
    output[31:0] io_out_haddr,
    output io_out_hwrite,
    output[2:0] io_out_hburst,
    output[2:0] io_out_hsize,
    output[3:0] io_out_hprot,
    output[31:0] io_out_hwdata,
    input [31:0] io_out_hrdata,
    input  io_out_hready,
    input  io_out_hresp,
    input  io_divert
);

  reg  T0;
  wire T1;
  wire T2;
  wire T3;
  wire[31:0] T4;
  reg [31:0] buffer_hwdata;
  wire[31:0] T5;
  reg  full;
  wire T24;
  wire T6;
  wire T7;
  wire[3:0] T8;
  reg [3:0] buffer_hprot;
  wire[3:0] T9;
  wire[2:0] T10;
  reg [2:0] buffer_hsize;
  wire[2:0] T11;
  wire[2:0] T12;
  reg [2:0] buffer_hburst;
  wire[2:0] T13;
  wire T14;
  reg  buffer_hwrite;
  wire T15;
  wire[31:0] T16;
  reg [31:0] buffer_haddr;
  wire[31:0] T17;
  wire T18;
  reg  buffer_hmastlock;
  wire T19;
  wire[1:0] T20;
  reg [1:0] buffer_htrans;
  wire[1:0] T21;
  wire T22;
  wire T23;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    T0 = 1'b0;
    buffer_hwdata = {1{$random}};
    full = {1{$random}};
    buffer_hprot = {1{$random}};
    buffer_hsize = {1{$random}};
    buffer_hburst = {1{$random}};
    buffer_hwrite = {1{$random}};
    buffer_haddr = {1{$random}};
    buffer_hmastlock = {1{$random}};
    buffer_htrans = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T1 = T2 | reset;
  assign T2 = T3 | io_in_hready;
  assign T3 = io_divert ^ 1'h1;
  assign io_out_hwdata = T4;
  assign T4 = full ? buffer_hwdata : io_in_hwdata;
  assign T5 = io_divert ? io_in_hwdata : buffer_hwdata;
  assign T24 = reset ? 1'h0 : T6;
  assign T6 = io_divert ? 1'h1 : T7;
  assign T7 = io_out_hready ? 1'h0 : full;
  assign io_out_hprot = T8;
  assign T8 = full ? buffer_hprot : io_in_hprot;
  assign T9 = io_divert ? io_in_hprot : buffer_hprot;
  assign io_out_hsize = T10;
  assign T10 = full ? buffer_hsize : io_in_hsize;
  assign T11 = io_divert ? io_in_hsize : buffer_hsize;
  assign io_out_hburst = T12;
  assign T12 = full ? buffer_hburst : io_in_hburst;
  assign T13 = io_divert ? io_in_hburst : buffer_hburst;
  assign io_out_hwrite = T14;
  assign T14 = full ? buffer_hwrite : io_in_hwrite;
  assign T15 = io_divert ? io_in_hwrite : buffer_hwrite;
  assign io_out_haddr = T16;
  assign T16 = full ? buffer_haddr : io_in_haddr;
  assign T17 = io_divert ? io_in_haddr : buffer_haddr;
  assign io_out_hmastlock = T18;
  assign T18 = full ? buffer_hmastlock : io_in_hmastlock;
  assign T19 = io_divert ? io_in_hmastlock : buffer_hmastlock;
  assign io_out_htrans = T20;
  assign T20 = full ? buffer_htrans : io_in_htrans;
  assign T21 = io_divert ? io_in_htrans : buffer_htrans;
  assign io_in_hresp = io_out_hresp;
  assign io_in_hready = T22;
  assign T22 = io_out_hready & T23;
  assign T23 = full ^ 1'h1;
  assign io_in_hrdata = io_out_hrdata;

  always @(posedge clk) begin
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T0 <= 1'b1;
  if(!T1 && T0 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "Diverted but not ready");
    $finish;
  end
// synthesis translate_on
`endif
    if(io_divert) begin
      buffer_hwdata <= io_in_hwdata;
    end
    if(reset) begin
      full <= 1'h0;
    end else if(io_divert) begin
      full <= 1'h1;
    end else if(io_out_hready) begin
      full <= 1'h0;
    end
    if(io_divert) begin
      buffer_hprot <= io_in_hprot;
    end
    if(io_divert) begin
      buffer_hsize <= io_in_hsize;
    end
    if(io_divert) begin
      buffer_hburst <= io_in_hburst;
    end
    if(io_divert) begin
      buffer_hwrite <= io_in_hwrite;
    end
    if(io_divert) begin
      buffer_haddr <= io_in_haddr;
    end
    if(io_divert) begin
      buffer_hmastlock <= io_in_hmastlock;
    end
    if(io_divert) begin
      buffer_htrans <= io_in_htrans;
    end
  end
endmodule

module HastiXbar(input clk, input reset,
    input [1:0] io_masters_2_htrans,
    input  io_masters_2_hmastlock,
    input [31:0] io_masters_2_haddr,
    input  io_masters_2_hwrite,
    input [2:0] io_masters_2_hburst,
    input [2:0] io_masters_2_hsize,
    input [3:0] io_masters_2_hprot,
    input [31:0] io_masters_2_hwdata,
    output[31:0] io_masters_2_hrdata,
    output io_masters_2_hready,
    output io_masters_2_hresp,
    input [1:0] io_masters_1_htrans,
    input  io_masters_1_hmastlock,
    input [31:0] io_masters_1_haddr,
    input  io_masters_1_hwrite,
    input [2:0] io_masters_1_hburst,
    input [2:0] io_masters_1_hsize,
    input [3:0] io_masters_1_hprot,
    input [31:0] io_masters_1_hwdata,
    output[31:0] io_masters_1_hrdata,
    output io_masters_1_hready,
    output io_masters_1_hresp,
    input [1:0] io_masters_0_htrans,
    input  io_masters_0_hmastlock,
    input [31:0] io_masters_0_haddr,
    input  io_masters_0_hwrite,
    input [2:0] io_masters_0_hburst,
    input [2:0] io_masters_0_hsize,
    input [3:0] io_masters_0_hprot,
    input [31:0] io_masters_0_hwdata,
    output[31:0] io_masters_0_hrdata,
    output io_masters_0_hready,
    output io_masters_0_hresp,
    output[1:0] io_slaves_1_htrans,
    output io_slaves_1_hmastlock,
    output[31:0] io_slaves_1_haddr,
    output io_slaves_1_hwrite,
    output[2:0] io_slaves_1_hburst,
    output[2:0] io_slaves_1_hsize,
    output[3:0] io_slaves_1_hprot,
    output[31:0] io_slaves_1_hwdata,
    input [31:0] io_slaves_1_hrdata,
    output io_slaves_1_hsel,
    input  io_slaves_1_hready,
    input  io_slaves_1_hresp,
    output[1:0] io_slaves_0_htrans,
    output io_slaves_0_hmastlock,
    output[31:0] io_slaves_0_haddr,
    output io_slaves_0_hwrite,
    output[2:0] io_slaves_0_hburst,
    output[2:0] io_slaves_0_hsize,
    output[3:0] io_slaves_0_hprot,
    output[31:0] io_slaves_0_hwdata,
    input [31:0] io_slaves_0_hrdata,
    output io_slaves_0_hsel,
    input  io_slaves_0_hready,
    input  io_slaves_0_hresp
);

  reg  T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  reg  dataPhaseGrantSM_1_2;
  wire T326;
  wire T5;
  wire addressPhaseGrantSM_1_2;
  wire T6;
  wire T7;
  wire[2:0] T8;
  wire[2:0] T9;
  wire[2:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire isLocked;
  reg  lockedM_2;
  wire T327;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire[2:0] T19;
  wire[2:0] T20;
  wire[2:0] T21;
  wire T22;
  wire canLock;
  wire T23;
  wire T24;
  wire T25;
  wire addressPhaseGrantSM_1_1;
  wire T26;
  wire T27;
  reg  priorAddressPhaseGrantSM_1_1;
  wire addressPhaseGrantSM_1_0;
  wire T28;
  wire T29;
  reg  priorAddressPhaseGrantSM_1_0;
  wire T30;
  wire addressPhaseGrantSM_0_2;
  wire T31;
  wire T32;
  wire[2:0] T33;
  wire[2:0] T34;
  wire[2:0] T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire[3:0] T44;
  wire T45;
  wire T46;
  wire T47;
  wire[3:0] T48;
  reg  dataPhaseGrantSM_0_2;
  wire T328;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  reg  lockedM_1;
  wire T329;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire T66;
  wire[3:0] T67;
  reg  dataPhaseGrantSM_1_1;
  wire T330;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire[3:0] T72;
  reg  dataPhaseGrantSM_0_1;
  wire T331;
  wire T73;
  wire addressPhaseGrantSM_0_1;
  wire T74;
  wire T75;
  reg  priorAddressPhaseGrantSM_0_1;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire T80;
  wire T81;
  wire T82;
  reg  lockedM_0;
  wire T332;
  wire T83;
  wire T84;
  wire T85;
  wire T86;
  wire T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire[3:0] T93;
  reg  dataPhaseGrantSM_1_0;
  wire T333;
  wire T94;
  wire T95;
  wire T96;
  wire T97;
  wire[3:0] T98;
  reg  dataPhaseGrantSM_0_0;
  wire T334;
  wire T99;
  wire addressPhaseGrantSM_0_0;
  wire T100;
  wire T101;
  reg  priorAddressPhaseGrantSM_0_0;
  wire T102;
  wire T103;
  reg  priorAddressPhaseGrantSM_0_2;
  wire T104;
  reg  holdBusyS_0;
  wire T105;
  wire T106;
  wire T107;
  wire T108;
  wire T109;
  wire T110;
  wire T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire T132;
  wire T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  reg  priorAddressPhaseGrantSM_1_2;
  wire T138;
  reg  holdBusyS_1;
  wire T139;
  wire T140;
  wire T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire T147;
  reg  T148;
  reg  T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  reg  T156;
  reg  T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  reg  T164;
  reg  T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  reg  T171;
  wire T172;
  wire T173;
  wire T174;
  wire T175;
  reg  T176;
  reg  T177;
  wire T178;
  wire T179;
  wire T180;
  wire T181;
  wire T182;
  reg  T183;
  wire T184;
  wire T185;
  wire T186;
  wire T187;
  reg  T188;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire T206;
  wire[31:0] T207;
  wire[31:0] T208;
  wire[31:0] T209;
  wire T210;
  wire T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire T226;
  wire T227;
  wire[31:0] T228;
  wire[31:0] T229;
  wire[31:0] T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire T236;
  wire T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire T243;
  wire T244;
  wire T245;
  wire T246;
  wire T247;
  wire T248;
  wire[31:0] T249;
  wire[31:0] T250;
  wire[31:0] T251;
  wire T252;
  wire T253;
  wire[31:0] T254;
  wire[31:0] T255;
  wire[31:0] T256;
  wire[31:0] T257;
  wire[31:0] T258;
  wire[3:0] T259;
  wire[3:0] T260;
  wire[3:0] T261;
  wire[3:0] T262;
  wire[3:0] T263;
  wire[2:0] T264;
  wire[2:0] T265;
  wire[2:0] T266;
  wire[2:0] T267;
  wire[2:0] T268;
  wire[2:0] T269;
  wire[2:0] T270;
  wire[2:0] T271;
  wire[2:0] T272;
  wire[2:0] T273;
  wire T274;
  wire T275;
  wire T276;
  wire T277;
  wire T278;
  wire[31:0] T279;
  wire[31:0] T280;
  wire[31:0] T281;
  wire[31:0] T282;
  wire[31:0] T283;
  wire[1:0] T284;
  wire[1:0] T285;
  wire[1:0] T286;
  wire[1:0] T287;
  wire[1:0] T288;
  wire T289;
  wire T290;
  wire[31:0] T291;
  wire[31:0] T292;
  wire[31:0] T293;
  wire[31:0] T294;
  wire[31:0] T295;
  wire[3:0] T296;
  wire[3:0] T297;
  wire[3:0] T298;
  wire[3:0] T299;
  wire[3:0] T300;
  wire[2:0] T301;
  wire[2:0] T302;
  wire[2:0] T303;
  wire[2:0] T304;
  wire[2:0] T305;
  wire[2:0] T306;
  wire[2:0] T307;
  wire[2:0] T308;
  wire[2:0] T309;
  wire[2:0] T310;
  wire T311;
  wire T312;
  wire T313;
  wire T314;
  wire T315;
  wire[31:0] T316;
  wire[31:0] T317;
  wire[31:0] T318;
  wire[31:0] T319;
  wire[31:0] T320;
  wire[1:0] T321;
  wire[1:0] T322;
  wire[1:0] T323;
  wire[1:0] T324;
  wire[1:0] T325;
  wire[31:0] MasterDiversion_io_in_hrdata;
  wire MasterDiversion_io_in_hready;
  wire MasterDiversion_io_in_hresp;
  wire[1:0] MasterDiversion_io_out_htrans;
  wire MasterDiversion_io_out_hmastlock;
  wire[31:0] MasterDiversion_io_out_haddr;
  wire MasterDiversion_io_out_hwrite;
  wire[2:0] MasterDiversion_io_out_hburst;
  wire[2:0] MasterDiversion_io_out_hsize;
  wire[3:0] MasterDiversion_io_out_hprot;
  wire[31:0] MasterDiversion_io_out_hwdata;
  wire[31:0] MasterDiversion_1_io_in_hrdata;
  wire MasterDiversion_1_io_in_hready;
  wire MasterDiversion_1_io_in_hresp;
  wire[1:0] MasterDiversion_1_io_out_htrans;
  wire MasterDiversion_1_io_out_hmastlock;
  wire[31:0] MasterDiversion_1_io_out_haddr;
  wire MasterDiversion_1_io_out_hwrite;
  wire[2:0] MasterDiversion_1_io_out_hburst;
  wire[2:0] MasterDiversion_1_io_out_hsize;
  wire[3:0] MasterDiversion_1_io_out_hprot;
  wire[31:0] MasterDiversion_1_io_out_hwdata;
  wire[31:0] MasterDiversion_2_io_in_hrdata;
  wire MasterDiversion_2_io_in_hready;
  wire MasterDiversion_2_io_in_hresp;
  wire[1:0] MasterDiversion_2_io_out_htrans;
  wire MasterDiversion_2_io_out_hmastlock;
  wire[31:0] MasterDiversion_2_io_out_haddr;
  wire MasterDiversion_2_io_out_hwrite;
  wire[2:0] MasterDiversion_2_io_out_hburst;
  wire[2:0] MasterDiversion_2_io_out_hsize;
  wire[3:0] MasterDiversion_2_io_out_hprot;
  wire[31:0] MasterDiversion_2_io_out_hwdata;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    T0 = 1'b0;
    dataPhaseGrantSM_1_2 = {1{$random}};
    lockedM_2 = {1{$random}};
    priorAddressPhaseGrantSM_1_1 = {1{$random}};
    priorAddressPhaseGrantSM_1_0 = {1{$random}};
    dataPhaseGrantSM_0_2 = {1{$random}};
    lockedM_1 = {1{$random}};
    dataPhaseGrantSM_1_1 = {1{$random}};
    dataPhaseGrantSM_0_1 = {1{$random}};
    priorAddressPhaseGrantSM_0_1 = {1{$random}};
    lockedM_0 = {1{$random}};
    dataPhaseGrantSM_1_0 = {1{$random}};
    dataPhaseGrantSM_0_0 = {1{$random}};
    priorAddressPhaseGrantSM_0_0 = {1{$random}};
    priorAddressPhaseGrantSM_0_2 = {1{$random}};
    holdBusyS_0 = {1{$random}};
    priorAddressPhaseGrantSM_1_2 = {1{$random}};
    holdBusyS_1 = {1{$random}};
    T148 = 1'b0;
    T149 = 1'b0;
    T156 = 1'b0;
    T157 = 1'b0;
    T164 = 1'b0;
    T165 = 1'b0;
    T171 = 1'b0;
    T176 = 1'b0;
    T177 = 1'b0;
    T183 = 1'b0;
    T188 = 1'b0;
  end
// synthesis translate_on
`endif

  assign T1 = T2 | reset;
  assign T2 = T146 | T3;
  assign T3 = T4 ^ 1'h1;
  assign T4 = addressPhaseGrantSM_1_2 | dataPhaseGrantSM_1_2;
  assign T326 = reset ? 1'h0 : T5;
  assign T5 = io_slaves_1_hready ? addressPhaseGrantSM_1_2 : dataPhaseGrantSM_1_2;
  assign addressPhaseGrantSM_1_2 = T6;
  assign T6 = T138 ? priorAddressPhaseGrantSM_1_2 : T7;
  assign T7 = T8[2];
  assign T8 = T133 ? 3'h1 : T9;
  assign T9 = T128 ? 3'h2 : T10;
  assign T10 = T11 ? 3'h4 : 3'h0;
  assign T11 = T125 & T12;
  assign T12 = T13 ^ 1'h1;
  assign T13 = T124 & T14;
  assign T14 = isLocked | MasterDiversion_2_io_out_hmastlock;
  assign isLocked = T123 | lockedM_2;
  assign T327 = reset ? 1'h0 : T15;
  assign T15 = T22 ? T18 : T16;
  assign T16 = isLocked ? T17 : lockedM_2;
  assign T17 = lockedM_2 & MasterDiversion_2_io_out_hmastlock;
  assign T18 = T19[2];
  assign T19 = MasterDiversion_io_out_hmastlock ? 3'h1 : T20;
  assign T20 = MasterDiversion_1_io_out_hmastlock ? 3'h2 : T21;
  assign T21 = MasterDiversion_2_io_out_hmastlock ? 3'h4 : 3'h0;
  assign T22 = T122 & canLock;
  assign canLock = T23 ^ 1'h1;
  assign T23 = T30 | T24;
  assign T24 = T25 | addressPhaseGrantSM_1_2;
  assign T25 = addressPhaseGrantSM_1_0 | addressPhaseGrantSM_1_1;
  assign addressPhaseGrantSM_1_1 = T26;
  assign T26 = T138 ? priorAddressPhaseGrantSM_1_1 : T27;
  assign T27 = T8[1];
  assign addressPhaseGrantSM_1_0 = T28;
  assign T28 = T138 ? priorAddressPhaseGrantSM_1_0 : T29;
  assign T29 = T8[0];
  assign T30 = T121 | addressPhaseGrantSM_0_2;
  assign addressPhaseGrantSM_0_2 = T31;
  assign T31 = T104 ? priorAddressPhaseGrantSM_0_2 : T32;
  assign T32 = T33[2];
  assign T33 = T78 ? 3'h1 : T34;
  assign T34 = T52 ? 3'h2 : T35;
  assign T35 = T36 ? 3'h4 : 3'h0;
  assign T36 = T38 & T37;
  assign T37 = T13 ^ 1'h1;
  assign T38 = T50 & T39;
  assign T39 = T40 ^ 1'h1;
  assign T40 = T45 | T41;
  assign T41 = dataPhaseGrantSM_1_2 & T42;
  assign T42 = T43 ^ 1'h1;
  assign T43 = T44 == 4'h0;
  assign T44 = MasterDiversion_2_io_out_haddr[31:28];
  assign T45 = dataPhaseGrantSM_0_2 & T46;
  assign T46 = T47 ^ 1'h1;
  assign T47 = T48 == 4'h2;
  assign T48 = MasterDiversion_2_io_out_haddr[31:28];
  assign T328 = reset ? 1'h0 : T49;
  assign T49 = io_slaves_0_hready ? addressPhaseGrantSM_0_2 : dataPhaseGrantSM_0_2;
  assign T50 = T47 & T51;
  assign T51 = MasterDiversion_2_io_out_htrans == 2'h2;
  assign T52 = T61 & T53;
  assign T53 = T54 ^ 1'h1;
  assign T54 = T56 & T55;
  assign T55 = isLocked | MasterDiversion_1_io_out_hmastlock;
  assign T56 = lockedM_1 ^ 1'h1;
  assign T329 = reset ? 1'h0 : T57;
  assign T57 = T22 ? T60 : T58;
  assign T58 = isLocked ? T59 : lockedM_1;
  assign T59 = lockedM_1 & MasterDiversion_1_io_out_hmastlock;
  assign T60 = T19[1];
  assign T61 = T76 & T62;
  assign T62 = T63 ^ 1'h1;
  assign T63 = T69 | T64;
  assign T64 = dataPhaseGrantSM_1_1 & T65;
  assign T65 = T66 ^ 1'h1;
  assign T66 = T67 == 4'h0;
  assign T67 = MasterDiversion_1_io_out_haddr[31:28];
  assign T330 = reset ? 1'h0 : T68;
  assign T68 = io_slaves_1_hready ? addressPhaseGrantSM_1_1 : dataPhaseGrantSM_1_1;
  assign T69 = dataPhaseGrantSM_0_1 & T70;
  assign T70 = T71 ^ 1'h1;
  assign T71 = T72 == 4'h2;
  assign T72 = MasterDiversion_1_io_out_haddr[31:28];
  assign T331 = reset ? 1'h0 : T73;
  assign T73 = io_slaves_0_hready ? addressPhaseGrantSM_0_1 : dataPhaseGrantSM_0_1;
  assign addressPhaseGrantSM_0_1 = T74;
  assign T74 = T104 ? priorAddressPhaseGrantSM_0_1 : T75;
  assign T75 = T33[1];
  assign T76 = T71 & T77;
  assign T77 = MasterDiversion_1_io_out_htrans == 2'h2;
  assign T78 = T87 & T79;
  assign T79 = T80 ^ 1'h1;
  assign T80 = T82 & T81;
  assign T81 = isLocked | MasterDiversion_io_out_hmastlock;
  assign T82 = lockedM_0 ^ 1'h1;
  assign T332 = reset ? 1'h0 : T83;
  assign T83 = T22 ? T86 : T84;
  assign T84 = isLocked ? T85 : lockedM_0;
  assign T85 = lockedM_0 & MasterDiversion_io_out_hmastlock;
  assign T86 = T19[0];
  assign T87 = T102 & T88;
  assign T88 = T89 ^ 1'h1;
  assign T89 = T95 | T90;
  assign T90 = dataPhaseGrantSM_1_0 & T91;
  assign T91 = T92 ^ 1'h1;
  assign T92 = T93 == 4'h0;
  assign T93 = MasterDiversion_io_out_haddr[31:28];
  assign T333 = reset ? 1'h0 : T94;
  assign T94 = io_slaves_1_hready ? addressPhaseGrantSM_1_0 : dataPhaseGrantSM_1_0;
  assign T95 = dataPhaseGrantSM_0_0 & T96;
  assign T96 = T97 ^ 1'h1;
  assign T97 = T98 == 4'h2;
  assign T98 = MasterDiversion_io_out_haddr[31:28];
  assign T334 = reset ? 1'h0 : T99;
  assign T99 = io_slaves_0_hready ? addressPhaseGrantSM_0_0 : dataPhaseGrantSM_0_0;
  assign addressPhaseGrantSM_0_0 = T100;
  assign T100 = T104 ? priorAddressPhaseGrantSM_0_0 : T101;
  assign T101 = T33[0];
  assign T102 = T97 & T103;
  assign T103 = MasterDiversion_io_out_htrans == 2'h2;
  assign T104 = T107 | holdBusyS_0;
  assign T105 = T106 & io_slaves_0_hsel;
  assign T106 = io_slaves_0_hready ^ 1'h1;
  assign T107 = T112 | T108;
  assign T108 = priorAddressPhaseGrantSM_0_2 ? T109 : 1'h0;
  assign T109 = T111 | T110;
  assign T110 = MasterDiversion_2_io_out_htrans == 2'h3;
  assign T111 = MasterDiversion_2_io_out_htrans == 2'h1;
  assign T112 = T117 | T113;
  assign T113 = priorAddressPhaseGrantSM_0_1 ? T114 : 1'h0;
  assign T114 = T116 | T115;
  assign T115 = MasterDiversion_1_io_out_htrans == 2'h3;
  assign T116 = MasterDiversion_1_io_out_htrans == 2'h1;
  assign T117 = priorAddressPhaseGrantSM_0_0 ? T118 : 1'h0;
  assign T118 = T120 | T119;
  assign T119 = MasterDiversion_io_out_htrans == 2'h3;
  assign T120 = MasterDiversion_io_out_htrans == 2'h1;
  assign T121 = addressPhaseGrantSM_0_0 | addressPhaseGrantSM_0_1;
  assign T122 = isLocked ^ 1'h1;
  assign T123 = lockedM_0 | lockedM_1;
  assign T124 = lockedM_2 ^ 1'h1;
  assign T125 = T127 & T126;
  assign T126 = T40 ^ 1'h1;
  assign T127 = T43 & T51;
  assign T128 = T130 & T129;
  assign T129 = T54 ^ 1'h1;
  assign T130 = T132 & T131;
  assign T131 = T63 ^ 1'h1;
  assign T132 = T66 & T77;
  assign T133 = T135 & T134;
  assign T134 = T80 ^ 1'h1;
  assign T135 = T137 & T136;
  assign T136 = T89 ^ 1'h1;
  assign T137 = T92 & T103;
  assign T138 = T141 | holdBusyS_1;
  assign T139 = T140 & io_slaves_1_hsel;
  assign T140 = io_slaves_1_hready ^ 1'h1;
  assign T141 = T143 | T142;
  assign T142 = priorAddressPhaseGrantSM_1_2 ? T109 : 1'h0;
  assign T143 = T145 | T144;
  assign T144 = priorAddressPhaseGrantSM_1_1 ? T114 : 1'h0;
  assign T145 = priorAddressPhaseGrantSM_1_0 ? T118 : 1'h0;
  assign T146 = T147 ^ 1'h1;
  assign T147 = addressPhaseGrantSM_0_2 | dataPhaseGrantSM_0_2;
  assign T150 = T151 | reset;
  assign T151 = T154 | T152;
  assign T152 = T153 ^ 1'h1;
  assign T153 = addressPhaseGrantSM_1_1 | dataPhaseGrantSM_1_1;
  assign T154 = T155 ^ 1'h1;
  assign T155 = addressPhaseGrantSM_0_1 | dataPhaseGrantSM_0_1;
  assign T158 = T159 | reset;
  assign T159 = T162 | T160;
  assign T160 = T161 ^ 1'h1;
  assign T161 = addressPhaseGrantSM_1_0 | dataPhaseGrantSM_1_0;
  assign T162 = T163 ^ 1'h1;
  assign T163 = addressPhaseGrantSM_0_0 | dataPhaseGrantSM_0_0;
  assign T166 = T167 | reset;
  assign T167 = T169 | T168;
  assign T168 = addressPhaseGrantSM_1_2 ^ 1'h1;
  assign T169 = T170 ^ 1'h1;
  assign T170 = addressPhaseGrantSM_1_0 | addressPhaseGrantSM_1_1;
  assign T172 = T173 | reset;
  assign T173 = T175 | T174;
  assign T174 = addressPhaseGrantSM_1_1 ^ 1'h1;
  assign T175 = addressPhaseGrantSM_1_0 ^ 1'h1;
  assign T178 = T179 | reset;
  assign T179 = T181 | T180;
  assign T180 = addressPhaseGrantSM_0_2 ^ 1'h1;
  assign T181 = T182 ^ 1'h1;
  assign T182 = addressPhaseGrantSM_0_0 | addressPhaseGrantSM_0_1;
  assign T184 = T185 | reset;
  assign T185 = T187 | T186;
  assign T186 = addressPhaseGrantSM_0_1 ^ 1'h1;
  assign T187 = addressPhaseGrantSM_0_0 ^ 1'h1;
  assign T189 = T202 & T190;
  assign T190 = T197 ^ T191;
  assign T191 = T195 | T192;
  assign T192 = T194 | T193;
  assign T193 = MasterDiversion_2_io_out_htrans == 2'h1;
  assign T194 = MasterDiversion_2_io_out_htrans == 2'h0;
  assign T195 = T196 ^ 1'h1;
  assign T196 = T47 | T43;
  assign T197 = T200 | T198;
  assign T198 = T4 ? T199 : 1'h0;
  assign T199 = io_slaves_1_hready ^ T191;
  assign T200 = T147 ? T201 : 1'h0;
  assign T201 = io_slaves_0_hready ^ T191;
  assign T202 = T203 & T51;
  assign T203 = T40 | T13;
  assign T204 = T206 | T205;
  assign T205 = T4 ? io_slaves_1_hresp : 1'h0;
  assign T206 = T147 ? io_slaves_0_hresp : 1'h0;
  assign T207 = T209 | T208;
  assign T208 = T4 ? io_slaves_1_hrdata : 32'h0;
  assign T209 = T147 ? io_slaves_0_hrdata : 32'h0;
  assign T210 = T223 & T211;
  assign T211 = T218 ^ T212;
  assign T212 = T216 | T213;
  assign T213 = T215 | T214;
  assign T214 = MasterDiversion_1_io_out_htrans == 2'h1;
  assign T215 = MasterDiversion_1_io_out_htrans == 2'h0;
  assign T216 = T217 ^ 1'h1;
  assign T217 = T71 | T66;
  assign T218 = T221 | T219;
  assign T219 = T153 ? T220 : 1'h0;
  assign T220 = io_slaves_1_hready ^ T212;
  assign T221 = T155 ? T222 : 1'h0;
  assign T222 = io_slaves_0_hready ^ T212;
  assign T223 = T224 & T77;
  assign T224 = T63 | T54;
  assign T225 = T227 | T226;
  assign T226 = T153 ? io_slaves_1_hresp : 1'h0;
  assign T227 = T155 ? io_slaves_0_hresp : 1'h0;
  assign T228 = T230 | T229;
  assign T229 = T153 ? io_slaves_1_hrdata : 32'h0;
  assign T230 = T155 ? io_slaves_0_hrdata : 32'h0;
  assign T231 = T244 & T232;
  assign T232 = T239 ^ T233;
  assign T233 = T237 | T234;
  assign T234 = T236 | T235;
  assign T235 = MasterDiversion_io_out_htrans == 2'h1;
  assign T236 = MasterDiversion_io_out_htrans == 2'h0;
  assign T237 = T238 ^ 1'h1;
  assign T238 = T97 | T92;
  assign T239 = T242 | T240;
  assign T240 = T161 ? T241 : 1'h0;
  assign T241 = io_slaves_1_hready ^ T233;
  assign T242 = T163 ? T243 : 1'h0;
  assign T243 = io_slaves_0_hready ^ T233;
  assign T244 = T245 & T103;
  assign T245 = T89 | T80;
  assign T246 = T248 | T247;
  assign T247 = T161 ? io_slaves_1_hresp : 1'h0;
  assign T248 = T163 ? io_slaves_0_hresp : 1'h0;
  assign T249 = T251 | T250;
  assign T250 = T161 ? io_slaves_1_hrdata : 32'h0;
  assign T251 = T163 ? io_slaves_0_hrdata : 32'h0;
  assign io_slaves_0_hsel = T252;
  assign T252 = T253 | addressPhaseGrantSM_0_2;
  assign T253 = addressPhaseGrantSM_0_0 | addressPhaseGrantSM_0_1;
  assign io_slaves_0_hwdata = T254;
  assign T254 = T256 | T255;
  assign T255 = dataPhaseGrantSM_0_2 ? MasterDiversion_2_io_out_hwdata : 32'h0;
  assign T256 = T258 | T257;
  assign T257 = dataPhaseGrantSM_0_1 ? MasterDiversion_1_io_out_hwdata : 32'h0;
  assign T258 = dataPhaseGrantSM_0_0 ? MasterDiversion_io_out_hwdata : 32'h0;
  assign io_slaves_0_hprot = T259;
  assign T259 = T261 | T260;
  assign T260 = addressPhaseGrantSM_0_2 ? MasterDiversion_2_io_out_hprot : 4'h0;
  assign T261 = T263 | T262;
  assign T262 = addressPhaseGrantSM_0_1 ? MasterDiversion_1_io_out_hprot : 4'h0;
  assign T263 = addressPhaseGrantSM_0_0 ? MasterDiversion_io_out_hprot : 4'h0;
  assign io_slaves_0_hsize = T264;
  assign T264 = T266 | T265;
  assign T265 = addressPhaseGrantSM_0_2 ? MasterDiversion_2_io_out_hsize : 3'h0;
  assign T266 = T268 | T267;
  assign T267 = addressPhaseGrantSM_0_1 ? MasterDiversion_1_io_out_hsize : 3'h0;
  assign T268 = addressPhaseGrantSM_0_0 ? MasterDiversion_io_out_hsize : 3'h0;
  assign io_slaves_0_hburst = T269;
  assign T269 = T271 | T270;
  assign T270 = addressPhaseGrantSM_0_2 ? MasterDiversion_2_io_out_hburst : 3'h0;
  assign T271 = T273 | T272;
  assign T272 = addressPhaseGrantSM_0_1 ? MasterDiversion_1_io_out_hburst : 3'h0;
  assign T273 = addressPhaseGrantSM_0_0 ? MasterDiversion_io_out_hburst : 3'h0;
  assign io_slaves_0_hwrite = T274;
  assign T274 = T276 | T275;
  assign T275 = addressPhaseGrantSM_0_2 ? MasterDiversion_2_io_out_hwrite : 1'h0;
  assign T276 = T278 | T277;
  assign T277 = addressPhaseGrantSM_0_1 ? MasterDiversion_1_io_out_hwrite : 1'h0;
  assign T278 = addressPhaseGrantSM_0_0 ? MasterDiversion_io_out_hwrite : 1'h0;
  assign io_slaves_0_haddr = T279;
  assign T279 = T281 | T280;
  assign T280 = addressPhaseGrantSM_0_2 ? MasterDiversion_2_io_out_haddr : 32'h0;
  assign T281 = T283 | T282;
  assign T282 = addressPhaseGrantSM_0_1 ? MasterDiversion_1_io_out_haddr : 32'h0;
  assign T283 = addressPhaseGrantSM_0_0 ? MasterDiversion_io_out_haddr : 32'h0;
  assign io_slaves_0_hmastlock = isLocked;
  assign io_slaves_0_htrans = T284;
  assign T284 = T286 | T285;
  assign T285 = addressPhaseGrantSM_0_2 ? MasterDiversion_2_io_out_htrans : 2'h0;
  assign T286 = T288 | T287;
  assign T287 = addressPhaseGrantSM_0_1 ? MasterDiversion_1_io_out_htrans : 2'h0;
  assign T288 = addressPhaseGrantSM_0_0 ? MasterDiversion_io_out_htrans : 2'h0;
  assign io_slaves_1_hsel = T289;
  assign T289 = T290 | addressPhaseGrantSM_1_2;
  assign T290 = addressPhaseGrantSM_1_0 | addressPhaseGrantSM_1_1;
  assign io_slaves_1_hwdata = T291;
  assign T291 = T293 | T292;
  assign T292 = dataPhaseGrantSM_1_2 ? MasterDiversion_2_io_out_hwdata : 32'h0;
  assign T293 = T295 | T294;
  assign T294 = dataPhaseGrantSM_1_1 ? MasterDiversion_1_io_out_hwdata : 32'h0;
  assign T295 = dataPhaseGrantSM_1_0 ? MasterDiversion_io_out_hwdata : 32'h0;
  assign io_slaves_1_hprot = T296;
  assign T296 = T298 | T297;
  assign T297 = addressPhaseGrantSM_1_2 ? MasterDiversion_2_io_out_hprot : 4'h0;
  assign T298 = T300 | T299;
  assign T299 = addressPhaseGrantSM_1_1 ? MasterDiversion_1_io_out_hprot : 4'h0;
  assign T300 = addressPhaseGrantSM_1_0 ? MasterDiversion_io_out_hprot : 4'h0;
  assign io_slaves_1_hsize = T301;
  assign T301 = T303 | T302;
  assign T302 = addressPhaseGrantSM_1_2 ? MasterDiversion_2_io_out_hsize : 3'h0;
  assign T303 = T305 | T304;
  assign T304 = addressPhaseGrantSM_1_1 ? MasterDiversion_1_io_out_hsize : 3'h0;
  assign T305 = addressPhaseGrantSM_1_0 ? MasterDiversion_io_out_hsize : 3'h0;
  assign io_slaves_1_hburst = T306;
  assign T306 = T308 | T307;
  assign T307 = addressPhaseGrantSM_1_2 ? MasterDiversion_2_io_out_hburst : 3'h0;
  assign T308 = T310 | T309;
  assign T309 = addressPhaseGrantSM_1_1 ? MasterDiversion_1_io_out_hburst : 3'h0;
  assign T310 = addressPhaseGrantSM_1_0 ? MasterDiversion_io_out_hburst : 3'h0;
  assign io_slaves_1_hwrite = T311;
  assign T311 = T313 | T312;
  assign T312 = addressPhaseGrantSM_1_2 ? MasterDiversion_2_io_out_hwrite : 1'h0;
  assign T313 = T315 | T314;
  assign T314 = addressPhaseGrantSM_1_1 ? MasterDiversion_1_io_out_hwrite : 1'h0;
  assign T315 = addressPhaseGrantSM_1_0 ? MasterDiversion_io_out_hwrite : 1'h0;
  assign io_slaves_1_haddr = T316;
  assign T316 = T318 | T317;
  assign T317 = addressPhaseGrantSM_1_2 ? MasterDiversion_2_io_out_haddr : 32'h0;
  assign T318 = T320 | T319;
  assign T319 = addressPhaseGrantSM_1_1 ? MasterDiversion_1_io_out_haddr : 32'h0;
  assign T320 = addressPhaseGrantSM_1_0 ? MasterDiversion_io_out_haddr : 32'h0;
  assign io_slaves_1_hmastlock = isLocked;
  assign io_slaves_1_htrans = T321;
  assign T321 = T323 | T322;
  assign T322 = addressPhaseGrantSM_1_2 ? MasterDiversion_2_io_out_htrans : 2'h0;
  assign T323 = T325 | T324;
  assign T324 = addressPhaseGrantSM_1_1 ? MasterDiversion_1_io_out_htrans : 2'h0;
  assign T325 = addressPhaseGrantSM_1_0 ? MasterDiversion_io_out_htrans : 2'h0;
  assign io_masters_0_hresp = MasterDiversion_io_in_hresp;
  assign io_masters_0_hready = MasterDiversion_io_in_hready;
  assign io_masters_0_hrdata = MasterDiversion_io_in_hrdata;
  assign io_masters_1_hresp = MasterDiversion_1_io_in_hresp;
  assign io_masters_1_hready = MasterDiversion_1_io_in_hready;
  assign io_masters_1_hrdata = MasterDiversion_1_io_in_hrdata;
  assign io_masters_2_hresp = MasterDiversion_2_io_in_hresp;
  assign io_masters_2_hready = MasterDiversion_2_io_in_hready;
  assign io_masters_2_hrdata = MasterDiversion_2_io_in_hrdata;
  MasterDiversion MasterDiversion(.clk(clk), .reset(reset),
       .io_in_htrans( io_masters_0_htrans ),
       .io_in_hmastlock( io_masters_0_hmastlock ),
       .io_in_haddr( io_masters_0_haddr ),
       .io_in_hwrite( io_masters_0_hwrite ),
       .io_in_hburst( io_masters_0_hburst ),
       .io_in_hsize( io_masters_0_hsize ),
       .io_in_hprot( io_masters_0_hprot ),
       .io_in_hwdata( io_masters_0_hwdata ),
       .io_in_hrdata( MasterDiversion_io_in_hrdata ),
       .io_in_hready( MasterDiversion_io_in_hready ),
       .io_in_hresp( MasterDiversion_io_in_hresp ),
       .io_out_htrans( MasterDiversion_io_out_htrans ),
       .io_out_hmastlock( MasterDiversion_io_out_hmastlock ),
       .io_out_haddr( MasterDiversion_io_out_haddr ),
       .io_out_hwrite( MasterDiversion_io_out_hwrite ),
       .io_out_hburst( MasterDiversion_io_out_hburst ),
       .io_out_hsize( MasterDiversion_io_out_hsize ),
       .io_out_hprot( MasterDiversion_io_out_hprot ),
       .io_out_hwdata( MasterDiversion_io_out_hwdata ),
       .io_out_hrdata( T249 ),
       .io_out_hready( T232 ),
       .io_out_hresp( T246 ),
       .io_divert( T231 )
  );
  MasterDiversion MasterDiversion_1(.clk(clk), .reset(reset),
       .io_in_htrans( io_masters_1_htrans ),
       .io_in_hmastlock( io_masters_1_hmastlock ),
       .io_in_haddr( io_masters_1_haddr ),
       .io_in_hwrite( io_masters_1_hwrite ),
       .io_in_hburst( io_masters_1_hburst ),
       .io_in_hsize( io_masters_1_hsize ),
       .io_in_hprot( io_masters_1_hprot ),
       .io_in_hwdata( io_masters_1_hwdata ),
       .io_in_hrdata( MasterDiversion_1_io_in_hrdata ),
       .io_in_hready( MasterDiversion_1_io_in_hready ),
       .io_in_hresp( MasterDiversion_1_io_in_hresp ),
       .io_out_htrans( MasterDiversion_1_io_out_htrans ),
       .io_out_hmastlock( MasterDiversion_1_io_out_hmastlock ),
       .io_out_haddr( MasterDiversion_1_io_out_haddr ),
       .io_out_hwrite( MasterDiversion_1_io_out_hwrite ),
       .io_out_hburst( MasterDiversion_1_io_out_hburst ),
       .io_out_hsize( MasterDiversion_1_io_out_hsize ),
       .io_out_hprot( MasterDiversion_1_io_out_hprot ),
       .io_out_hwdata( MasterDiversion_1_io_out_hwdata ),
       .io_out_hrdata( T228 ),
       .io_out_hready( T211 ),
       .io_out_hresp( T225 ),
       .io_divert( T210 )
  );
  MasterDiversion MasterDiversion_2(.clk(clk), .reset(reset),
       .io_in_htrans( io_masters_2_htrans ),
       .io_in_hmastlock( io_masters_2_hmastlock ),
       .io_in_haddr( io_masters_2_haddr ),
       .io_in_hwrite( io_masters_2_hwrite ),
       .io_in_hburst( io_masters_2_hburst ),
       .io_in_hsize( io_masters_2_hsize ),
       .io_in_hprot( io_masters_2_hprot ),
       .io_in_hwdata( io_masters_2_hwdata ),
       .io_in_hrdata( MasterDiversion_2_io_in_hrdata ),
       .io_in_hready( MasterDiversion_2_io_in_hready ),
       .io_in_hresp( MasterDiversion_2_io_in_hresp ),
       .io_out_htrans( MasterDiversion_2_io_out_htrans ),
       .io_out_hmastlock( MasterDiversion_2_io_out_hmastlock ),
       .io_out_haddr( MasterDiversion_2_io_out_haddr ),
       .io_out_hwrite( MasterDiversion_2_io_out_hwrite ),
       .io_out_hburst( MasterDiversion_2_io_out_hburst ),
       .io_out_hsize( MasterDiversion_2_io_out_hsize ),
       .io_out_hprot( MasterDiversion_2_io_out_hprot ),
       .io_out_hwdata( MasterDiversion_2_io_out_hwdata ),
       .io_out_hrdata( T207 ),
       .io_out_hready( T190 ),
       .io_out_hresp( T204 ),
       .io_divert( T189 )
  );

  always @(posedge clk) begin
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T188 <= 1'b1;
  if(!1'h1 && T188 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T183 <= 1'b1;
  if(!T184 && T183 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T177 <= 1'b1;
  if(!T178 && T177 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T176 <= 1'b1;
  if(!1'h1 && T176 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T171 <= 1'b1;
  if(!T172 && T171 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T165 <= 1'b1;
  if(!T166 && T165 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T164 <= 1'b1;
  if(!1'h1 && T164 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T157 <= 1'b1;
  if(!T158 && T157 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T156 <= 1'b1;
  if(!1'h1 && T156 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T149 <= 1'b1;
  if(!T150 && T149 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T148 <= 1'b1;
  if(!1'h1 && T148 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T0 <= 1'b1;
  if(!T1 && T0 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "");
    $finish;
  end
// synthesis translate_on
`endif
    if(reset) begin
      dataPhaseGrantSM_1_2 <= 1'h0;
    end else if(io_slaves_1_hready) begin
      dataPhaseGrantSM_1_2 <= addressPhaseGrantSM_1_2;
    end
    if(reset) begin
      lockedM_2 <= 1'h0;
    end else if(T22) begin
      lockedM_2 <= T18;
    end else if(isLocked) begin
      lockedM_2 <= T17;
    end
    priorAddressPhaseGrantSM_1_1 <= addressPhaseGrantSM_1_1;
    priorAddressPhaseGrantSM_1_0 <= addressPhaseGrantSM_1_0;
    if(reset) begin
      dataPhaseGrantSM_0_2 <= 1'h0;
    end else if(io_slaves_0_hready) begin
      dataPhaseGrantSM_0_2 <= addressPhaseGrantSM_0_2;
    end
    if(reset) begin
      lockedM_1 <= 1'h0;
    end else if(T22) begin
      lockedM_1 <= T60;
    end else if(isLocked) begin
      lockedM_1 <= T59;
    end
    if(reset) begin
      dataPhaseGrantSM_1_1 <= 1'h0;
    end else if(io_slaves_1_hready) begin
      dataPhaseGrantSM_1_1 <= addressPhaseGrantSM_1_1;
    end
    if(reset) begin
      dataPhaseGrantSM_0_1 <= 1'h0;
    end else if(io_slaves_0_hready) begin
      dataPhaseGrantSM_0_1 <= addressPhaseGrantSM_0_1;
    end
    priorAddressPhaseGrantSM_0_1 <= addressPhaseGrantSM_0_1;
    if(reset) begin
      lockedM_0 <= 1'h0;
    end else if(T22) begin
      lockedM_0 <= T86;
    end else if(isLocked) begin
      lockedM_0 <= T85;
    end
    if(reset) begin
      dataPhaseGrantSM_1_0 <= 1'h0;
    end else if(io_slaves_1_hready) begin
      dataPhaseGrantSM_1_0 <= addressPhaseGrantSM_1_0;
    end
    if(reset) begin
      dataPhaseGrantSM_0_0 <= 1'h0;
    end else if(io_slaves_0_hready) begin
      dataPhaseGrantSM_0_0 <= addressPhaseGrantSM_0_0;
    end
    priorAddressPhaseGrantSM_0_0 <= addressPhaseGrantSM_0_0;
    priorAddressPhaseGrantSM_0_2 <= addressPhaseGrantSM_0_2;
    holdBusyS_0 <= T105;
    priorAddressPhaseGrantSM_1_2 <= addressPhaseGrantSM_1_2;
    holdBusyS_1 <= T139;
  end
endmodule

module Ahbmli(input clk, input reset,
    input [1:0] io_jtag_htrans,
    input  io_jtag_hmastlock,
    input [31:0] io_jtag_haddr,
    input  io_jtag_hwrite,
    input [2:0] io_jtag_hburst,
    input [2:0] io_jtag_hsize,
    input [3:0] io_jtag_hprot,
    input [31:0] io_jtag_hwdata,
    output[31:0] io_jtag_hrdata,
    output io_jtag_hready,
    output io_jtag_hresp,
    input [1:0] io_dmem_htrans,
    input  io_dmem_hmastlock,
    input [31:0] io_dmem_haddr,
    input  io_dmem_hwrite,
    input [2:0] io_dmem_hburst,
    input [2:0] io_dmem_hsize,
    input [3:0] io_dmem_hprot,
    input [31:0] io_dmem_hwdata,
    output[31:0] io_dmem_hrdata,
    output io_dmem_hready,
    output io_dmem_hresp,
    input [1:0] io_imem_htrans,
    input  io_imem_hmastlock,
    input [31:0] io_imem_haddr,
    input  io_imem_hwrite,
    input [2:0] io_imem_hburst,
    input [2:0] io_imem_hsize,
    input [3:0] io_imem_hprot,
    input [31:0] io_imem_hwdata,
    output[31:0] io_imem_hrdata,
    output io_imem_hready,
    output io_imem_hresp,
    output[1:0] io_datamem_htrans,
    output io_datamem_hmastlock,
    output[31:0] io_datamem_haddr,
    output io_datamem_hwrite,
    output[2:0] io_datamem_hburst,
    output[2:0] io_datamem_hsize,
    output[3:0] io_datamem_hprot,
    output[31:0] io_datamem_hwdata,
    input [31:0] io_datamem_hrdata,
    output io_datamem_hsel,
    input  io_datamem_hready,
    input  io_datamem_hresp,
    output[1:0] io_codemem_htrans,
    output io_codemem_hmastlock,
    output[31:0] io_codemem_haddr,
    output io_codemem_hwrite,
    output[2:0] io_codemem_hburst,
    output[2:0] io_codemem_hsize,
    output[3:0] io_codemem_hprot,
    output[31:0] io_codemem_hwdata,
    input [31:0] io_codemem_hrdata,
    output io_codemem_hsel,
    input  io_codemem_hready,
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
  wire[1:0] xbar_io_slaves_1_htrans;
  wire xbar_io_slaves_1_hmastlock;
  wire[31:0] xbar_io_slaves_1_haddr;
  wire xbar_io_slaves_1_hwrite;
  wire[2:0] xbar_io_slaves_1_hburst;
  wire[2:0] xbar_io_slaves_1_hsize;
  wire[3:0] xbar_io_slaves_1_hprot;
  wire[31:0] xbar_io_slaves_1_hwdata;
  wire xbar_io_slaves_1_hsel;
  wire[1:0] xbar_io_slaves_0_htrans;
  wire xbar_io_slaves_0_hmastlock;
  wire[31:0] xbar_io_slaves_0_haddr;
  wire xbar_io_slaves_0_hwrite;
  wire[2:0] xbar_io_slaves_0_hburst;
  wire[2:0] xbar_io_slaves_0_hsize;
  wire[3:0] xbar_io_slaves_0_hprot;
  wire[31:0] xbar_io_slaves_0_hwdata;
  wire xbar_io_slaves_0_hsel;


  assign io_codemem_hsel = xbar_io_slaves_1_hsel;
  assign io_codemem_hwdata = xbar_io_slaves_1_hwdata;
  assign io_codemem_hprot = xbar_io_slaves_1_hprot;
  assign io_codemem_hsize = xbar_io_slaves_1_hsize;
  assign io_codemem_hburst = xbar_io_slaves_1_hburst;
  assign io_codemem_hwrite = xbar_io_slaves_1_hwrite;
  assign io_codemem_haddr = xbar_io_slaves_1_haddr;
  assign io_codemem_hmastlock = xbar_io_slaves_1_hmastlock;
  assign io_codemem_htrans = xbar_io_slaves_1_htrans;
  assign io_datamem_hsel = xbar_io_slaves_0_hsel;
  assign io_datamem_hwdata = xbar_io_slaves_0_hwdata;
  assign io_datamem_hprot = xbar_io_slaves_0_hprot;
  assign io_datamem_hsize = xbar_io_slaves_0_hsize;
  assign io_datamem_hburst = xbar_io_slaves_0_hburst;
  assign io_datamem_hwrite = xbar_io_slaves_0_hwrite;
  assign io_datamem_haddr = xbar_io_slaves_0_haddr;
  assign io_datamem_hmastlock = xbar_io_slaves_0_hmastlock;
  assign io_datamem_htrans = xbar_io_slaves_0_htrans;
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
       .io_masters_2_htrans( io_imem_htrans ),
       .io_masters_2_hmastlock( io_imem_hmastlock ),
       .io_masters_2_haddr( io_imem_haddr ),
       .io_masters_2_hwrite( io_imem_hwrite ),
       .io_masters_2_hburst( io_imem_hburst ),
       .io_masters_2_hsize( io_imem_hsize ),
       .io_masters_2_hprot( io_imem_hprot ),
       .io_masters_2_hwdata( io_imem_hwdata ),
       .io_masters_2_hrdata( xbar_io_masters_2_hrdata ),
       .io_masters_2_hready( xbar_io_masters_2_hready ),
       .io_masters_2_hresp( xbar_io_masters_2_hresp ),
       .io_masters_1_htrans( io_dmem_htrans ),
       .io_masters_1_hmastlock( io_dmem_hmastlock ),
       .io_masters_1_haddr( io_dmem_haddr ),
       .io_masters_1_hwrite( io_dmem_hwrite ),
       .io_masters_1_hburst( io_dmem_hburst ),
       .io_masters_1_hsize( io_dmem_hsize ),
       .io_masters_1_hprot( io_dmem_hprot ),
       .io_masters_1_hwdata( io_dmem_hwdata ),
       .io_masters_1_hrdata( xbar_io_masters_1_hrdata ),
       .io_masters_1_hready( xbar_io_masters_1_hready ),
       .io_masters_1_hresp( xbar_io_masters_1_hresp ),
       .io_masters_0_htrans( io_jtag_htrans ),
       .io_masters_0_hmastlock( io_jtag_hmastlock ),
       .io_masters_0_haddr( io_jtag_haddr ),
       .io_masters_0_hwrite( io_jtag_hwrite ),
       .io_masters_0_hburst( io_jtag_hburst ),
       .io_masters_0_hsize( io_jtag_hsize ),
       .io_masters_0_hprot( io_jtag_hprot ),
       .io_masters_0_hwdata( io_jtag_hwdata ),
       .io_masters_0_hrdata( xbar_io_masters_0_hrdata ),
       .io_masters_0_hready( xbar_io_masters_0_hready ),
       .io_masters_0_hresp( xbar_io_masters_0_hresp ),
       .io_slaves_1_htrans( xbar_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( xbar_io_slaves_1_hmastlock ),
       .io_slaves_1_haddr( xbar_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( xbar_io_slaves_1_hwrite ),
       .io_slaves_1_hburst( xbar_io_slaves_1_hburst ),
       .io_slaves_1_hsize( xbar_io_slaves_1_hsize ),
       .io_slaves_1_hprot( xbar_io_slaves_1_hprot ),
       .io_slaves_1_hwdata( xbar_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( io_codemem_hrdata ),
       .io_slaves_1_hsel( xbar_io_slaves_1_hsel ),
       .io_slaves_1_hready( io_codemem_hready ),
       .io_slaves_1_hresp( io_codemem_hresp ),
       .io_slaves_0_htrans( xbar_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( xbar_io_slaves_0_hmastlock ),
       .io_slaves_0_haddr( xbar_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( xbar_io_slaves_0_hwrite ),
       .io_slaves_0_hburst( xbar_io_slaves_0_hburst ),
       .io_slaves_0_hsize( xbar_io_slaves_0_hsize ),
       .io_slaves_0_hprot( xbar_io_slaves_0_hprot ),
       .io_slaves_0_hwdata( xbar_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( io_datamem_hrdata ),
       .io_slaves_0_hsel( xbar_io_slaves_0_hsel ),
       .io_slaves_0_hready( io_datamem_hready ),
       .io_slaves_0_hresp( io_datamem_hresp )
  );
endmodule

