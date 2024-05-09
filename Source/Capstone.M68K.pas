{ ***************************************************** }
{                                                       }
{  Pascal language binding for the Capstone engine      }
{                                                       }
{  Unit Name: Capstone M68K header                      }
{     Author: Lsuper 2024.05.01                         }
{    Purpose: m68k.h                                    }
{                                                       }
{  Copyright (c) 1998-2024 Super Studio                 }
{                                                       }
{ ***************************************************** }

unit Capstone.M68K;

{$I Capstone.inc}

{$MINENUMSIZE 4}

interface

const
  M68K_OPERAND_COUNT = 4;

type
  /// M68K registers and special registers
  m68k_reg = Integer;
  Pm68k_reg = ^m68k_reg;

const
  M68K_REG_INVALID = 0;
  M68K_REG_D0 = 1;
  M68K_REG_D1 = 2;
  M68K_REG_D2 = 3;
  M68K_REG_D3 = 4;
  M68K_REG_D4 = 5;
  M68K_REG_D5 = 6;
  M68K_REG_D6 = 7;
  M68K_REG_D7 = 8;
  M68K_REG_A0 = 9;
  M68K_REG_A1 = 10;
  M68K_REG_A2 = 11;
  M68K_REG_A3 = 12;
  M68K_REG_A4 = 13;
  M68K_REG_A5 = 14;
  M68K_REG_A6 = 15;
  M68K_REG_A7 = 16;
  M68K_REG_FP0 = 17;
  M68K_REG_FP1 = 18;
  M68K_REG_FP2 = 19;
  M68K_REG_FP3 = 20;
  M68K_REG_FP4 = 21;
  M68K_REG_FP5 = 22;
  M68K_REG_FP6 = 23;
  M68K_REG_FP7 = 24;
  M68K_REG_PC = 25;
  M68K_REG_SR = 26;
  M68K_REG_CCR = 27;
  M68K_REG_SFC = 28;
  M68K_REG_DFC = 29;
  M68K_REG_USP = 30;
  M68K_REG_VBR = 31;
  M68K_REG_CACR = 32;
  M68K_REG_CAAR = 33;
  M68K_REG_MSP = 34;
  M68K_REG_ISP = 35;
  M68K_REG_TC = 36;
  M68K_REG_ITT0 = 37;
  M68K_REG_ITT1 = 38;
  M68K_REG_DTT0 = 39;
  M68K_REG_DTT1 = 40;
  M68K_REG_MMUSR = 41;
  M68K_REG_URP = 42;
  M68K_REG_SRP = 43;
  M68K_REG_FPCR = 44;
  M68K_REG_FPSR = 45;
  M68K_REG_FPIAR = 46;
  M68K_REG_ENDING = 47;

/// M68K Addressing Modes
type
  m68k_address_mode = Integer;
  Pm68k_address_mode = ^m68k_address_mode;

const
  /// No address mode.
  M68K_AM_NONE = 0;
  /// Register Direct - Data
  M68K_AM_REG_DIRECT_DATA = 1;
  /// Register Direct - Address
  M68K_AM_REG_DIRECT_ADDR = 2;
  /// Register Indirect - Address
  M68K_AM_REGI_ADDR = 3;
  /// Register Indirect - Address with Postincrement
  M68K_AM_REGI_ADDR_POST_INC = 4;
  /// Register Indirect - Address with Predecrement
  M68K_AM_REGI_ADDR_PRE_DEC = 5;
  /// Register Indirect - Address with Displacement
  M68K_AM_REGI_ADDR_DISP = 6;
  /// Address Register Indirect With Index- 8-bit displacement
  M68K_AM_AREGI_INDEX_8_BIT_DISP = 7;
  /// Address Register Indirect With Index- Base displacement
  M68K_AM_AREGI_INDEX_BASE_DISP = 8;
  /// Memory indirect - Postindex
  M68K_AM_MEMI_POST_INDEX = 9;
  /// Memory indirect - Preindex
  M68K_AM_MEMI_PRE_INDEX = 10;
  /// Program Counter Indirect - with Displacement
  M68K_AM_PCI_DISP = 11;
  /// Program Counter Indirect with Index - with 8-Bit Displacement
  M68K_AM_PCI_INDEX_8_BIT_DISP = 12;
  /// Program Counter Indirect with Index - with Base Displacement
  M68K_AM_PCI_INDEX_BASE_DISP = 13;
  /// Program Counter Memory Indirect - Postindexed
  M68K_AM_PC_MEMI_POST_INDEX = 14;
  /// Program Counter Memory Indirect - Preindexed
  M68K_AM_PC_MEMI_PRE_INDEX = 15;
  /// Absolute Data Addressing  - Short
  M68K_AM_ABSOLUTE_DATA_SHORT = 16;
  /// Absolute Data Addressing  - Long
  M68K_AM_ABSOLUTE_DATA_LONG = 17;
  /// Immediate value
  M68K_AM_IMMEDIATE = 18;
  /// Address as displacement from (PC+2) used by branches
  M68K_AM_BRANCH_DISPLACEMENT = 19;

/// Operand type for instruction's operands
type
  m68k_op_type = Integer;
  Pm68k_op_type = ^m68k_op_type;

const
  /// = CS_OP_INVALID (Uninitialized).
  M68K_OP_INVALID = 0;
  /// = CS_OP_REG (Register operand).
  M68K_OP_REG = 1;
  /// = CS_OP_IMM (Immediate operand).
  M68K_OP_IMM = 2;
  /// = CS_OP_MEM (Memory operand).
  M68K_OP_MEM_ = 3;
  /// single precision Floating-Point operand
  M68K_OP_FP_SINGLE = 4;
  /// double precision Floating-Point operand
  M68K_OP_FP_DOUBLE = 5;
  /// Register bits move
  M68K_OP_REG_BITS = 6;
  /// Register pair in the same op (upper 4 bits for first reg, lower for second)
  M68K_OP_REG_PAIR = 7;
  /// Branch displacement
  M68K_OP_BR_DISP_ = 8;

/// Operand type for instruction's operands
type
  m68k_op_br_disp_size = Integer;
  Pm68k_op_br_disp_size = ^m68k_op_br_disp_size;

const
  /// = CS_OP_INVALID (Uninitialized).
  M68K_OP_BR_DISP_SIZE_INVALID = 0;
  /// signed 8-bit displacement
  M68K_OP_BR_DISP_SIZE_BYTE = 1;
  /// signed 16-bit displacement
  M68K_OP_BR_DISP_SIZE_WORD = 2;
  /// signed 32-bit displacement
  M68K_OP_BR_DISP_SIZE_LONG = 4;

/// Operation size of the CPU instructions
type
  m68k_cpu_size = Integer;
  Pm68k_cpu_size = ^m68k_cpu_size;

const
  /// unsized or unspecified
  M68K_CPU_SIZE_NONE = 0;
  /// 1 byte in size
  M68K_CPU_SIZE_BYTE = 1;
  /// 2 bytes in size
  M68K_CPU_SIZE_WORD = 2;
  /// 4 bytes in size
  M68K_CPU_SIZE_LONG = 4;

/// Operation size of the FPU instructions (Notice that FPU instruction can also use CPU sizes if needed)
type
  m68k_fpu_size = Integer;
  Pm68k_fpu_size = ^m68k_fpu_size;

const
  /// unsized like fsave/frestore
  M68K_FPU_SIZE_NONE = 0;
  /// 4 byte in size (single float)
  M68K_FPU_SIZE_SINGLE = 4;
  /// 8 byte in size (double)
  M68K_FPU_SIZE_DOUBLE = 8;
  /// 12 byte in size (extended real format)
  M68K_FPU_SIZE_EXTENDED = 12;

/// Type of size that is being used for the current instruction
type
  m68k_size_type = Integer;
  Pm68k_size_type = ^m68k_size_type;

const
  M68K_SIZE_TYPE_INVALID = 0;
  M68K_SIZE_TYPE_CPU = 1;
  M68K_SIZE_TYPE_FPU = 2;

/// M68K instruction
type
  m68k_insn = Integer;
  Pm68k_insn = ^m68k_insn;

const
  M68K_INS_INVALID = 0;
  M68K_INS_ABCD = 1;
  M68K_INS_ADD = 2;
  M68K_INS_ADDA = 3;
  M68K_INS_ADDI = 4;
  M68K_INS_ADDQ = 5;
  M68K_INS_ADDX = 6;
  M68K_INS_AND = 7;
  M68K_INS_ANDI = 8;
  M68K_INS_ASL = 9;
  M68K_INS_ASR = 10;
  M68K_INS_BHS = 11;
  M68K_INS_BLO = 12;
  M68K_INS_BHI = 13;
  M68K_INS_BLS = 14;
  M68K_INS_BCC = 15;
  M68K_INS_BCS = 16;
  M68K_INS_BNE = 17;
  M68K_INS_BEQ = 18;
  M68K_INS_BVC = 19;
  M68K_INS_BVS = 20;
  M68K_INS_BPL = 21;
  M68K_INS_BMI = 22;
  M68K_INS_BGE = 23;
  M68K_INS_BLT = 24;
  M68K_INS_BGT = 25;
  M68K_INS_BLE = 26;
  M68K_INS_BRA = 27;
  M68K_INS_BSR = 28;
  M68K_INS_BCHG = 29;
  M68K_INS_BCLR = 30;
  M68K_INS_BSET = 31;
  M68K_INS_BTST = 32;
  M68K_INS_BFCHG = 33;
  M68K_INS_BFCLR = 34;
  M68K_INS_BFEXTS = 35;
  M68K_INS_BFEXTU = 36;
  M68K_INS_BFFFO = 37;
  M68K_INS_BFINS = 38;
  M68K_INS_BFSET = 39;
  M68K_INS_BFTST = 40;
  M68K_INS_BKPT = 41;
  M68K_INS_CALLM = 42;
  M68K_INS_CAS = 43;
  M68K_INS_CAS2 = 44;
  M68K_INS_CHK = 45;
  M68K_INS_CHK2 = 46;
  M68K_INS_CLR = 47;
  M68K_INS_CMP = 48;
  M68K_INS_CMPA = 49;
  M68K_INS_CMPI = 50;
  M68K_INS_CMPM = 51;
  M68K_INS_CMP2 = 52;
  M68K_INS_CINVL = 53;
  M68K_INS_CINVP = 54;
  M68K_INS_CINVA = 55;
  M68K_INS_CPUSHL = 56;
  M68K_INS_CPUSHP = 57;
  M68K_INS_CPUSHA = 58;
  M68K_INS_DBT = 59;
  M68K_INS_DBF = 60;
  M68K_INS_DBHI = 61;
  M68K_INS_DBLS = 62;
  M68K_INS_DBCC = 63;
  M68K_INS_DBCS = 64;
  M68K_INS_DBNE = 65;
  M68K_INS_DBEQ = 66;
  M68K_INS_DBVC = 67;
  M68K_INS_DBVS = 68;
  M68K_INS_DBPL = 69;
  M68K_INS_DBMI = 70;
  M68K_INS_DBGE = 71;
  M68K_INS_DBLT = 72;
  M68K_INS_DBGT = 73;
  M68K_INS_DBLE = 74;
  M68K_INS_DBRA = 75;
  M68K_INS_DIVS = 76;
  M68K_INS_DIVSL = 77;
  M68K_INS_DIVU = 78;
  M68K_INS_DIVUL = 79;
  M68K_INS_EOR = 80;
  M68K_INS_EORI = 81;
  M68K_INS_EXG = 82;
  M68K_INS_EXT = 83;
  M68K_INS_EXTB = 84;
  M68K_INS_FABS = 85;
  M68K_INS_FSABS = 86;
  M68K_INS_FDABS = 87;
  M68K_INS_FACOS = 88;
  M68K_INS_FADD = 89;
  M68K_INS_FSADD = 90;
  M68K_INS_FDADD = 91;
  M68K_INS_FASIN = 92;
  M68K_INS_FATAN = 93;
  M68K_INS_FATANH = 94;
  M68K_INS_FBF = 95;
  M68K_INS_FBEQ = 96;
  M68K_INS_FBOGT = 97;
  M68K_INS_FBOGE = 98;
  M68K_INS_FBOLT = 99;
  M68K_INS_FBOLE = 100;
  M68K_INS_FBOGL = 101;
  M68K_INS_FBOR = 102;
  M68K_INS_FBUN = 103;
  M68K_INS_FBUEQ = 104;
  M68K_INS_FBUGT = 105;
  M68K_INS_FBUGE = 106;
  M68K_INS_FBULT = 107;
  M68K_INS_FBULE = 108;
  M68K_INS_FBNE = 109;
  M68K_INS_FBT = 110;
  M68K_INS_FBSF = 111;
  M68K_INS_FBSEQ = 112;
  M68K_INS_FBGT = 113;
  M68K_INS_FBGE = 114;
  M68K_INS_FBLT = 115;
  M68K_INS_FBLE = 116;
  M68K_INS_FBGL = 117;
  M68K_INS_FBGLE = 118;
  M68K_INS_FBNGLE = 119;
  M68K_INS_FBNGL = 120;
  M68K_INS_FBNLE = 121;
  M68K_INS_FBNLT = 122;
  M68K_INS_FBNGE = 123;
  M68K_INS_FBNGT = 124;
  M68K_INS_FBSNE = 125;
  M68K_INS_FBST = 126;
  M68K_INS_FCMP = 127;
  M68K_INS_FCOS = 128;
  M68K_INS_FCOSH = 129;
  M68K_INS_FDBF = 130;
  M68K_INS_FDBEQ = 131;
  M68K_INS_FDBOGT = 132;
  M68K_INS_FDBOGE = 133;
  M68K_INS_FDBOLT = 134;
  M68K_INS_FDBOLE = 135;
  M68K_INS_FDBOGL = 136;
  M68K_INS_FDBOR = 137;
  M68K_INS_FDBUN = 138;
  M68K_INS_FDBUEQ = 139;
  M68K_INS_FDBUGT = 140;
  M68K_INS_FDBUGE = 141;
  M68K_INS_FDBULT = 142;
  M68K_INS_FDBULE = 143;
  M68K_INS_FDBNE = 144;
  M68K_INS_FDBT = 145;
  M68K_INS_FDBSF = 146;
  M68K_INS_FDBSEQ = 147;
  M68K_INS_FDBGT = 148;
  M68K_INS_FDBGE = 149;
  M68K_INS_FDBLT = 150;
  M68K_INS_FDBLE = 151;
  M68K_INS_FDBGL = 152;
  M68K_INS_FDBGLE = 153;
  M68K_INS_FDBNGLE = 154;
  M68K_INS_FDBNGL = 155;
  M68K_INS_FDBNLE = 156;
  M68K_INS_FDBNLT = 157;
  M68K_INS_FDBNGE = 158;
  M68K_INS_FDBNGT = 159;
  M68K_INS_FDBSNE = 160;
  M68K_INS_FDBST = 161;
  M68K_INS_FDIV = 162;
  M68K_INS_FSDIV = 163;
  M68K_INS_FDDIV = 164;
  M68K_INS_FETOX = 165;
  M68K_INS_FETOXM1 = 166;
  M68K_INS_FGETEXP = 167;
  M68K_INS_FGETMAN = 168;
  M68K_INS_FINT = 169;
  M68K_INS_FINTRZ = 170;
  M68K_INS_FLOG10 = 171;
  M68K_INS_FLOG2 = 172;
  M68K_INS_FLOGN = 173;
  M68K_INS_FLOGNP1 = 174;
  M68K_INS_FMOD = 175;
  M68K_INS_FMOVE = 176;
  M68K_INS_FSMOVE = 177;
  M68K_INS_FDMOVE = 178;
  M68K_INS_FMOVECR = 179;
  M68K_INS_FMOVEM = 180;
  M68K_INS_FMUL = 181;
  M68K_INS_FSMUL = 182;
  M68K_INS_FDMUL = 183;
  M68K_INS_FNEG = 184;
  M68K_INS_FSNEG = 185;
  M68K_INS_FDNEG = 186;
  M68K_INS_FNOP = 187;
  M68K_INS_FREM = 188;
  M68K_INS_FRESTORE = 189;
  M68K_INS_FSAVE = 190;
  M68K_INS_FSCALE = 191;
  M68K_INS_FSGLDIV = 192;
  M68K_INS_FSGLMUL = 193;
  M68K_INS_FSIN = 194;
  M68K_INS_FSINCOS = 195;
  M68K_INS_FSINH = 196;
  M68K_INS_FSQRT = 197;
  M68K_INS_FSSQRT = 198;
  M68K_INS_FDSQRT = 199;
  M68K_INS_FSF = 200;
  M68K_INS_FSBEQ = 201;
  M68K_INS_FSOGT = 202;
  M68K_INS_FSOGE = 203;
  M68K_INS_FSOLT = 204;
  M68K_INS_FSOLE = 205;
  M68K_INS_FSOGL = 206;
  M68K_INS_FSOR = 207;
  M68K_INS_FSUN = 208;
  M68K_INS_FSUEQ = 209;
  M68K_INS_FSUGT = 210;
  M68K_INS_FSUGE = 211;
  M68K_INS_FSULT = 212;
  M68K_INS_FSULE = 213;
  M68K_INS_FSNE = 214;
  M68K_INS_FST = 215;
  M68K_INS_FSSF = 216;
  M68K_INS_FSSEQ = 217;
  M68K_INS_FSGT = 218;
  M68K_INS_FSGE = 219;
  M68K_INS_FSLT = 220;
  M68K_INS_FSLE = 221;
  M68K_INS_FSGL = 222;
  M68K_INS_FSGLE = 223;
  M68K_INS_FSNGLE = 224;
  M68K_INS_FSNGL = 225;
  M68K_INS_FSNLE = 226;
  M68K_INS_FSNLT = 227;
  M68K_INS_FSNGE = 228;
  M68K_INS_FSNGT = 229;
  M68K_INS_FSSNE = 230;
  M68K_INS_FSST = 231;
  M68K_INS_FSUB = 232;
  M68K_INS_FSSUB = 233;
  M68K_INS_FDSUB = 234;
  M68K_INS_FTAN = 235;
  M68K_INS_FTANH = 236;
  M68K_INS_FTENTOX = 237;
  M68K_INS_FTRAPF = 238;
  M68K_INS_FTRAPEQ = 239;
  M68K_INS_FTRAPOGT = 240;
  M68K_INS_FTRAPOGE = 241;
  M68K_INS_FTRAPOLT = 242;
  M68K_INS_FTRAPOLE = 243;
  M68K_INS_FTRAPOGL = 244;
  M68K_INS_FTRAPOR = 245;
  M68K_INS_FTRAPUN = 246;
  M68K_INS_FTRAPUEQ = 247;
  M68K_INS_FTRAPUGT = 248;
  M68K_INS_FTRAPUGE = 249;
  M68K_INS_FTRAPULT = 250;
  M68K_INS_FTRAPULE = 251;
  M68K_INS_FTRAPNE = 252;
  M68K_INS_FTRAPT = 253;
  M68K_INS_FTRAPSF = 254;
  M68K_INS_FTRAPSEQ = 255;
  M68K_INS_FTRAPGT = 256;
  M68K_INS_FTRAPGE = 257;
  M68K_INS_FTRAPLT = 258;
  M68K_INS_FTRAPLE = 259;
  M68K_INS_FTRAPGL = 260;
  M68K_INS_FTRAPGLE = 261;
  M68K_INS_FTRAPNGLE = 262;
  M68K_INS_FTRAPNGL = 263;
  M68K_INS_FTRAPNLE = 264;
  M68K_INS_FTRAPNLT = 265;
  M68K_INS_FTRAPNGE = 266;
  M68K_INS_FTRAPNGT = 267;
  M68K_INS_FTRAPSNE = 268;
  M68K_INS_FTRAPST = 269;
  M68K_INS_FTST = 270;
  M68K_INS_FTWOTOX = 271;
  M68K_INS_HALT = 272;
  M68K_INS_ILLEGAL = 273;
  M68K_INS_JMP = 274;
  M68K_INS_JSR = 275;
  M68K_INS_LEA = 276;
  M68K_INS_LINK = 277;
  M68K_INS_LPSTOP = 278;
  M68K_INS_LSL = 279;
  M68K_INS_LSR = 280;
  M68K_INS_MOVE = 281;
  M68K_INS_MOVEA = 282;
  M68K_INS_MOVEC = 283;
  M68K_INS_MOVEM = 284;
  M68K_INS_MOVEP = 285;
  M68K_INS_MOVEQ = 286;
  M68K_INS_MOVES = 287;
  M68K_INS_MOVE16 = 288;
  M68K_INS_MULS = 289;
  M68K_INS_MULU = 290;
  M68K_INS_NBCD = 291;
  M68K_INS_NEG = 292;
  M68K_INS_NEGX = 293;
  M68K_INS_NOP = 294;
  M68K_INS_NOT = 295;
  M68K_INS_OR = 296;
  M68K_INS_ORI = 297;
  M68K_INS_PACK = 298;
  M68K_INS_PEA = 299;
  M68K_INS_PFLUSH = 300;
  M68K_INS_PFLUSHA = 301;
  M68K_INS_PFLUSHAN = 302;
  M68K_INS_PFLUSHN = 303;
  M68K_INS_PLOADR = 304;
  M68K_INS_PLOADW = 305;
  M68K_INS_PLPAR = 306;
  M68K_INS_PLPAW = 307;
  M68K_INS_PMOVE = 308;
  M68K_INS_PMOVEFD = 309;
  M68K_INS_PTESTR = 310;
  M68K_INS_PTESTW = 311;
  M68K_INS_PULSE = 312;
  M68K_INS_REMS = 313;
  M68K_INS_REMU = 314;
  M68K_INS_RESET = 315;
  M68K_INS_ROL = 316;
  M68K_INS_ROR = 317;
  M68K_INS_ROXL = 318;
  M68K_INS_ROXR = 319;
  M68K_INS_RTD = 320;
  M68K_INS_RTE = 321;
  M68K_INS_RTM = 322;
  M68K_INS_RTR = 323;
  M68K_INS_RTS = 324;
  M68K_INS_SBCD = 325;
  M68K_INS_ST = 326;
  M68K_INS_SF = 327;
  M68K_INS_SHI = 328;
  M68K_INS_SLS = 329;
  M68K_INS_SCC = 330;
  M68K_INS_SHS = 331;
  M68K_INS_SCS = 332;
  M68K_INS_SLO = 333;
  M68K_INS_SNE = 334;
  M68K_INS_SEQ = 335;
  M68K_INS_SVC = 336;
  M68K_INS_SVS = 337;
  M68K_INS_SPL = 338;
  M68K_INS_SMI = 339;
  M68K_INS_SGE = 340;
  M68K_INS_SLT = 341;
  M68K_INS_SGT = 342;
  M68K_INS_SLE = 343;
  M68K_INS_STOP = 344;
  M68K_INS_SUB = 345;
  M68K_INS_SUBA = 346;
  M68K_INS_SUBI = 347;
  M68K_INS_SUBQ = 348;
  M68K_INS_SUBX = 349;
  M68K_INS_SWAP = 350;
  M68K_INS_TAS = 351;
  M68K_INS_TRAP = 352;
  M68K_INS_TRAPV = 353;
  M68K_INS_TRAPT = 354;
  M68K_INS_TRAPF = 355;
  M68K_INS_TRAPHI = 356;
  M68K_INS_TRAPLS = 357;
  M68K_INS_TRAPCC = 358;
  M68K_INS_TRAPHS = 359;
  M68K_INS_TRAPCS = 360;
  M68K_INS_TRAPLO = 361;
  M68K_INS_TRAPNE = 362;
  M68K_INS_TRAPEQ = 363;
  M68K_INS_TRAPVC = 364;
  M68K_INS_TRAPVS = 365;
  M68K_INS_TRAPPL = 366;
  M68K_INS_TRAPMI = 367;
  M68K_INS_TRAPGE = 368;
  M68K_INS_TRAPLT = 369;
  M68K_INS_TRAPGT = 370;
  M68K_INS_TRAPLE = 371;
  M68K_INS_TST = 372;
  M68K_INS_UNLK = 373;
  M68K_INS_UNPK = 374;
  M68K_INS_ENDING = 375;

/// Group of M68K instructions
type
  m68k_group_type = Integer;
  Pm68k_group_type = ^m68k_group_type;

const
  /// CS_GRUP_INVALID
  M68K_GRP_INVALID = 0;
  /// = CS_GRP_JUMP
  M68K_GRP_JUMP = 1;
  /// = CS_GRP_RET
  M68K_GRP_RET = 3;
  /// = CS_GRP_IRET
  M68K_GRP_IRET = 5;
  /// = CS_GRP_BRANCH_RELATIVE
  M68K_GRP_BRANCH_RELATIVE = 7;
  M68K_GRP_ENDING = 8;

type
  // Forward declarations
  Pm68k_op_mem = ^m68k_op_mem;
  Pm68k_op_br_disp = ^m68k_op_br_disp;
  Pcs_m68k_op_reg_pair = ^cs_m68k_op_reg_pair;
  Pcs_m68k_op = ^cs_m68k_op;
  Pm68k_op_size = ^m68k_op_size;
  Pcs_m68k = ^cs_m68k;

  /// Instruction's operand referring to memory
  /// This is associated with M68K_OP_MEM operand type above
  m68k_op_mem = record
    /// base register (or M68K_REG_INVALID if irrelevant)
    base_reg: m68k_reg;
    /// index register (or M68K_REG_INVALID if irrelevant)
    index_reg: m68k_reg;
    /// indirect base register (or M68K_REG_INVALID if irrelevant)
    in_base_reg: m68k_reg;
    /// indirect displacement
    in_disp: UInt32;
    /// other displacement
    out_disp: UInt32;
    /// displacement value
    disp: Int16;
    /// scale for index register
    scale: UInt8;
    /// set to true if the two values below should be used
    bitfield: UInt8;
    /// used for bf* instructions
    width: UInt8;
    /// used for bf* instructions
    offset: UInt8;
    /// 0 = w, 1 = l
    index_size: UInt8;
  end;

  m68k_op_br_disp = record
    /// displacement value
    disp: Int32;
    /// Size from m68k_op_br_disp_size type above
    disp_size: UInt8;
  end;

  /// Register pair in one operand.
  cs_m68k_op_reg_pair = record
    reg_0: m68k_reg;
    reg_1: m68k_reg;
  end;

  P_anonymous_type_1 = ^_anonymous_type_1;
  _anonymous_type_1 = record
    case Integer of
      0: (/// immediate value for IMM operand
    imm: UInt64);
      1: (/// double imm
    dimm: Double);
      2: (/// float imm
    simm: Single);
      3: (/// register value for REG operand
    reg: m68k_reg);
      4: (/// register pair in one operand
    reg_pair: cs_m68k_op_reg_pair);
  end;

  /// Instruction operand
  cs_m68k_op = record
    f1: _anonymous_type_1;
    /// data when operand is targeting memory
    mem: m68k_op_mem;
    /// data when operand is a branch displacement
    br_disp: m68k_op_br_disp;
    /// register bits for movem etc. (always in d0-d7, a0-a7, fp0 - fp7 order)
    register_bits: UInt32;
    &type: m68k_op_type;
    /// M68K addressing mode for this op
    address_mode: m68k_address_mode;
  end;

  P_anonymous_type_2 = ^_anonymous_type_2;
  _anonymous_type_2 = record
    case Integer of
      0: (cpu_size: m68k_cpu_size);
      1: (fpu_size: m68k_fpu_size);
  end;

  /// Operation size of the current instruction (NOT the actually size of instruction)
  m68k_op_size = record
    &type: m68k_size_type;
    f2: _anonymous_type_2;
  end;

  /// The M68K instruction and it's operands
  cs_m68k = record
    /// operands for this instruction.
    operands: array [0..3] of cs_m68k_op;
    /// size of data operand works on in bytes (.b, .w, .l, etc)
    op_size: m68k_op_size;
    /// number of operands for the instruction
    op_count: UInt8;
  end;

implementation

end.