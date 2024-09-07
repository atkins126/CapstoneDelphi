{ ***************************************************** }
{                                                       }
{  Pascal language binding for the Capstone engine      }
{                                                       }
{  Unit Name: Capstone Api Header                       }
{     Author: Lsuper 2024.05.01                         }
{    Purpose: sh.h                                      }
{    License: Mozilla Public License 2.0                }
{                                                       }
{  Copyright (c) 1998-2024 Super Studio                 }
{                                                       }
{ ***************************************************** }

unit Capstone.SH;

{$I Capstone.inc}

interface

type
  /// SH registers and special registers
  sh_reg = Integer;
  Psh_reg = ^sh_reg;

const
  SH_REG_INVALID = 0;
  SH_REG_R0 = 1;
  SH_REG_R1 = 2;
  SH_REG_R2 = 3;
  SH_REG_R3 = 4;
  SH_REG_R4 = 5;
  SH_REG_R5 = 6;
  SH_REG_R6 = 7;
  SH_REG_R7 = 8;
  SH_REG_R8 = 9;
  SH_REG_R9 = 10;
  SH_REG_R10 = 11;
  SH_REG_R11 = 12;
  SH_REG_R12 = 13;
  SH_REG_R13 = 14;
  SH_REG_R14 = 15;
  SH_REG_R15 = 16;
  SH_REG_R0_BANK = 17;
  SH_REG_R1_BANK = 18;
  SH_REG_R2_BANK = 19;
  SH_REG_R3_BANK = 20;
  SH_REG_R4_BANK = 21;
  SH_REG_R5_BANK = 22;
  SH_REG_R6_BANK = 23;
  SH_REG_R7_BANK = 24;
  SH_REG_FR0 = 25;
  SH_REG_FR1 = 26;
  SH_REG_FR2 = 27;
  SH_REG_FR3 = 28;
  SH_REG_FR4 = 29;
  SH_REG_FR5 = 30;
  SH_REG_FR6 = 31;
  SH_REG_FR7 = 32;
  SH_REG_FR8 = 33;
  SH_REG_FR9 = 34;
  SH_REG_FR10 = 35;
  SH_REG_FR11 = 36;
  SH_REG_FR12 = 37;
  SH_REG_FR13 = 38;
  SH_REG_FR14 = 39;
  SH_REG_FR15 = 40;
  SH_REG_DR0 = 41;
  SH_REG_DR2 = 42;
  SH_REG_DR4 = 43;
  SH_REG_DR6 = 44;
  SH_REG_DR8 = 45;
  SH_REG_DR10 = 46;
  SH_REG_DR12 = 47;
  SH_REG_DR14 = 48;
  SH_REG_XD0 = 49;
  SH_REG_XD2 = 50;
  SH_REG_XD4 = 51;
  SH_REG_XD6 = 52;
  SH_REG_XD8 = 53;
  SH_REG_XD10 = 54;
  SH_REG_XD12 = 55;
  SH_REG_XD14 = 56;
  SH_REG_XF0 = 57;
  SH_REG_XF1 = 58;
  SH_REG_XF2 = 59;
  SH_REG_XF3 = 60;
  SH_REG_XF4 = 61;
  SH_REG_XF5 = 62;
  SH_REG_XF6 = 63;
  SH_REG_XF7 = 64;
  SH_REG_XF8 = 65;
  SH_REG_XF9 = 66;
  SH_REG_XF10 = 67;
  SH_REG_XF11 = 68;
  SH_REG_XF12 = 69;
  SH_REG_XF13 = 70;
  SH_REG_XF14 = 71;
  SH_REG_XF15 = 72;
  SH_REG_FV0 = 73;
  SH_REG_FV4 = 74;
  SH_REG_FV8 = 75;
  SH_REG_FV12 = 76;
  SH_REG_XMATRX = 77;
  SH_REG_PC = 78;
  SH_REG_PR = 79;
  SH_REG_MACH = 80;
  SH_REG_MACL = 81;
  SH_REG_SR = 82;
  SH_REG_GBR = 83;
  SH_REG_SSR = 84;
  SH_REG_SPC = 85;
  SH_REG_SGR = 86;
  SH_REG_DBR = 87;
  SH_REG_VBR = 88;
  SH_REG_TBR = 89;
  SH_REG_RS = 90;
  SH_REG_RE = 91;
  SH_REG_MOD = 92;
  SH_REG_FPUL = 93;
  SH_REG_FPSCR = 94;
  SH_REG_DSP_X0 = 95;
  SH_REG_DSP_X1 = 96;
  SH_REG_DSP_Y0 = 97;
  SH_REG_DSP_Y1 = 98;
  SH_REG_DSP_A0 = 99;
  SH_REG_DSP_A1 = 100;
  SH_REG_DSP_A0G = 101;
  SH_REG_DSP_A1G = 102;
  SH_REG_DSP_M0 = 103;
  SH_REG_DSP_M1 = 104;
  SH_REG_DSP_DSR = 105;
  SH_REG_DSP_RSV0 = 106;
  SH_REG_DSP_RSV1 = 107;
  SH_REG_DSP_RSV2 = 108;
  SH_REG_DSP_RSV3 = 109;
  SH_REG_DSP_RSV4 = 110;
  SH_REG_DSP_RSV5 = 111;
  SH_REG_DSP_RSV6 = 112;
  SH_REG_DSP_RSV7 = 113;
  SH_REG_DSP_RSV8 = 114;
  SH_REG_DSP_RSV9 = 115;
  SH_REG_DSP_RSVA = 116;
  SH_REG_DSP_RSVB = 117;
  SH_REG_DSP_RSVC = 118;
  SH_REG_DSP_RSVD = 119;
  SH_REG_DSP_RSVE = 120;
  SH_REG_DSP_RSVF = 121;
  SH_REG_ENDING = 122;

type
  sh_op_type = Integer;
  Psh_op_type = ^sh_op_type;

const
  /// = CS_OP_INVALID (Uninitialized).
  SH_OP_INVALID = 0;
  /// = CS_OP_REG (Register operand).
  SH_OP_REG = 1;
  /// = CS_OP_IMM (Immediate operand).
  SH_OP_IMM = 2;
  /// = CS_OP_MEM (Memory operand).
  SH_OP_MEM_ = 3;

type
  sh_op_mem_type = Integer;
  Psh_op_mem_type = ^sh_op_mem_type;

const
  SH_OP_MEM_INVALID = 0;
  /// <= Invalid
  SH_OP_MEM_REG_IND = 1;
  /// <= Register indirect
  SH_OP_MEM_REG_POST = 2;
  /// <= Register post increment
  SH_OP_MEM_REG_PRE = 3;
  /// <= Register pre decrement
  SH_OP_MEM_REG_DISP = 4;
  /// <= displacement
  SH_OP_MEM_REG_R0 = 5;
  /// <= R0 indexed
  SH_OP_MEM_GBR_DISP = 6;
  /// <= GBR based displacement
  SH_OP_MEM_GBR_R0 = 7;
  /// <= GBR based R0 indexed
  SH_OP_MEM_PCR = 8;
  /// <= PC relative
  SH_OP_MEM_TBR_DISP = 9;

type
  sh_dsp_insn_type = Integer;
  Psh_dsp_insn_type = ^sh_dsp_insn_type;

const
  SH_INS_DSP_INVALID = 0;
  SH_INS_DSP_DOUBLE = 1;
  SH_INS_DSP_SINGLE = 2;
  SH_INS_DSP_PARALLEL = 3;

type
  sh_dsp_insn = Integer;
  Psh_dsp_insn = ^sh_dsp_insn;

const
  SH_INS_DSP_NOP = 1;
  SH_INS_DSP_MOV = 2;
  SH_INS_DSP_PSHL = 3;
  SH_INS_DSP_PSHA = 4;
  SH_INS_DSP_PMULS = 5;
  SH_INS_DSP_PCLR_PMULS = 6;
  SH_INS_DSP_PSUB_PMULS = 7;
  SH_INS_DSP_PADD_PMULS = 8;
  SH_INS_DSP_PSUBC = 9;
  SH_INS_DSP_PADDC = 10;
  SH_INS_DSP_PCMP = 11;
  SH_INS_DSP_PABS = 12;
  SH_INS_DSP_PRND = 13;
  SH_INS_DSP_PSUB = 14;
  SH_INS_DSP_PSUBr = 15;
  SH_INS_DSP_PADD = 16;
  SH_INS_DSP_PAND = 17;
  SH_INS_DSP_PXOR = 18;
  SH_INS_DSP_POR = 19;
  SH_INS_DSP_PDEC = 20;
  SH_INS_DSP_PINC = 21;
  SH_INS_DSP_PCLR = 22;
  SH_INS_DSP_PDMSB = 23;
  SH_INS_DSP_PNEG = 24;
  SH_INS_DSP_PCOPY = 25;
  SH_INS_DSP_PSTS = 26;
  SH_INS_DSP_PLDS = 27;
  SH_INS_DSP_PSWAP = 28;
  SH_INS_DSP_PWAD = 29;
  SH_INS_DSP_PWSB = 30;

type
  sh_dsp_operand = Integer;
  Psh_dsp_operand = ^sh_dsp_operand;

const
  SH_OP_DSP_INVALID = 0;
  SH_OP_DSP_REG_PRE = 1;
  SH_OP_DSP_REG_IND = 2;
  SH_OP_DSP_REG_POST = 3;
  SH_OP_DSP_REG_INDEX = 4;
  SH_OP_DSP_REG = 5;
  SH_OP_DSP_IMM = 6;

type
  sh_dsp_cc = Integer;
  Psh_dsp_cc = ^sh_dsp_cc;

const
  SH_DSP_CC_INVALID = 0;
  SH_DSP_CC_NONE = 1;
  SH_DSP_CC_DCT = 2;
  SH_DSP_CC_DCF = 3;

/// SH instruction
type
  sh_insn = Integer;
  Psh_insn = ^sh_insn;

const
  SH_INS_INVALID = 0;
  SH_INS_ADD_r = 1;
  SH_INS_ADD = 2;
  SH_INS_ADDC = 3;
  SH_INS_ADDV = 4;
  SH_INS_AND = 5;
  SH_INS_BAND = 6;
  SH_INS_BANDNOT = 7;
  SH_INS_BCLR = 8;
  SH_INS_BF = 9;
  SH_INS_BF_S = 10;
  SH_INS_BLD = 11;
  SH_INS_BLDNOT = 12;
  SH_INS_BOR = 13;
  SH_INS_BORNOT = 14;
  SH_INS_BRA = 15;
  SH_INS_BRAF = 16;
  SH_INS_BSET = 17;
  SH_INS_BSR = 18;
  SH_INS_BSRF = 19;
  SH_INS_BST = 20;
  SH_INS_BT = 21;
  SH_INS_BT_S = 22;
  SH_INS_BXOR = 23;
  SH_INS_CLIPS = 24;
  SH_INS_CLIPU = 25;
  SH_INS_CLRDMXY = 26;
  SH_INS_CLRMAC = 27;
  SH_INS_CLRS = 28;
  SH_INS_CLRT = 29;
  SH_INS_CMP_EQ = 30;
  SH_INS_CMP_GE = 31;
  SH_INS_CMP_GT = 32;
  SH_INS_CMP_HI = 33;
  SH_INS_CMP_HS = 34;
  SH_INS_CMP_PL = 35;
  SH_INS_CMP_PZ = 36;
  SH_INS_CMP_STR = 37;
  SH_INS_DIV0S = 38;
  SH_INS_DIV0U = 39;
  SH_INS_DIV1 = 40;
  SH_INS_DIVS = 41;
  SH_INS_DIVU = 42;
  SH_INS_DMULS_L = 43;
  SH_INS_DMULU_L = 44;
  SH_INS_DT = 45;
  SH_INS_EXTS_B = 46;
  SH_INS_EXTS_W = 47;
  SH_INS_EXTU_B = 48;
  SH_INS_EXTU_W = 49;
  SH_INS_FABS = 50;
  SH_INS_FADD = 51;
  SH_INS_FCMP_EQ = 52;
  SH_INS_FCMP_GT = 53;
  SH_INS_FCNVDS = 54;
  SH_INS_FCNVSD = 55;
  SH_INS_FDIV = 56;
  SH_INS_FIPR = 57;
  SH_INS_FLDI0 = 58;
  SH_INS_FLDI1 = 59;
  SH_INS_FLDS = 60;
  SH_INS_FLOAT = 61;
  SH_INS_FMAC = 62;
  SH_INS_FMOV = 63;
  SH_INS_FMUL = 64;
  SH_INS_FNEG = 65;
  SH_INS_FPCHG = 66;
  SH_INS_FRCHG = 67;
  SH_INS_FSCA = 68;
  SH_INS_FSCHG = 69;
  SH_INS_FSQRT = 70;
  SH_INS_FSRRA = 71;
  SH_INS_FSTS = 72;
  SH_INS_FSUB = 73;
  SH_INS_FTRC = 74;
  SH_INS_FTRV = 75;
  SH_INS_ICBI = 76;
  SH_INS_JMP = 77;
  SH_INS_JSR = 78;
  SH_INS_JSR_N = 79;
  SH_INS_LDBANK = 80;
  SH_INS_LDC = 81;
  SH_INS_LDRC = 82;
  SH_INS_LDRE = 83;
  SH_INS_LDRS = 84;
  SH_INS_LDS = 85;
  SH_INS_LDTLB = 86;
  SH_INS_MAC_L = 87;
  SH_INS_MAC_W = 88;
  SH_INS_MOV = 89;
  SH_INS_MOVA = 90;
  SH_INS_MOVCA = 91;
  SH_INS_MOVCO = 92;
  SH_INS_MOVI20 = 93;
  SH_INS_MOVI20S = 94;
  SH_INS_MOVLI = 95;
  SH_INS_MOVML = 96;
  SH_INS_MOVMU = 97;
  SH_INS_MOVRT = 98;
  SH_INS_MOVT = 99;
  SH_INS_MOVU = 100;
  SH_INS_MOVUA = 101;
  SH_INS_MUL_L = 102;
  SH_INS_MULR = 103;
  SH_INS_MULS_W = 104;
  SH_INS_MULU_W = 105;
  SH_INS_NEG = 106;
  SH_INS_NEGC = 107;
  SH_INS_NOP = 108;
  SH_INS_NOT = 109;
  SH_INS_NOTT = 110;
  SH_INS_OCBI = 111;
  SH_INS_OCBP = 112;
  SH_INS_OCBWB = 113;
  SH_INS_OR = 114;
  SH_INS_PREF = 115;
  SH_INS_PREFI = 116;
  SH_INS_RESBANK = 117;
  SH_INS_ROTCL = 118;
  SH_INS_ROTCR = 119;
  SH_INS_ROTL = 120;
  SH_INS_ROTR = 121;
  SH_INS_RTE = 122;
  SH_INS_RTS = 123;
  SH_INS_RTS_N = 124;
  SH_INS_RTV_N = 125;
  SH_INS_SETDMX = 126;
  SH_INS_SETDMY = 127;
  SH_INS_SETRC = 128;
  SH_INS_SETS = 129;
  SH_INS_SETT = 130;
  SH_INS_SHAD = 131;
  SH_INS_SHAL = 132;
  SH_INS_SHAR = 133;
  SH_INS_SHLD = 134;
  SH_INS_SHLL = 135;
  SH_INS_SHLL16 = 136;
  SH_INS_SHLL2 = 137;
  SH_INS_SHLL8 = 138;
  SH_INS_SHLR = 139;
  SH_INS_SHLR16 = 140;
  SH_INS_SHLR2 = 141;
  SH_INS_SHLR8 = 142;
  SH_INS_SLEEP = 143;
  SH_INS_STBANK = 144;
  SH_INS_STC = 145;
  SH_INS_STS = 146;
  SH_INS_SUB = 147;
  SH_INS_SUBC = 148;
  SH_INS_SUBV = 149;
  SH_INS_SWAP_B = 150;
  SH_INS_SWAP_W = 151;
  SH_INS_SYNCO = 152;
  SH_INS_TAS = 153;
  SH_INS_TRAPA = 154;
  SH_INS_TST = 155;
  SH_INS_XOR = 156;
  SH_INS_XTRCT = 157;
  SH_INS_DSP = 158;
  SH_INS_ENDING = 159;

/// Group of SH instructions
type
  sh_insn_group = Integer;
  Psh_insn_group = ^sh_insn_group;

const
  /// CS_GRUP_INVALID
  SH_GRP_INVALID = 0;
  /// = CS_GRP_JUMP
  SH_GRP_JUMP = 1;
  /// = CS_GRP_CALL
  SH_GRP_CALL = 2;
  /// = CS_GRP_INT
  SH_GRP_INT = 3;
  /// = CS_GRP_RET
  SH_GRP_RET = 4;
  /// = CS_GRP_IRET
  SH_GRP_IRET = 5;
  /// = CS_GRP_PRIVILEGE
  SH_GRP_PRIVILEGE = 6;
  /// = CS_GRP_BRANCH_RELATIVE
  SH_GRP_BRANCH_RELATIVE = 7;
  SH_GRP_SH1 = 8;
  SH_GRP_SH2 = 9;
  SH_GRP_SH2E = 10;
  SH_GRP_SH2DSP = 11;
  SH_GRP_SH2A = 12;
  SH_GRP_SH2AFPU = 13;
  SH_GRP_SH3 = 14;
  SH_GRP_SH3DSP = 15;
  SH_GRP_SH4 = 16;
  SH_GRP_SH4A = 17;
  SH_GRP_ENDING = 18;

type
  // Forward declarations
  Psh_op_mem = ^sh_op_mem;
  Psh_op_dsp = ^sh_op_dsp;
  Pcs_sh_op = ^cs_sh_op;
  Pcs_sh = ^cs_sh;

  sh_op_mem = record
    address: sh_op_mem_type;
    /// <= memory address
    reg: sh_reg;
    /// <= base register
    disp: UInt32;
  end;

  sh_op_dsp = record
    insn: sh_dsp_insn;
    operand: array[0..1] of sh_dsp_operand;
    r: array[0..5] of sh_reg;
    cc: sh_dsp_cc;
    imm: UInt8;
    size: Integer;
  end;

  cs_sh_op_detail = record
    case Integer of
      0: (/// immediate value for IMM operand
    imm: UInt64);
      1: (/// register value for REG operand
    reg: sh_reg);
      2: (/// data when operand is targeting memory
    mem: sh_op_mem);
      3: (/// dsp instruction
    dsp: sh_op_dsp);
  end;

  /// Instruction operand
  cs_sh_op = record
    type_: sh_op_type;
    /// union op detail
    detail: cs_sh_op_detail;
  end;

  /// Instruction structure
  cs_sh = record
    insn: sh_insn;
    size: UInt8;
    op_count: UInt8;
    operands: array[0..2] of cs_sh_op;
  end;

implementation

end.
