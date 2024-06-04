{ ***************************************************** }
{                                                       }
{  Pascal language binding for the Capstone engine      }
{                                                       }
{  Unit Name: Capstone M680X header                     }
{     Author: Lsuper 2024.05.01                         }
{    Purpose: m680x.h                                   }
{                                                       }
{  Copyright (c) 1998-2024 Super Studio                 }
{                                                       }
{ ***************************************************** }

unit Capstone.M680X;

{$I Capstone.inc}

interface

const
  M680X_OPERAND_COUNT = 9;
  M680X_OFFSET_NONE = 0;
  M680X_OFFSET_BITS_5 = 5;
  M680X_OFFSET_BITS_8 = 8;
  M680X_OFFSET_BITS_9 = 9;
  M680X_OFFSET_BITS_16 = 16;
  M680X_IDX_INDIRECT = 1;
  M680X_IDX_NO_COMMA = 2;
  M680X_IDX_POST_INC_DEC = 4;
  M680X_FIRST_OP_IN_MNEM = 1;
  M680X_SECOND_OP_IN_MNEM = 2;

type
  /// M680X registers and special registers
  m680x_reg = Integer;
  Pm680x_reg = ^m680x_reg;

const
  M680X_REG_INVALID = 0;
  /// M6800/1/2/3/9, HD6301/9
  M680X_REG_A = 1;
  /// M6800/1/2/3/9, HD6301/9
  M680X_REG_B = 2;
  /// HD6309
  M680X_REG_E = 3;
  /// HD6309
  M680X_REG_F = 4;
  /// HD6309
  M680X_REG_0 = 5;
  /// M6801/3/9, HD6301/9
  M680X_REG_D = 6;
  /// HD6309
  M680X_REG_W = 7;
  /// M6800/1/2/3/9, M6301/9
  M680X_REG_CC = 8;
  /// M6809/M6309
  M680X_REG_DP = 9;
  /// M6309
  M680X_REG_MD = 10;
  /// M6808
  M680X_REG_HX = 11;
  /// M6808
  M680X_REG_H = 12;
  /// M6800/1/2/3/9, M6301/9
  M680X_REG_X = 13;
  /// M6809/M6309
  M680X_REG_Y = 14;
  /// M6809/M6309
  M680X_REG_S = 15;
  /// M6809/M6309
  M680X_REG_U = 16;
  /// M6309
  M680X_REG_V = 17;
  /// M6309
  M680X_REG_Q = 18;
  /// M6800/1/2/3/9, M6301/9
  M680X_REG_PC = 19;
  /// CPU12
  M680X_REG_TMP2 = 20;
  /// CPU12
  M680X_REG_TMP3 = 21;
  /// <-- mark the end of the list of registers
  M680X_REG_ENDING = 22;

/// Operand type for instruction's operands
type
  m680x_op_type = Integer;
  Pm680x_op_type = ^m680x_op_type;

const
  /// = CS_OP_INVALID (Uninitialized).
  M680X_OP_INVALID = 0;
  /// = Register operand.
  M680X_OP_REGISTER = 1;
  /// = Immediate operand.
  M680X_OP_IMMEDIATE = 2;
  /// = Indexed addressing operand.
  M680X_OP_INDEXED = 3;
  /// = Extended addressing operand.
  M680X_OP_EXTENDED = 4;
  /// = Direct addressing operand.
  M680X_OP_DIRECT = 5;
  /// = Relative addressing operand.
  M680X_OP_RELATIVE = 6;
  /// = constant operand (Displayed as number only).
  ///< Used e.g. for a bit index or page number.
  M680X_OP_CONSTANT = 7;

/// Group of M680X instructions
type
  m680x_group_type = Integer;
  Pm680x_group_type = ^m680x_group_type;

const
  M680X_GRP_INVALID = 0;
  /// = CS_GRP_JUMP
  M680X_GRP_JUMP = 1;
  /// = CS_GRP_CALL
  M680X_GRP_CALL = 2;
  /// = CS_GRP_RET
  M680X_GRP_RET = 3;
  /// = CS_GRP_INT
  M680X_GRP_INT = 4;
  /// = CS_GRP_IRET
  M680X_GRP_IRET = 5;
  /// = CS_GRP_PRIVILEDGE; not used
  M680X_GRP_PRIV = 6;
  /// = CS_GRP_BRANCH_RELATIVE
  M680X_GRP_BRAREL = 7;
  M680X_GRP_ENDING = 8;

/// M680X instruction IDs
type
  m680x_insn = Integer;
  Pm680x_insn = ^m680x_insn;

const
  M680X_INS_INVLD = 0;
  /// M6800/1/2/3
  M680X_INS_ABA = 1;
  M680X_INS_ABX = 2;
  M680X_INS_ABY = 3;
  M680X_INS_ADC = 4;
  M680X_INS_ADCA = 5;
  M680X_INS_ADCB = 6;
  M680X_INS_ADCD = 7;
  M680X_INS_ADCR = 8;
  M680X_INS_ADD = 9;
  M680X_INS_ADDA = 10;
  M680X_INS_ADDB = 11;
  M680X_INS_ADDD = 12;
  M680X_INS_ADDE = 13;
  M680X_INS_ADDF = 14;
  M680X_INS_ADDR = 15;
  M680X_INS_ADDW = 16;
  M680X_INS_AIM = 17;
  M680X_INS_AIS = 18;
  M680X_INS_AIX = 19;
  M680X_INS_AND = 20;
  M680X_INS_ANDA = 21;
  M680X_INS_ANDB = 22;
  M680X_INS_ANDCC = 23;
  M680X_INS_ANDD = 24;
  M680X_INS_ANDR = 25;
  M680X_INS_ASL = 26;
  M680X_INS_ASLA = 27;
  M680X_INS_ASLB = 28;
  /// or LSLD
  M680X_INS_ASLD = 29;
  M680X_INS_ASR = 30;
  M680X_INS_ASRA = 31;
  M680X_INS_ASRB = 32;
  M680X_INS_ASRD = 33;
  M680X_INS_ASRX = 34;
  M680X_INS_BAND = 35;
  /// or BHS
  M680X_INS_BCC = 36;
  M680X_INS_BCLR = 37;
  /// or BLO
  M680X_INS_BCS = 38;
  M680X_INS_BEOR = 39;
  M680X_INS_BEQ = 40;
  M680X_INS_BGE = 41;
  M680X_INS_BGND = 42;
  M680X_INS_BGT = 43;
  M680X_INS_BHCC = 44;
  M680X_INS_BHCS = 45;
  M680X_INS_BHI = 46;
  M680X_INS_BIAND = 47;
  M680X_INS_BIEOR = 48;
  M680X_INS_BIH = 49;
  M680X_INS_BIL = 50;
  M680X_INS_BIOR = 51;
  M680X_INS_BIT = 52;
  M680X_INS_BITA = 53;
  M680X_INS_BITB = 54;
  M680X_INS_BITD = 55;
  M680X_INS_BITMD = 56;
  M680X_INS_BLE = 57;
  M680X_INS_BLS = 58;
  M680X_INS_BLT = 59;
  M680X_INS_BMC = 60;
  M680X_INS_BMI = 61;
  M680X_INS_BMS = 62;
  M680X_INS_BNE = 63;
  M680X_INS_BOR = 64;
  M680X_INS_BPL = 65;
  M680X_INS_BRCLR = 66;
  M680X_INS_BRSET = 67;
  M680X_INS_BRA = 68;
  M680X_INS_BRN = 69;
  M680X_INS_BSET = 70;
  M680X_INS_BSR = 71;
  M680X_INS_BVC = 72;
  M680X_INS_BVS = 73;
  M680X_INS_CALL = 74;
  /// M6800/1/2/3
  M680X_INS_CBA = 75;
  M680X_INS_CBEQ = 76;
  M680X_INS_CBEQA = 77;
  M680X_INS_CBEQX = 78;
  /// M6800/1/2/3
  M680X_INS_CLC = 79;
  /// M6800/1/2/3
  M680X_INS_CLI = 80;
  M680X_INS_CLR = 81;
  M680X_INS_CLRA = 82;
  M680X_INS_CLRB = 83;
  M680X_INS_CLRD = 84;
  M680X_INS_CLRE = 85;
  M680X_INS_CLRF = 86;
  M680X_INS_CLRH = 87;
  M680X_INS_CLRW = 88;
  M680X_INS_CLRX = 89;
  /// M6800/1/2/3
  M680X_INS_CLV = 90;
  M680X_INS_CMP = 91;
  M680X_INS_CMPA = 92;
  M680X_INS_CMPB = 93;
  M680X_INS_CMPD = 94;
  M680X_INS_CMPE = 95;
  M680X_INS_CMPF = 96;
  M680X_INS_CMPR = 97;
  M680X_INS_CMPS = 98;
  M680X_INS_CMPU = 99;
  M680X_INS_CMPW = 100;
  M680X_INS_CMPX = 101;
  M680X_INS_CMPY = 102;
  M680X_INS_COM = 103;
  M680X_INS_COMA = 104;
  M680X_INS_COMB = 105;
  M680X_INS_COMD = 106;
  M680X_INS_COME = 107;
  M680X_INS_COMF = 108;
  M680X_INS_COMW = 109;
  M680X_INS_COMX = 110;
  M680X_INS_CPD = 111;
  M680X_INS_CPHX = 112;
  M680X_INS_CPS = 113;
  /// M6800/1/2/3
  M680X_INS_CPX = 114;
  M680X_INS_CPY = 115;
  M680X_INS_CWAI = 116;
  M680X_INS_DAA = 117;
  M680X_INS_DBEQ = 118;
  M680X_INS_DBNE = 119;
  M680X_INS_DBNZ = 120;
  M680X_INS_DBNZA = 121;
  M680X_INS_DBNZX = 122;
  M680X_INS_DEC = 123;
  M680X_INS_DECA = 124;
  M680X_INS_DECB = 125;
  M680X_INS_DECD = 126;
  M680X_INS_DECE = 127;
  M680X_INS_DECF = 128;
  M680X_INS_DECW = 129;
  M680X_INS_DECX = 130;
  /// M6800/1/2/3
  M680X_INS_DES = 131;
  /// M6800/1/2/3
  M680X_INS_DEX = 132;
  M680X_INS_DEY = 133;
  M680X_INS_DIV = 134;
  M680X_INS_DIVD = 135;
  M680X_INS_DIVQ = 136;
  M680X_INS_EDIV = 137;
  M680X_INS_EDIVS = 138;
  M680X_INS_EIM = 139;
  M680X_INS_EMACS = 140;
  M680X_INS_EMAXD = 141;
  M680X_INS_EMAXM = 142;
  M680X_INS_EMIND = 143;
  M680X_INS_EMINM = 144;
  M680X_INS_EMUL = 145;
  M680X_INS_EMULS = 146;
  M680X_INS_EOR = 147;
  M680X_INS_EORA = 148;
  M680X_INS_EORB = 149;
  M680X_INS_EORD = 150;
  M680X_INS_EORR = 151;
  M680X_INS_ETBL = 152;
  M680X_INS_EXG = 153;
  M680X_INS_FDIV = 154;
  M680X_INS_IBEQ = 155;
  M680X_INS_IBNE = 156;
  M680X_INS_IDIV = 157;
  M680X_INS_IDIVS = 158;
  M680X_INS_ILLGL = 159;
  M680X_INS_INC = 160;
  M680X_INS_INCA = 161;
  M680X_INS_INCB = 162;
  M680X_INS_INCD = 163;
  M680X_INS_INCE = 164;
  M680X_INS_INCF = 165;
  M680X_INS_INCW = 166;
  M680X_INS_INCX = 167;
  /// M6800/1/2/3
  M680X_INS_INS = 168;
  /// M6800/1/2/3
  M680X_INS_INX = 169;
  M680X_INS_INY = 170;
  M680X_INS_JMP = 171;
  M680X_INS_JSR = 172;
  /// or LBHS
  M680X_INS_LBCC = 173;
  /// or LBLO
  M680X_INS_LBCS = 174;
  M680X_INS_LBEQ = 175;
  M680X_INS_LBGE = 176;
  M680X_INS_LBGT = 177;
  M680X_INS_LBHI = 178;
  M680X_INS_LBLE = 179;
  M680X_INS_LBLS = 180;
  M680X_INS_LBLT = 181;
  M680X_INS_LBMI = 182;
  M680X_INS_LBNE = 183;
  M680X_INS_LBPL = 184;
  M680X_INS_LBRA = 185;
  M680X_INS_LBRN = 186;
  M680X_INS_LBSR = 187;
  M680X_INS_LBVC = 188;
  M680X_INS_LBVS = 189;
  M680X_INS_LDA = 190;
  /// M6800/1/2/3
  M680X_INS_LDAA = 191;
  /// M6800/1/2/3
  M680X_INS_LDAB = 192;
  M680X_INS_LDB = 193;
  M680X_INS_LDBT = 194;
  M680X_INS_LDD = 195;
  M680X_INS_LDE = 196;
  M680X_INS_LDF = 197;
  M680X_INS_LDHX = 198;
  M680X_INS_LDMD = 199;
  M680X_INS_LDQ = 200;
  M680X_INS_LDS = 201;
  M680X_INS_LDU = 202;
  M680X_INS_LDW = 203;
  M680X_INS_LDX = 204;
  M680X_INS_LDY = 205;
  M680X_INS_LEAS = 206;
  M680X_INS_LEAU = 207;
  M680X_INS_LEAX = 208;
  M680X_INS_LEAY = 209;
  M680X_INS_LSL = 210;
  M680X_INS_LSLA = 211;
  M680X_INS_LSLB = 212;
  M680X_INS_LSLD = 213;
  M680X_INS_LSLX = 214;
  M680X_INS_LSR = 215;
  M680X_INS_LSRA = 216;
  M680X_INS_LSRB = 217;
  /// or ASRD
  M680X_INS_LSRD = 218;
  M680X_INS_LSRW = 219;
  M680X_INS_LSRX = 220;
  M680X_INS_MAXA = 221;
  M680X_INS_MAXM = 222;
  M680X_INS_MEM = 223;
  M680X_INS_MINA = 224;
  M680X_INS_MINM = 225;
  M680X_INS_MOV = 226;
  M680X_INS_MOVB = 227;
  M680X_INS_MOVW = 228;
  M680X_INS_MUL = 229;
  M680X_INS_MULD = 230;
  M680X_INS_NEG = 231;
  M680X_INS_NEGA = 232;
  M680X_INS_NEGB = 233;
  M680X_INS_NEGD = 234;
  M680X_INS_NEGX = 235;
  M680X_INS_NOP = 236;
  M680X_INS_NSA = 237;
  M680X_INS_OIM = 238;
  M680X_INS_ORA = 239;
  /// M6800/1/2/3
  M680X_INS_ORAA = 240;
  /// M6800/1/2/3
  M680X_INS_ORAB = 241;
  M680X_INS_ORB = 242;
  M680X_INS_ORCC = 243;
  M680X_INS_ORD = 244;
  M680X_INS_ORR = 245;
  /// M6800/1/2/3
  M680X_INS_PSHA = 246;
  /// M6800/1/2/3
  M680X_INS_PSHB = 247;
  M680X_INS_PSHC = 248;
  M680X_INS_PSHD = 249;
  M680X_INS_PSHH = 250;
  M680X_INS_PSHS = 251;
  M680X_INS_PSHSW = 252;
  M680X_INS_PSHU = 253;
  M680X_INS_PSHUW = 254;
  /// M6800/1/2/3
  M680X_INS_PSHX = 255;
  M680X_INS_PSHY = 256;
  /// M6800/1/2/3
  M680X_INS_PULA = 257;
  /// M6800/1/2/3
  M680X_INS_PULB = 258;
  M680X_INS_PULC = 259;
  M680X_INS_PULD = 260;
  M680X_INS_PULH = 261;
  M680X_INS_PULS = 262;
  M680X_INS_PULSW = 263;
  M680X_INS_PULU = 264;
  M680X_INS_PULUW = 265;
  /// M6800/1/2/3
  M680X_INS_PULX = 266;
  M680X_INS_PULY = 267;
  M680X_INS_REV = 268;
  M680X_INS_REVW = 269;
  M680X_INS_ROL = 270;
  M680X_INS_ROLA = 271;
  M680X_INS_ROLB = 272;
  M680X_INS_ROLD = 273;
  M680X_INS_ROLW = 274;
  M680X_INS_ROLX = 275;
  M680X_INS_ROR = 276;
  M680X_INS_RORA = 277;
  M680X_INS_RORB = 278;
  M680X_INS_RORD = 279;
  M680X_INS_RORW = 280;
  M680X_INS_RORX = 281;
  M680X_INS_RSP = 282;
  M680X_INS_RTC = 283;
  M680X_INS_RTI = 284;
  M680X_INS_RTS = 285;
  /// M6800/1/2/3
  M680X_INS_SBA = 286;
  M680X_INS_SBC = 287;
  M680X_INS_SBCA = 288;
  M680X_INS_SBCB = 289;
  M680X_INS_SBCD = 290;
  M680X_INS_SBCR = 291;
  M680X_INS_SEC = 292;
  M680X_INS_SEI = 293;
  M680X_INS_SEV = 294;
  M680X_INS_SEX = 295;
  M680X_INS_SEXW = 296;
  M680X_INS_SLP = 297;
  M680X_INS_STA = 298;
  /// M6800/1/2/3
  M680X_INS_STAA = 299;
  /// M6800/1/2/3
  M680X_INS_STAB = 300;
  M680X_INS_STB = 301;
  M680X_INS_STBT = 302;
  M680X_INS_STD = 303;
  M680X_INS_STE = 304;
  M680X_INS_STF = 305;
  M680X_INS_STOP = 306;
  M680X_INS_STHX = 307;
  M680X_INS_STQ = 308;
  M680X_INS_STS = 309;
  M680X_INS_STU = 310;
  M680X_INS_STW = 311;
  M680X_INS_STX = 312;
  M680X_INS_STY = 313;
  M680X_INS_SUB = 314;
  M680X_INS_SUBA = 315;
  M680X_INS_SUBB = 316;
  M680X_INS_SUBD = 317;
  M680X_INS_SUBE = 318;
  M680X_INS_SUBF = 319;
  M680X_INS_SUBR = 320;
  M680X_INS_SUBW = 321;
  M680X_INS_SWI = 322;
  M680X_INS_SWI2 = 323;
  M680X_INS_SWI3 = 324;
  M680X_INS_SYNC = 325;
  /// M6800/1/2/3
  M680X_INS_TAB = 326;
  /// M6800/1/2/3
  M680X_INS_TAP = 327;
  M680X_INS_TAX = 328;
  /// M6800/1/2/3
  M680X_INS_TBA = 329;
  M680X_INS_TBEQ = 330;
  M680X_INS_TBL = 331;
  M680X_INS_TBNE = 332;
  M680X_INS_TEST = 333;
  M680X_INS_TFM = 334;
  M680X_INS_TFR = 335;
  M680X_INS_TIM = 336;
  /// M6800/1/2/3
  M680X_INS_TPA = 337;
  M680X_INS_TST = 338;
  M680X_INS_TSTA = 339;
  M680X_INS_TSTB = 340;
  M680X_INS_TSTD = 341;
  M680X_INS_TSTE = 342;
  M680X_INS_TSTF = 343;
  M680X_INS_TSTW = 344;
  M680X_INS_TSTX = 345;
  /// M6800/1/2/3
  M680X_INS_TSX = 346;
  M680X_INS_TSY = 347;
  M680X_INS_TXA = 348;
  /// M6800/1/2/3
  M680X_INS_TXS = 349;
  M680X_INS_TYS = 350;
  /// M6800/1/2/3
  M680X_INS_WAI = 351;
  M680X_INS_WAIT = 352;
  M680X_INS_WAV = 353;
  M680X_INS_WAVR = 354;
  /// HD6301
  M680X_INS_XGDX = 355;
  M680X_INS_XGDY = 356;
  M680X_INS_ENDING = 357;

type
  // Forward declarations
  Pm680x_op_idx = ^m680x_op_idx;
  Pm680x_op_rel = ^m680x_op_rel;
  Pm680x_op_ext = ^m680x_op_ext;
  Pcs_m680x_op = ^cs_m680x_op;
  Pcs_m680x = ^cs_m680x;

  /// Instruction's operand referring to indexed addressing
  m680x_op_idx = record
    /// base register (or M680X_REG_INVALID if
    ///< irrelevant)
    base_reg: m680x_reg;
    /// offset register (or M680X_REG_INVALID if
    ///< irrelevant)
    offset_reg: m680x_reg;
    /// 5-,8- or 16-bit offset. See also offset_bits.
    offset: Int16;
    /// = offset addr. if base_reg == M680X_REG_PC.
    ///< calculated as offset + PC
    offset_addr: UInt16;
    /// offset width in bits for indexed addressing
    offset_bits: UInt8;
    /// inc. or dec. value:
    ///<    0: no inc-/decrement
    ///<    1 .. 8: increment by 1 .. 8
    ///<    -1 .. -8: decrement by 1 .. 8
    ///< if flag M680X_IDX_POST_INC_DEC set it is post
    ///< inc-/decrement otherwise pre inc-/decrement
    inc_dec: Int8;
    /// 8-bit flags (see above)
    flags: UInt8;
  end;

  /// Instruction's memory operand referring to relative addressing (Bcc/LBcc)
  m680x_op_rel = record
    /// The absolute address.
    ///< calculated as PC + offset. PC is the first
    ///< address after the instruction.
    address: UInt16;
    /// the offset/displacement value
    offset: Int16;
  end;

  /// Instruction's operand referring to extended addressing
  m680x_op_ext = record
    /// The absolute address
    address: UInt16;
    /// true if extended indirect addressing
    indirect: Boolean;
  end;

  cs_m680x_op_detail = record
    case Integer of
      0: (/// immediate value for IMM operand
    imm: Int32);
      1: (/// register value for REG operand
    reg: m680x_reg);
      2: (/// Indexed addressing operand
    idx: m680x_op_idx);
      3: (/// Relative address. operand (Bcc/LBcc)
    rel: m680x_op_rel);
      4: (/// Extended address
    ext: m680x_op_ext);
      5: (///</ Direct address (lower 8-bit)
    direct_addr: UInt8);
      6: (/// constant value (bit index, page nr.)
    const_val: UInt8);
  end;

  /// Instruction operand
  cs_m680x_op = record
    type_: m680x_op_type;
    detail: cs_m680x_op_detail;
    /// size of this operand (in bytes)
    size: UInt8;
    /// How is this operand accessed? (READ, WRITE or READ|WRITE)
    /// This field is combined of cs_ac_type.
    /// NOTE: this field is irrelevant if engine is compiled in DIET
    access: UInt8;
  end;

  /// The M680X instruction and it's operands
  cs_m680x = record
    /// See: M680X instruction flags
    flags: UInt8;
    /// number of operands for the instruction or 0
    op_count: UInt8;
    /// operands for this insn.
    operands: array[0..8] of cs_m680x_op;
  end;

implementation

end.
