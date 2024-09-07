{ ***************************************************** }
{                                                       }
{  Pascal language binding for the Capstone engine      }
{                                                       }
{  Unit Name: Capstone Api Header                       }
{     Author: Lsuper 2024.05.01                         }
{    Purpose: wasm.h                                    }
{    License: Mozilla Public License 2.0                }
{                                                       }
{  Copyright (c) 1998-2024 Super Studio                 }
{                                                       }
{ ***************************************************** }

unit Capstone.Wasm;

{$I Capstone.inc}

interface

type
  wasm_op_type = Integer;
  Pwasm_op_type = ^wasm_op_type;

const
  WASM_OP_INVALID = 0;
  WASM_OP_NONE = 1;
  WASM_OP_INT7 = 2;
  WASM_OP_VARUINT32 = 3;
  WASM_OP_VARUINT64 = 4;
  WASM_OP_UINT32 = 5;
  WASM_OP_UINT64 = 6;
  WASM_OP_IMM = 7;
  WASM_OP_BRTABLE = 8;

/// WASM instruction
type
  wasm_insn = Integer;
  Pwasm_insn = ^wasm_insn;

const
  WASM_INS_UNREACHABLE = 0;
  WASM_INS_NOP = 1;
  WASM_INS_BLOCK = 2;
  WASM_INS_LOOP = 3;
  WASM_INS_IF = 4;
  WASM_INS_ELSE = 5;
  WASM_INS_END = 11;
  WASM_INS_BR = 12;
  WASM_INS_BR_IF = 13;
  WASM_INS_BR_TABLE = 14;
  WASM_INS_RETURN = 15;
  WASM_INS_CALL = 16;
  WASM_INS_CALL_INDIRECT = 17;
  WASM_INS_DROP = 26;
  WASM_INS_SELECT = 27;
  WASM_INS_GET_LOCAL = 32;
  WASM_INS_SET_LOCAL = 33;
  WASM_INS_TEE_LOCAL = 34;
  WASM_INS_GET_GLOBAL = 35;
  WASM_INS_SET_GLOBAL = 36;
  WASM_INS_I32_LOAD = 40;
  WASM_INS_I64_LOAD = 41;
  WASM_INS_F32_LOAD = 42;
  WASM_INS_F64_LOAD = 43;
  WASM_INS_I32_LOAD8_S = 44;
  WASM_INS_I32_LOAD8_U = 45;
  WASM_INS_I32_LOAD16_S = 46;
  WASM_INS_I32_LOAD16_U = 47;
  WASM_INS_I64_LOAD8_S = 48;
  WASM_INS_I64_LOAD8_U = 49;
  WASM_INS_I64_LOAD16_S = 50;
  WASM_INS_I64_LOAD16_U = 51;
  WASM_INS_I64_LOAD32_S = 52;
  WASM_INS_I64_LOAD32_U = 53;
  WASM_INS_I32_STORE = 54;
  WASM_INS_I64_STORE = 55;
  WASM_INS_F32_STORE = 56;
  WASM_INS_F64_STORE = 57;
  WASM_INS_I32_STORE8 = 58;
  WASM_INS_I32_STORE16 = 59;
  WASM_INS_I64_STORE8 = 60;
  WASM_INS_I64_STORE16 = 61;
  WASM_INS_I64_STORE32 = 62;
  WASM_INS_CURRENT_MEMORY = 63;
  WASM_INS_GROW_MEMORY = 64;
  WASM_INS_I32_CONST = 65;
  WASM_INS_I64_CONST = 66;
  WASM_INS_F32_CONST = 67;
  WASM_INS_F64_CONST = 68;
  WASM_INS_I32_EQZ = 69;
  WASM_INS_I32_EQ = 70;
  WASM_INS_I32_NE = 71;
  WASM_INS_I32_LT_S = 72;
  WASM_INS_I32_LT_U = 73;
  WASM_INS_I32_GT_S = 74;
  WASM_INS_I32_GT_U = 75;
  WASM_INS_I32_LE_S = 76;
  WASM_INS_I32_LE_U = 77;
  WASM_INS_I32_GE_S = 78;
  WASM_INS_I32_GE_U = 79;
  WASM_INS_I64_EQZ = 80;
  WASM_INS_I64_EQ = 81;
  WASM_INS_I64_NE = 82;
  WASM_INS_I64_LT_S = 83;
  WASM_INS_I64_LT_U = 84;
  WASN_INS_I64_GT_S = 85;
  WASM_INS_I64_GT_U = 86;
  WASM_INS_I64_LE_S = 87;
  WASM_INS_I64_LE_U = 88;
  WASM_INS_I64_GE_S = 89;
  WASM_INS_I64_GE_U = 90;
  WASM_INS_F32_EQ = 91;
  WASM_INS_F32_NE = 92;
  WASM_INS_F32_LT = 93;
  WASM_INS_F32_GT = 94;
  WASM_INS_F32_LE = 95;
  WASM_INS_F32_GE = 96;
  WASM_INS_F64_EQ = 97;
  WASM_INS_F64_NE = 98;
  WASM_INS_F64_LT = 99;
  WASM_INS_F64_GT = 100;
  WASM_INS_F64_LE = 101;
  WASM_INS_F64_GE = 102;
  WASM_INS_I32_CLZ = 103;
  WASM_INS_I32_CTZ = 104;
  WASM_INS_I32_POPCNT = 105;
  WASM_INS_I32_ADD = 106;
  WASM_INS_I32_SUB = 107;
  WASM_INS_I32_MUL = 108;
  WASM_INS_I32_DIV_S = 109;
  WASM_INS_I32_DIV_U = 110;
  WASM_INS_I32_REM_S = 111;
  WASM_INS_I32_REM_U = 112;
  WASM_INS_I32_AND = 113;
  WASM_INS_I32_OR = 114;
  WASM_INS_I32_XOR = 115;
  WASM_INS_I32_SHL = 116;
  WASM_INS_I32_SHR_S = 117;
  WASM_INS_I32_SHR_U = 118;
  WASM_INS_I32_ROTL = 119;
  WASM_INS_I32_ROTR = 120;
  WASM_INS_I64_CLZ = 121;
  WASM_INS_I64_CTZ = 122;
  WASM_INS_I64_POPCNT = 123;
  WASM_INS_I64_ADD = 124;
  WASM_INS_I64_SUB = 125;
  WASM_INS_I64_MUL = 126;
  WASM_INS_I64_DIV_S = 127;
  WASM_INS_I64_DIV_U = 128;
  WASM_INS_I64_REM_S = 129;
  WASM_INS_I64_REM_U = 130;
  WASM_INS_I64_AND = 131;
  WASM_INS_I64_OR = 132;
  WASM_INS_I64_XOR = 133;
  WASM_INS_I64_SHL = 134;
  WASM_INS_I64_SHR_S = 135;
  WASM_INS_I64_SHR_U = 136;
  WASM_INS_I64_ROTL = 137;
  WASM_INS_I64_ROTR = 138;
  WASM_INS_F32_ABS = 139;
  WASM_INS_F32_NEG = 140;
  WASM_INS_F32_CEIL = 141;
  WASM_INS_F32_FLOOR = 142;
  WASM_INS_F32_TRUNC = 143;
  WASM_INS_F32_NEAREST = 144;
  WASM_INS_F32_SQRT = 145;
  WASM_INS_F32_ADD = 146;
  WASM_INS_F32_SUB = 147;
  WASM_INS_F32_MUL = 148;
  WASM_INS_F32_DIV = 149;
  WASM_INS_F32_MIN = 150;
  WASM_INS_F32_MAX = 151;
  WASM_INS_F32_COPYSIGN = 152;
  WASM_INS_F64_ABS = 153;
  WASM_INS_F64_NEG = 154;
  WASM_INS_F64_CEIL = 155;
  WASM_INS_F64_FLOOR = 156;
  WASM_INS_F64_TRUNC = 157;
  WASM_INS_F64_NEAREST = 158;
  WASM_INS_F64_SQRT = 159;
  WASM_INS_F64_ADD = 160;
  WASM_INS_F64_SUB = 161;
  WASM_INS_F64_MUL = 162;
  WASM_INS_F64_DIV = 163;
  WASM_INS_F64_MIN = 164;
  WASM_INS_F64_MAX = 165;
  WASM_INS_F64_COPYSIGN = 166;
  WASM_INS_I32_WARP_I64 = 167;
  WASP_INS_I32_TRUNC_S_F32 = 168;
  WASM_INS_I32_TRUNC_U_F32 = 169;
  WASM_INS_I32_TRUNC_S_F64 = 170;
  WASM_INS_I32_TRUNC_U_F64 = 171;
  WASM_INS_I64_EXTEND_S_I32 = 172;
  WASM_INS_I64_EXTEND_U_I32 = 173;
  WASM_INS_I64_TRUNC_S_F32 = 174;
  WASM_INS_I64_TRUNC_U_F32 = 175;
  WASM_INS_I64_TRUNC_S_F64 = 176;
  WASM_INS_I64_TRUNC_U_F64 = 177;
  WASM_INS_F32_CONVERT_S_I32 = 178;
  WASM_INS_F32_CONVERT_U_I32 = 179;
  WASM_INS_F32_CONVERT_S_I64 = 180;
  WASM_INS_F32_CONVERT_U_I64 = 181;
  WASM_INS_F32_DEMOTE_F64 = 182;
  WASM_INS_F64_CONVERT_S_I32 = 183;
  WASM_INS_F64_CONVERT_U_I32 = 184;
  WASM_INS_F64_CONVERT_S_I64 = 185;
  WASM_INS_F64_CONVERT_U_I64 = 186;
  WASM_INS_F64_PROMOTE_F32 = 187;
  WASM_INS_I32_REINTERPRET_F32 = 188;
  WASM_INS_I64_REINTERPRET_F64 = 189;
  WASM_INS_F32_REINTERPRET_I32 = 190;
  WASM_INS_F64_REINTERPRET_I64 = 191;
  WASM_INS_INVALID = 512;
  WASM_INS_ENDING = 513;

/// Group of WASM instructions
type
  wasm_insn_group = Integer;
  Pwasm_insn_group = ^wasm_insn_group;

const
  /// = CS_GRP_INVALID
  WASM_GRP_INVALID = 0;
  WASM_GRP_NUMBERIC = 8;
  WASM_GRP_PARAMETRIC = 9;
  WASM_GRP_VARIABLE = 10;
  WASM_GRP_MEMORY = 11;
  WASM_GRP_CONTROL = 12;
  /// <-- mark the end of the list of groups
  WASM_GRP_ENDING = 13;

type
  // Forward declarations
  Pcs_wasm_brtable = ^cs_wasm_brtable;
  Pcs_wasm_op = ^cs_wasm_op;
  Pcs_wasm = ^cs_wasm;

  cs_wasm_brtable = record
    length: UInt32;
    address: UInt64;
    default_target: UInt32;
  end;

  _anonymous_type_1 = record
    case Integer of
      0: (int7: Int8);
      1: (varuint32: UInt32);
      2: (varuint64: UInt64);
      3: (uint32: UInt32);
      4: (uint64: UInt64);
      5: (immediate: array[0..1] of UInt32);
      6: (brtable: cs_wasm_brtable);
  end;

  cs_wasm_op = record
    type_: wasm_op_type;
    size: UInt32;
    /// union detail
    detail: _anonymous_type_1;
  end;

  /// Instruction structure
  cs_wasm = record
    op_count: UInt8;
    operands: array[0..1] of cs_wasm_op;
  end;

implementation

end.
