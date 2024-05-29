{ ***************************************************** }
{                                                       }
{  Pascal language binding for the Capstone engine      }
{                                                       }
{  Unit Name: test_iter                                 }
{     Author: Lsuper 2024.05.01                         }
{    Purpose: tests\test_iter.c                         }
{                                                       }
{  Copyright (c) 1998-2024 Super Studio                 }
{                                                       }
{ ***************************************************** }

program test_iter;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows, Capstone.Api, test_utils;

procedure Test;
const
{$IFDEF CAPSTONE_HAS_X86}
  X86_CODE16: array[0..11] of Byte = (
    $8D, $4C, $32, $08, $01, $D8, $81, $C6, $34, $12, $00, $00
  );
  X86_CODE32: array[0..11] of Byte = (
    $8D, $4C, $32, $08, $01, $D8, $81, $C6, $34, $12, $00, $00
  );
  X86_CODE64: array[0..7] of Byte = (
    $55, $48, $8B, $05, $B8, $13, $00, $00);
{$ENDIF}
{$IFDEF CAPSTONE_HAS_ARM}
  ARM_CODE: array[0..31] of Byte = (
    $ED, $FF, $FF, $EB, $04, $E0, $2D, $E5, $00, $00, $00, $00, $E0, $83, $22, $E5,
    $F1, $02, $03, $0E, $00, $00, $A0, $E3, $02, $30, $C1, $E7, $00, $00, $53, $E3
  );
  ARM_CODE2: array[0..15] of Byte = (
    $10, $F1, $10, $E7, $11, $F2, $31, $E7, $DC, $A1, $2E, $F3, $E8, $4E, $62, $F3
  );
  THUMB_CODE: array[0..7] of Byte = (
    $70, $47, $EB, $46, $83, $B0, $C9, $68
  );
  THUMB_CODE2: array[0..11] of Byte = (
    $4F, $F0, $00, $01, $BD, $E8, $00, $88, $D1, $E8, $00, $F0
  );
{$ENDIF}
{$IFDEF CAPSTONE_HAS_MIPS}
  MIPS_CODE: array[0..23] of Byte = (
    $0C, $10, $00, $97, $00, $00, $00, $00, $24, $02, $00, $0C, $8F, $A2, $00, $00,
    $34, $21, $34, $56, $00, $80, $04, $08
  );
  MIPS_CODE2: array[0..7] of Byte = (
    $56, $34, $21, $34, $C2, $17, $01, $00
  );
{$ENDIF}
{$IFDEF CAPSTONE_HAS_ARM64}
  ARM64_CODE: array[0..67] of Byte = (
    $09, $00, $38, $D5, $BF, $40, $00, $D5, $0C, $05, $13, $D5, $20, $50, $02, $0E,
    $20, $E4, $3D, $0F, $00, $18, $A0, $5F, $A2, $00, $AE, $9E, $9F, $37, $03, $D5,
    $BF, $33, $03, $D5, $DF, $3F, $03, $D5, $21, $7C, $02, $9B, $21, $7C, $00, $53,
    $00, $40, $21, $4B, $E1, $0B, $40, $B9, $20, $04, $81, $DA, $20, $08, $02, $8B,
    $10, $5B, $E8, $3C
  );
{$ENDIF}
{$IFDEF CAPSTONE_HAS_POWERPC}
  PPC_CODE: array[0..43] of Byte = (
    $80, $20, $00, $00, $80, $3F, $00, $00, $10, $43, $23, $0E, $D0, $44, $00, $80,
    $4C, $43, $22, $02, $2D, $03, $00, $80, $7C, $43, $20, $14, $7C, $43, $20, $93,
    $4F, $20, $00, $21, $4C, $C8, $00, $21, $40, $82, $00, $14
  );
{$ENDIF}
{$IFDEF CAPSTONE_HAS_SPARC}
  SPARC_CODE: array[0..63] of Byte = (
    $80, $A0, $40, $02, $85, $C2, $60, $08, $85, $E8, $20, $01, $81, $E8, $00, $00,
    $90, $10, $20, $01, $D5, $F6, $10, $16, $21, $00, $00, $0A, $86, $00, $40, $02,
    $01, $00, $00, $00, $12, $BF, $FF, $FF, $10, $BF, $FF, $FF, $A0, $02, $00, $09,
    $0D, $BF, $FF, $FF, $D4, $20, $60, $00, $D4, $4E, $00, $16, $2A, $C2, $80, $03
  );
  SPARCV9_CODE: array[0..15] of Byte = (
    $81, $A8, $0A, $24, $89, $A0, $10, $20, $89, $A0, $1A, $60, $89, $A0, $00, $E0
  );
{$ENDIF}
{$IFDEF CAPSTONE_HAS_SYSZ}
  SYSZ_CODE: array[0..39] of Byte = (
    $ED, $00, $00, $00, $00, $1A, $5A, $0F, $1F, $FF, $C2, $09, $80, $00, $00, $00,
    $07, $F7, $EB, $2A, $FF, $FF, $7F, $57, $E3, $01, $FF, $FF, $7F, $57, $EB, $00,
    $F0, $00, $00, $24, $B2, $4F, $00, $78
  );
{$ENDIF}
{$IFDEF CAPSTONE_HAS_XCORE}
  XCORE_CODE: array[0..27] of Byte = (
    $FE, $0F, $FE, $17, $13, $17, $C6, $FE, $EC, $17, $97, $F8, $EC, $4F, $1F, $FD,
    $EC, $37, $07, $F2, $45, $5B, $F9, $FA, $02, $06, $1B, $10
  );
{$ENDIF}
{$IFDEF CAPSTONE_HAS_M680X}
  M680X_CODE: array[0..34] of Byte = (
    $06, $10, $19, $1A, $55, $1E, $01, $23, $E9, $31, $06, $34, $55, $A6, $81, $A7,
    $89, $7F, $FF, $A6, $9D, $10, $00, $A7, $91, $A6, $9F, $10, $00, $11, $AC, $99,
    $10, $00, $39
  );
{$ENDIF}
const
  Platforms: array[0..16] of TPlatform = (
{$IFDEF CAPSTONE_HAS_X86}
    (arch: CS_ARCH_X86; mode: CS_MODE_16; code: @X86_CODE16[0]; size: Length(X86_CODE16); comment: 'X86 16bit (Intel syntax)'),
    (arch: CS_ARCH_X86; mode: CS_MODE_32; code: @X86_CODE32[0]; size: Length(X86_CODE32); comment: 'X86 32bit (ATT syntax)'; opt_type: CS_OPT_SYNTAX; opt_value: CS_OPT_SYNTAX_ATT),
    (arch: CS_ARCH_X86; mode: CS_MODE_32; code: @X86_CODE32[0]; size: Length(X86_CODE32); comment: 'X86 32 (Intel syntax)'),
    (arch: CS_ARCH_X86; mode: CS_MODE_64; code: @X86_CODE64[0]; size: Length(X86_CODE64); comment: 'X86 64 (Intel syntax)'),
{$ENDIF}
{$IFDEF CAPSTONE_HAS_ARM}
    (arch: CS_ARCH_ARM; mode: CS_MODE_ARM; code: @ARM_CODE[0]; size: Length(ARM_CODE); comment: 'ARM'),
    (arch: CS_ARCH_ARM; mode: CS_MODE_THUMB; code: @THUMB_CODE2[0]; size: Length(THUMB_CODE2); comment: 'THUMB-2'),
    (arch: CS_ARCH_ARM; mode: CS_MODE_ARM; code: @ARM_CODE2[0]; size: Length(ARM_CODE2); comment: 'ARM: Cortex-A15 + NEON'),
    (arch: CS_ARCH_ARM; mode: CS_MODE_THUMB; code: @THUMB_CODE[0]; size: Length(THUMB_CODE); comment: 'THUMB'),
{$ENDIF}
{$IFDEF CAPSTONE_HAS_MIPS}
    (arch: CS_ARCH_MIPS; mode: CS_MODE_MIPS32 + CS_MODE_BIG_ENDIAN; code: @MIPS_CODE[0]; size: Length(MIPS_CODE); comment: 'MIPS-32 (Big-endian)'),
    (arch: CS_ARCH_MIPS; mode: CS_MODE_MIPS64 + CS_MODE_LITTLE_ENDIAN; code: @MIPS_CODE2[0]; size: Length(MIPS_CODE2); comment: 'MIPS-64-EL (Little-endian)'),
{$ENDIF}
{$IFDEF CAPSTONE_HAS_ARM64}
    (arch: CS_ARCH_ARM64; mode: CS_MODE_ARM; code: @ARM64_CODE[0]; size: Length(ARM64_CODE); comment: 'ARM-64'),
{$ENDIF}
{$IFDEF CAPSTONE_HAS_POWERPC}
    (arch: CS_ARCH_PPC; mode: CS_MODE_BIG_ENDIAN; code: @PPC_CODE[0]; size: Length(PPC_CODE); comment: 'PPC-64'),
{$ENDIF}
{$IFDEF CAPSTONE_HAS_SPARC}
    (arch: CS_ARCH_SPARC; mode: CS_MODE_BIG_ENDIAN; code: @SPARC_CODE[0]; size: Length(SPARC_CODE); comment: 'Sparc'),
    (arch: CS_ARCH_SPARC; mode: CS_MODE_BIG_ENDIAN + CS_MODE_V9; code: @SPARCV9_CODE[0]; size: Length(SPARCV9_CODE); comment: 'SparcV9'),
{$ENDIF}
{$IFDEF CAPSTONE_HAS_SYSZ}
    (arch: CS_ARCH_SYSZ; mode: cs_mode(0); code: @SYSZ_CODE[0]; size: Length(SYSZ_CODE); comment: 'SystemZ'),
{$ENDIF}
{$IFDEF CAPSTONE_HAS_XCORE}
    (arch: CS_ARCH_XCORE; mode: cs_mode(0); code: @XCORE_CODE[0]; size: Length(XCORE_CODE); comment: 'XCore'),
{$ENDIF}
{$IFDEF CAPSTONE_HAS_M680X}
    (arch: CS_ARCH_M680X; mode: CS_MODE_M680X_6809; code: @M680X_CODE[0]; size: Length(M680X_CODE); comment: 'M680X_6809')
{$ENDIF}
  );
var
  handle: csh;
  address: UInt64;
  insn: Pcs_insn;
  detail: Pcs_detail;
  i: Integer;
  l: string;
  err: cs_err;
  code: PByte;
  size: Size_t;
  n: Integer;
begin
  for i := Low(Platforms) to High(Platforms) do
  begin
    Writeln('****************');
    Writeln('Platform: ', Platforms[i].comment);

    err := cs_open(Platforms[i].arch, Platforms[i].mode, handle);
    if err <> CS_ERR_OK then
    begin
      Writeln('Failed on cs_open() with error returned: ', err);
      Continue;
    end;

    if Platforms[i].opt_type <> 0 then
      cs_option(handle, Platforms[i].opt_type, Platforms[i].opt_value);

    cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);

    insn := cs_malloc(handle);

    print_string_hex('Code: ', Platforms[i].code, Platforms[i].size);

    Writeln('Disasm:');
    address := $1000;
    code := Platforms[i].code;
    size := Platforms[i].size;
    while cs_disasm_iter(handle, code, size, address, insn) do
    begin
      l := '0x' + format_string_hex(insn.address, '%.4x');
      l := Format('%s:'#9'%s'#9#9'%s // insn-ID: %d, insn-mnem: %s', [
        l, insn.mnemonic, insn.op_str, insn.id, cs_insn_name(handle, insn.id)]);
      WriteLn(l);

      detail := insn.detail;

      if detail.regs_read_count > 0 then
      begin
        l := #9'Implicit registers read: ';
        for n := 0 to detail.regs_read_count - 1 do
          l := l + string(cs_reg_name(handle, detail.regs_read[n])) + ' ';
        Writeln(l);
      end;

      if detail.regs_write_count > 0 then
      begin
        l := #9'Implicit registers modified: ';
        for n := 0 to detail.regs_write_count - 1 do
          l := l + string(cs_reg_name(handle, detail.regs_write[n])) + ' ';
        Writeln(l);
      end;

      if detail.groups_count > 0 then
      begin
        l := #9'This instruction belongs to groups: ';
        for n := 0 to detail.groups_count - 1 do
          l := l + string(cs_group_name(handle, detail.groups[n])) + ' ';
        Writeln(l);
      end;
    end;

    Writeln('');
    cs_free(insn, 1);
    cs_close(handle);
  end;
end;

begin
  try
    Test;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
