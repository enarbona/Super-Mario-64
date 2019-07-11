
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "macros.inc"


.section .text, "ax" 
  
glabel __osExceptionPreamble
	lui   $k0, %hi(__osException) # $k0, 0x8032
	addiu $k0, %lo(__osException) # addiu $k0, $k0, 0x66d0
	jr    $k0
	 nop   


glabel __osException
/* 0E16D0 803266D0 3C1A8036 */  lui   $k0, %hi(gInterruptedThread) # $k0, 0x8036
/* 0E16D4 803266D4 275A5F40 */  addiu $k0, %lo(gInterruptedThread) # addiu $k0, $k0, 0x5f40
/* 0E16D8 803266D8 FF410020 */  sd    $at, 0x20($k0)
/* 0E16DC 803266DC 401B6000 */  mfc0  $k1, $12
/* 0E16E0 803266E0 AF5B0118 */  sw    $k1, 0x118($k0)
/* 0E16E4 803266E4 2401FFFC */  li    $at, -4
/* 0E16E8 803266E8 0361D824 */  and   $k1, $k1, $at
/* 0E16EC 803266EC 409B6000 */  mtc0  $k1, $12
/* 0E16F0 803266F0 FF480058 */  sd    $t0, 0x58($k0)
/* 0E16F4 803266F4 FF490060 */  sd    $t1, 0x60($k0)
/* 0E16F8 803266F8 FF4A0068 */  sd    $t2, 0x68($k0)
/* 0E16FC 803266FC AF400018 */  sw    $zero, 0x18($k0)
/* 0E1700 80326700 40086800 */  mfc0  $t0, $13
/* 0E1704 80326704 3109007C */  andi  $t1, $t0, 0x7c
/* 0E1708 80326708 240A0000 */  li    $t2, 0
/* 0E170C 8032670C 152A0010 */  bne   $t1, $t2, .L80326750
/* 0E1710 80326710 00000000 */   nop   
/* 0E1714 80326714 03684824 */  and   $t1, $k1, $t0
/* 0E1718 80326718 312A4000 */  andi  $t2, $t1, 0x4000
/* 0E171C 8032671C 11400005 */  beqz  $t2, .L80326734
/* 0E1720 80326720 00000000 */   nop   
/* 0E1724 80326724 24090001 */  li    $t1, 1
/* 0E1728 80326728 3C018033 */  lui   $at, %hi(D_80334934) # $at, 0x8033
/* 0E172C 8032672C 10000019 */  b     .L80326794
/* 0E1730 80326730 AC294934 */   sw    $t1, %lo(D_80334934)($at)
.L80326734:
/* 0E1734 80326734 312A2000 */  andi  $t2, $t1, 0x2000
/* 0E1738 80326738 11400005 */  beqz  $t2, .L80326750
/* 0E173C 8032673C 00000000 */   nop   
/* 0E1740 80326740 24090001 */  li    $t1, 1
/* 0E1744 80326744 3C018033 */  lui   $at, %hi(D_80334938) # $at, 0x8033
/* 0E1748 80326748 10000012 */  b     .L80326794
/* 0E174C 8032674C AC294938 */   sw    $t1, %lo(D_80334938)($at)
.L80326750:
/* 0E1750 80326750 3C018033 */  lui   $at, %hi(D_80334934) # $at, 0x8033
/* 0E1754 80326754 AC204934 */  sw    $zero, %lo(D_80334934)($at)
/* 0E1758 80326758 3C018033 */  lui   $at, %hi(D_80334938) # $at, 0x8033
/* 0E175C 8032675C 03404025 */  move  $t0, $k0
/* 0E1760 80326760 AC204938 */  sw    $zero, %lo(D_80334938)($at)
/* 0E1764 80326764 3C1A8033 */  lui   $k0, %hi(D_803348A0) # $k0, 0x8033
/* 0E1768 80326768 8F5A48A0 */  lw    $k0, %lo(D_803348A0)($k0)
/* 0E176C 8032676C DD090020 */  ld    $t1, 0x20($t0)
/* 0E1770 80326770 FF490020 */  sd    $t1, 0x20($k0)
/* 0E1774 80326774 DD090118 */  ld    $t1, 0x118($t0)
/* 0E1778 80326778 FF490118 */  sd    $t1, 0x118($k0)
/* 0E177C 8032677C DD090058 */  ld    $t1, 0x58($t0)
/* 0E1780 80326780 FF490058 */  sd    $t1, 0x58($k0)
/* 0E1784 80326784 DD090060 */  ld    $t1, 0x60($t0)
/* 0E1788 80326788 FF490060 */  sd    $t1, 0x60($k0)
/* 0E178C 8032678C DD090068 */  ld    $t1, 0x68($t0)
/* 0E1790 80326790 FF490068 */  sd    $t1, 0x68($k0)
.L80326794:
/* 0E1794 80326794 00004012 */  mflo  $t0
/* 0E1798 80326798 FF480108 */  sd    $t0, 0x108($k0)
/* 0E179C 8032679C 00004010 */  mfhi  $t0
/* 0E17A0 803267A0 FF420028 */  sd    $v0, 0x28($k0)
/* 0E17A4 803267A4 FF430030 */  sd    $v1, 0x30($k0)
/* 0E17A8 803267A8 FF440038 */  sd    $a0, 0x38($k0)
/* 0E17AC 803267AC FF450040 */  sd    $a1, 0x40($k0)
/* 0E17B0 803267B0 FF460048 */  sd    $a2, 0x48($k0)
/* 0E17B4 803267B4 FF470050 */  sd    $a3, 0x50($k0)
/* 0E17B8 803267B8 FF4B0070 */  sd    $t3, 0x70($k0)
/* 0E17BC 803267BC FF4C0078 */  sd    $t4, 0x78($k0)
/* 0E17C0 803267C0 FF4D0080 */  sd    $t5, 0x80($k0)
/* 0E17C4 803267C4 FF4E0088 */  sd    $t6, 0x88($k0)
/* 0E17C8 803267C8 FF4F0090 */  sd    $t7, 0x90($k0)
/* 0E17CC 803267CC FF500098 */  sd    $s0, 0x98($k0)
/* 0E17D0 803267D0 FF5100A0 */  sd    $s1, 0xa0($k0)
/* 0E17D4 803267D4 FF5200A8 */  sd    $s2, 0xa8($k0)
/* 0E17D8 803267D8 FF5300B0 */  sd    $s3, 0xb0($k0)
/* 0E17DC 803267DC FF5400B8 */  sd    $s4, 0xb8($k0)
/* 0E17E0 803267E0 FF5500C0 */  sd    $s5, 0xc0($k0)
/* 0E17E4 803267E4 FF5600C8 */  sd    $s6, 0xc8($k0)
/* 0E17E8 803267E8 FF5700D0 */  sd    $s7, 0xd0($k0)
/* 0E17EC 803267EC FF5800D8 */  sd    $t8, 0xd8($k0)
/* 0E17F0 803267F0 FF5900E0 */  sd    $t9, 0xe0($k0)
/* 0E17F4 803267F4 FF5C00E8 */  sd    $gp, 0xe8($k0)
/* 0E17F8 803267F8 FF5D00F0 */  sd    $sp, 0xf0($k0)
/* 0E17FC 803267FC FF5E00F8 */  sd    $fp, 0xf8($k0)
/* 0E1800 80326800 FF5F0100 */  sd    $ra, 0x100($k0)
/* 0E1804 80326804 FF480110 */  sd    $t0, 0x110($k0)
/* 0E1808 80326808 40087000 */  mfc0  $t0, $14
/* 0E180C 8032680C AF48011C */  sw    $t0, 0x11c($k0)
/* 0E1810 80326810 8F480018 */  lw    $t0, 0x18($k0)
/* 0E1814 80326814 11000014 */  beqz  $t0, .L80326868
/* 0E1818 80326818 00000000 */   nop   
/* 0E181C 8032681C 4448F800 */  cfc1  $t0, $31
/* 0E1820 80326820 00000000 */  nop   
/* 0E1824 80326824 AF48012C */  sw    $t0, 0x12c($k0)
/* 0E1828 80326828 F7400130 */  sdc1  $f0, 0x130($k0)
/* 0E182C 8032682C F7420138 */  sdc1  $f2, 0x138($k0)
/* 0E1830 80326830 F7440140 */  sdc1  $f4, 0x140($k0)
/* 0E1834 80326834 F7460148 */  sdc1  $f6, 0x148($k0)
/* 0E1838 80326838 F7480150 */  sdc1  $f8, 0x150($k0)
/* 0E183C 8032683C F74A0158 */  sdc1  $f10, 0x158($k0)
/* 0E1840 80326840 F74C0160 */  sdc1  $f12, 0x160($k0)
/* 0E1844 80326844 F74E0168 */  sdc1  $f14, 0x168($k0)
/* 0E1848 80326848 F7500170 */  sdc1  $f16, 0x170($k0)
/* 0E184C 8032684C F7520178 */  sdc1  $f18, 0x178($k0)
/* 0E1850 80326850 F7540180 */  sdc1  $f20, 0x180($k0)
/* 0E1854 80326854 F7560188 */  sdc1  $f22, 0x188($k0)
/* 0E1858 80326858 F7580190 */  sdc1  $f24, 0x190($k0)
/* 0E185C 8032685C F75A0198 */  sdc1  $f26, 0x198($k0)
/* 0E1860 80326860 F75C01A0 */  sdc1  $f28, 0x1a0($k0)
/* 0E1864 80326864 F75E01A8 */  sdc1  $f30, 0x1a8($k0)
.L80326868:
/* 0E1868 80326868 40086800 */  mfc0  $t0, $13
/* 0E186C 8032686C AF480120 */  sw    $t0, 0x120($k0)
/* 0E1870 80326870 3C09A430 */  lui   $t1, %hi(D_A430000C) # $t1, 0xa430
/* 0E1874 80326874 8D29000C */  lw    $t1, %lo(D_A430000C)($t1)
/* 0E1878 80326878 AF490128 */  sw    $t1, 0x128($k0)
/* 0E187C 8032687C 24090002 */  li    $t1, 2
/* 0E1880 80326880 A7490010 */  sh    $t1, 0x10($k0)
/* 0E1884 80326884 3C098033 */  lui   $t1, %hi(D_80334934) # $t1, 0x8033
/* 0E1888 80326888 8D294934 */  lw    $t1, %lo(D_80334934)($t1)
/* 0E188C 8032688C 11200009 */  beqz  $t1, .L803268B4
/* 0E1890 80326890 00000000 */   nop   
/* 0E1894 80326894 3C0AC000 */  lui   $t2, %hi(D_C0000008) # $t2, 0xc000
/* 0E1898 80326898 AD400008 */  sw    $zero, %lo(D_C0000008)($t2)
/* 0E189C 8032689C 3C04C000 */  lui   $a0, 0xc000
/* 0E18A0 803268A0 254A0008 */  addiu $t2, %lo(D_C0000008) # addiu $t2, $t2, 8
/* 0E18A4 803268A4 0C0CA6EE */  jal   kdebugserver
/* 0E18A8 803268A8 8C840000 */   lw    $a0, ($a0)
/* 0E18AC 803268AC 10000156 */  b     .L80326E08
/* 0E18B0 803268B0 00000000 */   nop   
.L803268B4:
/* 0E18B4 803268B4 3C098033 */  lui   $t1, %hi(D_80334938) # $t1, 0x8033
/* 0E18B8 803268B8 8D294938 */  lw    $t1, %lo(D_80334938)($t1)
/* 0E18BC 803268BC 11200010 */  beqz  $t1, .L80326900
/* 0E18C0 803268C0 00000000 */   nop   
/* 0E18C4 803268C4 3C0AC000 */  lui   $t2, %hi(D_C000000C) # $t2, 0xc000
/* 0E18C8 803268C8 AD40000C */  sw    $zero, %lo(D_C000000C)($t2)
/* 0E18CC 803268CC 3C098033 */  lui   $t1, %hi(D_80334A40) # $t1, 0x8033
/* 0E18D0 803268D0 8D294A40 */  lw    $t1, %lo(D_80334A40)($t1)
/* 0E18D4 803268D4 254A000C */  addiu $t2, %lo(D_C000000C) # addiu $t2, $t2, 0xc
/* 0E18D8 803268D8 11200003 */  beqz  $t1, .L803268E8
/* 0E18DC 803268DC 00000000 */   nop   
/* 0E18E0 803268E0 0C0C9B06 */  jal   send_mesg
/* 0E18E4 803268E4 24040078 */   li    $a0, 120
.L803268E8:
/* 0E18E8 803268E8 3C098033 */  lui   $t1, %hi(D_80334A44) # $t1, 0x8033
/* 0E18EC 803268EC 8D294A44 */  lw    $t1, %lo(D_80334A44)($t1)
/* 0E18F0 803268F0 3C018033 */  lui   $at, %hi(D_80334A44) # $at, 0x8033
/* 0E18F4 803268F4 21290001 */  addi  $t1, $t1, 1
/* 0E18F8 803268F8 10000143 */  b     .L80326E08
/* 0E18FC 803268FC AC294A44 */   sw    $t1, %lo(D_80334A44)($at)
.L80326900:
/* 0E1900 80326900 3109007C */  andi  $t1, $t0, 0x7c
/* 0E1904 80326904 240A0024 */  li    $t2, 36
/* 0E1908 80326908 112A009E */  beq   $t1, $t2, .L80326B84
/* 0E190C 8032690C 00000000 */   nop   
/* 0E1910 80326910 240A002C */  li    $t2, 44
/* 0E1914 80326914 112A00ED */  beq   $t1, $t2, .L80326CCC
/* 0E1918 80326918 00000000 */   nop   
/* 0E191C 8032691C 240A0000 */  li    $t2, 0
/* 0E1920 80326920 152A00B1 */  bne   $t1, $t2, .L80326BE8
/* 0E1924 80326924 00000000 */   nop   
/* 0E1928 80326928 03688024 */  and   $s0, $k1, $t0
.L8032692C:
/* 0E192C 8032692C 3209FF00 */  andi  $t1, $s0, 0xff00
/* 0E1930 80326930 00095302 */  srl   $t2, $t1, 0xc
/* 0E1934 80326934 15400003 */  bnez  $t2, .L80326944
/* 0E1938 80326938 00000000 */   nop   
/* 0E193C 8032693C 00095202 */  srl   $t2, $t1, 8
/* 0E1940 80326940 214A0010 */  addi  $t2, $t2, 0x10
.L80326944:
/* 0E1944 80326944 3C018034 */  lui   $at, %hi(D_80338610)
/* 0E1948 80326948 002A0821 */  addu  $at, $at, $t2
/* 0E194C 8032694C 902A8610 */  lbu   $t2, %lo(D_80338610)($at)
/* 0E1950 80326950 3C018034 */  lui   $at, %hi(jtbl_80338630)
/* 0E1954 80326954 002A0821 */  addu  $at, $at, $t2
/* 0E1958 80326958 8C2A8630 */  lw    $t2, %lo(jtbl_80338630)($at)
/* 0E195C 8032695C 01400008 */  jr    $t2
/* 0E1960 80326960 00000000 */   nop   
glabel L80326964
/* 0E1964 80326964 40095800 */  mfc0  $t1, $11
/* 0E1968 80326968 40895800 */  mtc0  $t1, $11
/* 0E196C 8032696C 0C0C9B06 */  jal   send_mesg
/* 0E1970 80326970 24040018 */   li    $a0, 24
/* 0E1974 80326974 3C01FFFF */  lui   $at, (0xFFFF7FFF >> 16) # lui $at, 0xffff
/* 0E1978 80326978 34217FFF */  ori   $at, (0xFFFF7FFF & 0xFFFF) # ori $at, $at, 0x7fff
/* 0E197C 8032697C 1000FFEB */  b     .L8032692C
/* 0E1980 80326980 02018024 */   and   $s0, $s0, $at
glabel L80326984
/* 0E1984 80326984 240A0004 */  li    $t2, 4
/* 0E1988 80326988 3C018033 */  lui   $at, %hi(D_80334920)
/* 0E198C 8032698C 002A0821 */  addu  $at, $at, $t2
/* 0E1990 80326990 8C2A4920 */  lw    $t2, %lo(D_80334920)($at)
/* 0E1994 80326994 11400003 */  beqz  $t2, .L803269A4
/* 0E1998 80326998 00000000 */   nop   
/* 0E199C 8032699C 0140F809 */  jalr  $t2
/* 0E19A0 803269A0 00000000 */  nop   
.L803269A4:
/* 0E19A4 803269A4 0C0C9B06 */  jal   send_mesg
/* 0E19A8 803269A8 24040010 */   li    $a0, 16
/* 0E19AC 803269AC 2401F7FF */  li    $at, -2049
/* 0E19B0 803269B0 1000FFDE */  b     .L8032692C
/* 0E19B4 803269B4 02018024 */   and   $s0, $s0, $at
glabel L803269B8
/* 0E19B8 803269B8 3C11A430 */  lui   $s1, %hi(D_A4300008) # $s1, 0xa430
/* 0E19BC 803269BC 8E310008 */  lw    $s1, %lo(D_A4300008)($s1)
/* 0E19C0 803269C0 3231003F */  andi  $s1, $s1, 0x3f
/* 0E19C4 803269C4 32290001 */  andi  $t1, $s1, 1
/* 0E19C8 803269C8 11200013 */  beqz  $t1, .L80326A18
/* 0E19CC 803269CC 00000000 */   nop   
/* 0E19D0 803269D0 3C0CA404 */  lui   $t4, %hi(D_A4040010) # $t4, 0xa404
/* 0E19D4 803269D4 8D8C0010 */  lw    $t4, %lo(D_A4040010)($t4)
/* 0E19D8 803269D8 24090008 */  li    $t1, 8
/* 0E19DC 803269DC 3C01A404 */  lui   $at, %hi(D_A4040010) # $at, 0xa404
/* 0E19E0 803269E0 318C0300 */  andi  $t4, $t4, 0x300
/* 0E19E4 803269E4 3231003E */  andi  $s1, $s1, 0x3e
/* 0E19E8 803269E8 11800007 */  beqz  $t4, .L80326A08
/* 0E19EC 803269EC AC290010 */   sw    $t1, %lo(D_A4040010)($at)
/* 0E19F0 803269F0 0C0C9B06 */  jal   send_mesg
/* 0E19F4 803269F4 24040020 */   li    $a0, 32
/* 0E19F8 803269F8 12200038 */  beqz  $s1, .L80326ADC
/* 0E19FC 803269FC 00000000 */   nop   
/* 0E1A00 80326A00 10000005 */  b     .L80326A18
/* 0E1A04 80326A04 00000000 */   nop   
.L80326A08:
/* 0E1A08 80326A08 0C0C9B06 */  jal   send_mesg
/* 0E1A0C 80326A0C 24040058 */   li    $a0, 88
/* 0E1A10 80326A10 12200032 */  beqz  $s1, .L80326ADC
/* 0E1A14 80326A14 00000000 */   nop   
.L80326A18:
/* 0E1A18 80326A18 32290008 */  andi  $t1, $s1, 8
/* 0E1A1C 80326A1C 11200007 */  beqz  $t1, .L80326A3C
/* 0E1A20 80326A20 3C01A440 */   lui   $at, %hi(D_A4400010) # $at, 0xa440
/* 0E1A24 80326A24 32310037 */  andi  $s1, $s1, 0x37
/* 0E1A28 80326A28 AC200010 */  sw    $zero, %lo(D_A4400010)($at)
/* 0E1A2C 80326A2C 0C0C9B06 */  jal   send_mesg
/* 0E1A30 80326A30 24040038 */   li    $a0, 56
/* 0E1A34 80326A34 12200029 */  beqz  $s1, .L80326ADC
/* 0E1A38 80326A38 00000000 */   nop   
.L80326A3C:
/* 0E1A3C 80326A3C 32290004 */  andi  $t1, $s1, 4
/* 0E1A40 80326A40 11200009 */  beqz  $t1, .L80326A68
/* 0E1A44 80326A44 00000000 */   nop   
/* 0E1A48 80326A48 24090001 */  li    $t1, 1
/* 0E1A4C 80326A4C 3C01A450 */  lui   $at, %hi(D_A450000C) # $at, 0xa450
/* 0E1A50 80326A50 3231003B */  andi  $s1, $s1, 0x3b
/* 0E1A54 80326A54 AC29000C */  sw    $t1, %lo(D_A450000C)($at)
/* 0E1A58 80326A58 0C0C9B06 */  jal   send_mesg
/* 0E1A5C 80326A5C 24040030 */   li    $a0, 48
/* 0E1A60 80326A60 1220001E */  beqz  $s1, .L80326ADC
/* 0E1A64 80326A64 00000000 */   nop   
.L80326A68:
/* 0E1A68 80326A68 32290002 */  andi  $t1, $s1, 2
/* 0E1A6C 80326A6C 11200007 */  beqz  $t1, .L80326A8C
/* 0E1A70 80326A70 3C01A480 */   lui   $at, %hi(D_A4800018) # $at, 0xa480
/* 0E1A74 80326A74 3231003D */  andi  $s1, $s1, 0x3d
/* 0E1A78 80326A78 AC200018 */  sw    $zero, %lo(D_A4800018)($at)
/* 0E1A7C 80326A7C 0C0C9B06 */  jal   send_mesg
/* 0E1A80 80326A80 24040028 */   li    $a0, 40
/* 0E1A84 80326A84 12200015 */  beqz  $s1, .L80326ADC
/* 0E1A88 80326A88 00000000 */   nop   
.L80326A8C:
/* 0E1A8C 80326A8C 32290010 */  andi  $t1, $s1, 0x10
/* 0E1A90 80326A90 11200009 */  beqz  $t1, .L80326AB8
/* 0E1A94 80326A94 00000000 */   nop   
/* 0E1A98 80326A98 24090002 */  li    $t1, 2
/* 0E1A9C 80326A9C 3C01A460 */  lui   $at, %hi(D_A4600010) # $at, 0xa460
/* 0E1AA0 80326AA0 3231002F */  andi  $s1, $s1, 0x2f
/* 0E1AA4 80326AA4 AC290010 */  sw    $t1, %lo(D_A4600010)($at)
/* 0E1AA8 80326AA8 0C0C9B06 */  jal   send_mesg
/* 0E1AAC 80326AAC 24040040 */   li    $a0, 64
/* 0E1AB0 80326AB0 1220000A */  beqz  $s1, .L80326ADC
/* 0E1AB4 80326AB4 00000000 */   nop   
.L80326AB8:
/* 0E1AB8 80326AB8 32290020 */  andi  $t1, $s1, 0x20
/* 0E1ABC 80326ABC 11200007 */  beqz  $t1, .L80326ADC
/* 0E1AC0 80326AC0 00000000 */   nop   
/* 0E1AC4 80326AC4 24090800 */  li    $t1, 2048
/* 0E1AC8 80326AC8 3C01A430 */  lui   $at, 0xa430
/* 0E1ACC 80326ACC 3231001F */  andi  $s1, $s1, 0x1f
/* 0E1AD0 80326AD0 AC290000 */  sw    $t1, ($at)
/* 0E1AD4 80326AD4 0C0C9B06 */  jal   send_mesg
/* 0E1AD8 80326AD8 24040048 */   li    $a0, 72
.L80326ADC:
/* 0E1ADC 80326ADC 2401FBFF */  li    $at, -1025
/* 0E1AE0 80326AE0 1000FF92 */  b     .L8032692C
/* 0E1AE4 80326AE4 02018024 */   and   $s0, $s0, $at
glabel L80326AE8
/* 0E1AE8 80326AE8 8F5B0118 */  lw    $k1, 0x118($k0)
/* 0E1AEC 80326AEC 2401EFFF */  li    $at, -4097
/* 0E1AF0 80326AF0 3C098033 */  lui   $t1, %hi(D_80334808) # $t1, 0x8033
/* 0E1AF4 80326AF4 0361D824 */  and   $k1, $k1, $at
/* 0E1AF8 80326AF8 AF5B0118 */  sw    $k1, 0x118($k0)
/* 0E1AFC 80326AFC 25294808 */  addiu $t1, %lo(D_80334808) # addiu $t1, $t1, 0x4808
/* 0E1B00 80326B00 8D2A0000 */  lw    $t2, ($t1)
/* 0E1B04 80326B04 11400003 */  beqz  $t2, .L80326B14
/* 0E1B08 80326B08 2401EFFF */   li    $at, -4097
/* 0E1B0C 80326B0C 10000023 */  b     .L80326B9C
/* 0E1B10 80326B10 02018024 */   and   $s0, $s0, $at
.L80326B14:
/* 0E1B14 80326B14 240A0001 */  li    $t2, 1
/* 0E1B18 80326B18 AD2A0000 */  sw    $t2, ($t1)
/* 0E1B1C 80326B1C 0C0C9B06 */  jal   send_mesg
/* 0E1B20 80326B20 24040070 */   li    $a0, 112
/* 0E1B24 80326B24 3C0A8033 */  lui   $t2, %hi(D_80334898) # $t2, 0x8033
/* 0E1B28 80326B28 8D4A4898 */  lw    $t2, %lo(D_80334898)($t2)
/* 0E1B2C 80326B2C 2401EFFF */  li    $at, -4097
/* 0E1B30 80326B30 02018024 */  and   $s0, $s0, $at
/* 0E1B34 80326B34 8D5B0118 */  lw    $k1, 0x118($t2)
/* 0E1B38 80326B38 0361D824 */  and   $k1, $k1, $at
/* 0E1B3C 80326B3C 10000017 */  b     .L80326B9C
/* 0E1B40 80326B40 AD5B0118 */   sw    $k1, 0x118($t2)
glabel L80326B44
/* 0E1B44 80326B44 2401FDFF */  li    $at, -513
/* 0E1B48 80326B48 01014024 */  and   $t0, $t0, $at
/* 0E1B4C 80326B4C 40886800 */  mtc0  $t0, $13
/* 0E1B50 80326B50 0C0C9B06 */  jal   send_mesg
/* 0E1B54 80326B54 24040008 */   li    $a0, 8
/* 0E1B58 80326B58 2401FDFF */  li    $at, -513
/* 0E1B5C 80326B5C 1000FF73 */  b     .L8032692C
/* 0E1B60 80326B60 02018024 */   and   $s0, $s0, $at
glabel L80326B64
/* 0E1B64 80326B64 2401FEFF */  li    $at, -257
/* 0E1B68 80326B68 01014024 */  and   $t0, $t0, $at
/* 0E1B6C 80326B6C 40886800 */  mtc0  $t0, $13
/* 0E1B70 80326B70 0C0C9B06 */  jal   send_mesg
/* 0E1B74 80326B74 24040000 */   li    $a0, 0
/* 0E1B78 80326B78 2401FEFF */  li    $at, -257
/* 0E1B7C 80326B7C 1000FF6B */  b     .L8032692C
/* 0E1B80 80326B80 02018024 */   and   $s0, $s0, $at
.L80326B84:
/* 0E1B84 80326B84 24090001 */  li    $t1, 1
/* 0E1B88 80326B88 A7490012 */  sh    $t1, 0x12($k0)
/* 0E1B8C 80326B8C 0C0C9B06 */  jal   send_mesg
/* 0E1B90 80326B90 24040050 */   li    $a0, 80
/* 0E1B94 80326B94 10000001 */  b     .L80326B9C
/* 0E1B98 80326B98 00000000 */   nop   
.L80326B9C:
glabel L80326B9C
/* 0E1B9C 80326B9C 3C0A8033 */  lui   $t2, %hi(D_80334898) # $t2, 0x8033
/* 0E1BA0 80326BA0 8D4A4898 */  lw    $t2, %lo(D_80334898)($t2)
/* 0E1BA4 80326BA4 8F490004 */  lw    $t1, 4($k0)
/* 0E1BA8 80326BA8 8D4B0004 */  lw    $t3, 4($t2)
/* 0E1BAC 80326BAC 012B082A */  slt   $at, $t1, $t3
/* 0E1BB0 80326BB0 10200007 */  beqz  $at, .L80326BD0
/* 0E1BB4 80326BB4 00000000 */   nop   
/* 0E1BB8 80326BB8 3C048033 */  lui   $a0, %hi(D_80334898) # $a0, 0x8033
/* 0E1BBC 80326BBC 03402825 */  move  $a1, $k0
/* 0E1BC0 80326BC0 0C0C9B64 */  jal   __osEnqueueThread
/* 0E1BC4 80326BC4 24844898 */   addiu $a0, %lo(D_80334898) # addiu $a0, $a0, 0x4898
/* 0E1BC8 80326BC8 080C9B7A */  j     __osDispatchThread
/* 0E1BCC 80326BCC 00000000 */   nop   

.L80326BD0:
/* 0E1BD0 80326BD0 3C098033 */  lui   $t1, %hi(D_80334898) # $t1, 0x8033
/* 0E1BD4 80326BD4 25294898 */  addiu $t1, %lo(D_80334898) # addiu $t1, $t1, 0x4898
/* 0E1BD8 80326BD8 8D2A0000 */  lw    $t2, ($t1)
/* 0E1BDC 80326BDC AF4A0000 */  sw    $t2, ($k0)
/* 0E1BE0 80326BE0 080C9B7A */  j     __osDispatchThread
/* 0E1BE4 80326BE4 AD3A0000 */   sw    $k0, ($t1)

.L80326BE8:
glabel L80326BE8
/* 0E1BE8 80326BE8 3C018033 */  lui   $at, %hi(D_803348A4) # $at, 0x8033
/* 0E1BEC 80326BEC AC3A48A4 */  sw    $k0, %lo(D_803348A4)($at)
/* 0E1BF0 80326BF0 24090001 */  li    $t1, 1
/* 0E1BF4 80326BF4 A7490010 */  sh    $t1, 0x10($k0)
/* 0E1BF8 80326BF8 24090002 */  li    $t1, 2
/* 0E1BFC 80326BFC A7490012 */  sh    $t1, 0x12($k0)
/* 0E1C00 80326C00 400A4000 */  mfc0  $t2, $8
/* 0E1C04 80326C04 AF4A0124 */  sw    $t2, 0x124($k0)
/* 0E1C08 80326C08 0C0C9B06 */  jal   send_mesg
/* 0E1C0C 80326C0C 24040060 */   li    $a0, 96
/* 0E1C10 80326C10 080C9B7A */  j     __osDispatchThread
/* 0E1C14 80326C14 00000000 */   nop   

glabel send_mesg
/* 0E1C18 80326C18 3C0A8036 */  lui   $t2, %hi(D_80363830) # $t2, 0x8036
/* 0E1C1C 80326C1C 254A3830 */  addiu $t2, %lo(D_80363830) # addiu $t2, $t2, 0x3830
/* 0E1C20 80326C20 01445021 */  addu  $t2, $t2, $a0
/* 0E1C24 80326C24 8D490000 */  lw    $t1, ($t2)
/* 0E1C28 80326C28 03E09025 */  move  $s2, $ra
/* 0E1C2C 80326C2C 11200025 */  beqz  $t1, .L80326CC4
/* 0E1C30 80326C30 00000000 */   nop   
/* 0E1C34 80326C34 8D2B0008 */  lw    $t3, 8($t1)
/* 0E1C38 80326C38 8D2C0010 */  lw    $t4, 0x10($t1)
/* 0E1C3C 80326C3C 016C082A */  slt   $at, $t3, $t4
/* 0E1C40 80326C40 10200020 */  beqz  $at, .L80326CC4
/* 0E1C44 80326C44 00000000 */   nop   
/* 0E1C48 80326C48 8D2D000C */  lw    $t5, 0xc($t1)
/* 0E1C4C 80326C4C 01AB6821 */  addu  $t5, $t5, $t3
/* 0E1C50 80326C50 01AC001A */  div   $zero, $t5, $t4
/* 0E1C54 80326C54 15800002 */  bnez  $t4, .L80326C60
/* 0E1C58 80326C58 00000000 */   nop   
/* 0E1C5C 80326C5C 0007000D */  break 7
.L80326C60:
/* 0E1C60 80326C60 2401FFFF */  li    $at, -1
/* 0E1C64 80326C64 15810004 */  bne   $t4, $at, .L80326C78
/* 0E1C68 80326C68 3C018000 */   lui   $at, 0x8000
/* 0E1C6C 80326C6C 15A10002 */  bne   $t5, $at, .L80326C78
/* 0E1C70 80326C70 00000000 */   nop   
/* 0E1C74 80326C74 0006000D */  break 6
.L80326C78:
/* 0E1C78 80326C78 8D2C0014 */  lw    $t4, 0x14($t1)
/* 0E1C7C 80326C7C 00006810 */  mfhi  $t5
/* 0E1C80 80326C80 000D6880 */  sll   $t5, $t5, 2
/* 0E1C84 80326C84 018D6021 */  addu  $t4, $t4, $t5
/* 0E1C88 80326C88 8D4D0004 */  lw    $t5, 4($t2)
/* 0E1C8C 80326C8C 256A0001 */  addiu $t2, $t3, 1
/* 0E1C90 80326C90 AD8D0000 */  sw    $t5, ($t4)
/* 0E1C94 80326C94 AD2A0008 */  sw    $t2, 8($t1)
/* 0E1C98 80326C98 8D2A0000 */  lw    $t2, ($t1)
/* 0E1C9C 80326C9C 8D4B0000 */  lw    $t3, ($t2)
/* 0E1CA0 80326CA0 11600008 */  beqz  $t3, .L80326CC4
/* 0E1CA4 80326CA4 00000000 */   nop   
/* 0E1CA8 80326CA8 0C0C9B76 */  jal   __osPopThread
/* 0E1CAC 80326CAC 01202025 */   move  $a0, $t1
/* 0E1CB0 80326CB0 00405025 */  move  $t2, $v0
/* 0E1CB4 80326CB4 3C048033 */  lui   $a0, %hi(D_80334898) # $a0, 0x8033
/* 0E1CB8 80326CB8 01402825 */  move  $a1, $t2
/* 0E1CBC 80326CBC 0C0C9B64 */  jal   __osEnqueueThread
/* 0E1CC0 80326CC0 24844898 */   addiu $a0, %lo(D_80334898) # addiu $a0, $a0, 0x4898
.L80326CC4:
/* 0E1CC4 80326CC4 02400008 */  jr    $s2
/* 0E1CC8 80326CC8 00000000 */   nop   
.L80326CCC:
/* 0E1CCC 80326CCC 3C013000 */  lui   $at, 0x3000
/* 0E1CD0 80326CD0 01014824 */  and   $t1, $t0, $at
/* 0E1CD4 80326CD4 00094F02 */  srl   $t1, $t1, 0x1c
/* 0E1CD8 80326CD8 240A0001 */  li    $t2, 1
/* 0E1CDC 80326CDC 152AFFC2 */  bne   $t1, $t2, .L80326BE8
/* 0E1CE0 80326CE0 00000000 */   nop   
/* 0E1CE4 80326CE4 8F5B0118 */  lw    $k1, 0x118($k0)
/* 0E1CE8 80326CE8 3C012000 */  lui   $at, 0x2000
/* 0E1CEC 80326CEC 24090001 */  li    $t1, 1
/* 0E1CF0 80326CF0 0361D825 */  or    $k1, $k1, $at
/* 0E1CF4 80326CF4 AF490018 */  sw    $t1, 0x18($k0)
/* 0E1CF8 80326CF8 1000FFB5 */  b     .L80326BD0
/* 0E1CFC 80326CFC AF5B0118 */   sw    $k1, 0x118($k0)


glabel __osEnqueueAndYield
/* 0E1D00 80326D00 3C058033 */  lui   $a1, %hi(D_803348A0) # $a1, 0x8033
/* 0E1D04 80326D04 8CA548A0 */  lw    $a1, %lo(D_803348A0)($a1)
/* 0E1D08 80326D08 40086000 */  mfc0  $t0, $12
/* 0E1D0C 80326D0C 8CBB0018 */  lw    $k1, 0x18($a1)
/* 0E1D10 80326D10 35080002 */  ori   $t0, $t0, 2
/* 0E1D14 80326D14 ACA80118 */  sw    $t0, 0x118($a1)
/* 0E1D18 80326D18 FCB00098 */  sd    $s0, 0x98($a1)
/* 0E1D1C 80326D1C FCB100A0 */  sd    $s1, 0xa0($a1)
/* 0E1D20 80326D20 FCB200A8 */  sd    $s2, 0xa8($a1)
/* 0E1D24 80326D24 FCB300B0 */  sd    $s3, 0xb0($a1)
/* 0E1D28 80326D28 FCB400B8 */  sd    $s4, 0xb8($a1)
/* 0E1D2C 80326D2C FCB500C0 */  sd    $s5, 0xc0($a1)
/* 0E1D30 80326D30 FCB600C8 */  sd    $s6, 0xc8($a1)
/* 0E1D34 80326D34 FCB700D0 */  sd    $s7, 0xd0($a1)
/* 0E1D38 80326D38 FCBC00E8 */  sd    $gp, 0xe8($a1)
/* 0E1D3C 80326D3C FCBD00F0 */  sd    $sp, 0xf0($a1)
/* 0E1D40 80326D40 FCBE00F8 */  sd    $fp, 0xf8($a1)
/* 0E1D44 80326D44 FCBF0100 */  sd    $ra, 0x100($a1)
/* 0E1D48 80326D48 13600009 */  beqz  $k1, .L80326D70
/* 0E1D4C 80326D4C ACBF011C */   sw    $ra, 0x11c($a1)
/* 0E1D50 80326D50 445BF800 */  cfc1  $k1, $31
/* 0E1D54 80326D54 F4B40180 */  sdc1  $f20, 0x180($a1)
/* 0E1D58 80326D58 F4B60188 */  sdc1  $f22, 0x188($a1)
/* 0E1D5C 80326D5C F4B80190 */  sdc1  $f24, 0x190($a1)
/* 0E1D60 80326D60 F4BA0198 */  sdc1  $f26, 0x198($a1)
/* 0E1D64 80326D64 F4BC01A0 */  sdc1  $f28, 0x1a0($a1)
/* 0E1D68 80326D68 F4BE01A8 */  sdc1  $f30, 0x1a8($a1)
/* 0E1D6C 80326D6C ACBB012C */  sw    $k1, 0x12c($a1)
.L80326D70:
/* 0E1D70 80326D70 3C1BA430 */  lui   $k1, %hi(D_A430000C) # $k1, 0xa430
/* 0E1D74 80326D74 8F7B000C */  lw    $k1, %lo(D_A430000C)($k1)
/* 0E1D78 80326D78 10800003 */  beqz  $a0, .L80326D88
/* 0E1D7C 80326D7C ACBB0128 */   sw    $k1, 0x128($a1)
/* 0E1D80 80326D80 0C0C9B64 */  jal   __osEnqueueThread
/* 0E1D84 80326D84 00000000 */   nop   
.L80326D88:
/* 0E1D88 80326D88 080C9B7A */  j     __osDispatchThread
/* 0E1D8C 80326D8C 00000000 */   nop   


#enqueue and pop look like compiled functions?  but there's no easy way to extract them
glabel __osEnqueueThread
/* 0E1D90 80326D90 8C980000 */  lw    $t8, ($a0)
/* 0E1D94 80326D94 8CAF0004 */  lw    $t7, 4($a1)
/* 0E1D98 80326D98 0080C825 */  move  $t9, $a0
/* 0E1D9C 80326D9C 8F0E0004 */  lw    $t6, 4($t8)
/* 0E1DA0 80326DA0 01CF082A */  slt   $at, $t6, $t7
/* 0E1DA4 80326DA4 14200007 */  bnez  $at, .L80326DC4
/* 0E1DA8 80326DA8 00000000 */   nop   
.L80326DAC:
/* 0E1DAC 80326DAC 0300C825 */  move  $t9, $t8
/* 0E1DB0 80326DB0 8F180000 */  lw    $t8, ($t8)
/* 0E1DB4 80326DB4 8F0E0004 */  lw    $t6, 4($t8)
/* 0E1DB8 80326DB8 01CF082A */  slt   $at, $t6, $t7
/* 0E1DBC 80326DBC 1020FFFB */  beqz  $at, .L80326DAC
/* 0E1DC0 80326DC0 00000000 */   nop   
.L80326DC4:
/* 0E1DC4 80326DC4 8F380000 */  lw    $t8, ($t9)
/* 0E1DC8 80326DC8 ACB80000 */  sw    $t8, ($a1)
/* 0E1DCC 80326DCC AF250000 */  sw    $a1, ($t9)
/* 0E1DD0 80326DD0 03E00008 */  jr    $ra
/* 0E1DD4 80326DD4 ACA40008 */   sw    $a0, 8($a1)

glabel __osPopThread
/* 0E1DD8 80326DD8 8C820000 */  lw    $v0, ($a0)
/* 0E1DDC 80326DDC 8C590000 */  lw    $t9, ($v0)
/* 0E1DE0 80326DE0 03E00008 */  jr    $ra
/* 0E1DE4 80326DE4 AC990000 */   sw    $t9, ($a0)

glabel __osDispatchThread
/* 0E1DE8 80326DE8 3C048033 */  lui   $a0, %hi(D_80334898) # $a0, 0x8033
/* 0E1DEC 80326DEC 0C0C9B76 */  jal   __osPopThread
/* 0E1DF0 80326DF0 24844898 */   addiu $a0, %lo(D_80334898) # addiu $a0, $a0, 0x4898
/* 0E1DF4 80326DF4 3C018033 */  lui   $at, %hi(D_803348A0) # $at, 0x8033
/* 0E1DF8 80326DF8 AC2248A0 */  sw    $v0, %lo(D_803348A0)($at)
/* 0E1DFC 80326DFC 24080004 */  li    $t0, 4
/* 0E1E00 80326E00 A4480010 */  sh    $t0, 0x10($v0)
/* 0E1E04 80326E04 0040D025 */  move  $k0, $v0
.L80326E08:
/* 0E1E08 80326E08 DF5B0108 */  ld    $k1, 0x108($k0)
/* 0E1E0C 80326E0C DF410020 */  ld    $at, 0x20($k0)
/* 0E1E10 80326E10 DF420028 */  ld    $v0, 0x28($k0)
/* 0E1E14 80326E14 03600013 */  mtlo  $k1
/* 0E1E18 80326E18 DF5B0110 */  ld    $k1, 0x110($k0)
/* 0E1E1C 80326E1C DF430030 */  ld    $v1, 0x30($k0)
/* 0E1E20 80326E20 DF440038 */  ld    $a0, 0x38($k0)
/* 0E1E24 80326E24 DF450040 */  ld    $a1, 0x40($k0)
/* 0E1E28 80326E28 DF460048 */  ld    $a2, 0x48($k0)
/* 0E1E2C 80326E2C DF470050 */  ld    $a3, 0x50($k0)
/* 0E1E30 80326E30 DF480058 */  ld    $t0, 0x58($k0)
/* 0E1E34 80326E34 DF490060 */  ld    $t1, 0x60($k0)
/* 0E1E38 80326E38 DF4A0068 */  ld    $t2, 0x68($k0)
/* 0E1E3C 80326E3C DF4B0070 */  ld    $t3, 0x70($k0)
/* 0E1E40 80326E40 DF4C0078 */  ld    $t4, 0x78($k0)
/* 0E1E44 80326E44 DF4D0080 */  ld    $t5, 0x80($k0)
/* 0E1E48 80326E48 DF4E0088 */  ld    $t6, 0x88($k0)
/* 0E1E4C 80326E4C DF4F0090 */  ld    $t7, 0x90($k0)
/* 0E1E50 80326E50 DF500098 */  ld    $s0, 0x98($k0)
/* 0E1E54 80326E54 DF5100A0 */  ld    $s1, 0xa0($k0)
/* 0E1E58 80326E58 DF5200A8 */  ld    $s2, 0xa8($k0)
/* 0E1E5C 80326E5C DF5300B0 */  ld    $s3, 0xb0($k0)
/* 0E1E60 80326E60 DF5400B8 */  ld    $s4, 0xb8($k0)
/* 0E1E64 80326E64 DF5500C0 */  ld    $s5, 0xc0($k0)
/* 0E1E68 80326E68 DF5600C8 */  ld    $s6, 0xc8($k0)
/* 0E1E6C 80326E6C DF5700D0 */  ld    $s7, 0xd0($k0)
/* 0E1E70 80326E70 DF5800D8 */  ld    $t8, 0xd8($k0)
/* 0E1E74 80326E74 DF5900E0 */  ld    $t9, 0xe0($k0)
/* 0E1E78 80326E78 DF5C00E8 */  ld    $gp, 0xe8($k0)
/* 0E1E7C 80326E7C 03600011 */  mthi  $k1
/* 0E1E80 80326E80 DF5D00F0 */  ld    $sp, 0xf0($k0)
/* 0E1E84 80326E84 DF5E00F8 */  ld    $fp, 0xf8($k0)
/* 0E1E88 80326E88 DF5F0100 */  ld    $ra, 0x100($k0)
/* 0E1E8C 80326E8C 8F5B011C */  lw    $k1, 0x11c($k0)
/* 0E1E90 80326E90 409B7000 */  mtc0  $k1, $14
/* 0E1E94 80326E94 8F5B0118 */  lw    $k1, 0x118($k0)
/* 0E1E98 80326E98 409B6000 */  mtc0  $k1, $12
/* 0E1E9C 80326E9C 8F5B0018 */  lw    $k1, 0x18($k0)
/* 0E1EA0 80326EA0 13600013 */  beqz  $k1, .L80326EF0
/* 0E1EA4 80326EA4 00000000 */   nop   
/* 0E1EA8 80326EA8 8F5B012C */  lw    $k1, 0x12c($k0)
/* 0E1EAC 80326EAC 44DBF800 */  ctc1  $k1, $31
/* 0E1EB0 80326EB0 D7400130 */  ldc1  $f0, 0x130($k0)
/* 0E1EB4 80326EB4 D7420138 */  ldc1  $f2, 0x138($k0)
/* 0E1EB8 80326EB8 D7440140 */  ldc1  $f4, 0x140($k0)
/* 0E1EBC 80326EBC D7460148 */  ldc1  $f6, 0x148($k0)
/* 0E1EC0 80326EC0 D7480150 */  ldc1  $f8, 0x150($k0)
/* 0E1EC4 80326EC4 D74A0158 */  ldc1  $f10, 0x158($k0)
/* 0E1EC8 80326EC8 D74C0160 */  ldc1  $f12, 0x160($k0)
/* 0E1ECC 80326ECC D74E0168 */  ldc1  $f14, 0x168($k0)
/* 0E1ED0 80326ED0 D7500170 */  ldc1  $f16, 0x170($k0)
/* 0E1ED4 80326ED4 D7520178 */  ldc1  $f18, 0x178($k0)
/* 0E1ED8 80326ED8 D7540180 */  ldc1  $f20, 0x180($k0)
/* 0E1EDC 80326EDC D7560188 */  ldc1  $f22, 0x188($k0)
/* 0E1EE0 80326EE0 D7580190 */  ldc1  $f24, 0x190($k0)
/* 0E1EE4 80326EE4 D75A0198 */  ldc1  $f26, 0x198($k0)
/* 0E1EE8 80326EE8 D75C01A0 */  ldc1  $f28, 0x1a0($k0)
/* 0E1EEC 80326EEC D75E01A8 */  ldc1  $f30, 0x1a8($k0)
.L80326EF0:
/* 0E1EF0 80326EF0 8F5B0128 */  lw    $k1, 0x128($k0)
/* 0E1EF4 80326EF4 001BD840 */  sll   $k1, $k1, 1
/* 0E1EF8 80326EF8 3C1A8034 */  lui   $k0, %hi(D_803386D0) # $k0, 0x8034
/* 0E1EFC 80326EFC 275A86D0 */  addiu $k0, %lo(D_803386D0) # addiu $k0, $k0, -0x7930
/* 0E1F00 80326F00 037AD821 */  addu  $k1, $k1, $k0
/* 0E1F04 80326F04 977B0000 */  lhu   $k1, ($k1)
/* 0E1F08 80326F08 3C1AA430 */  lui   $k0, %hi(D_A430000C) # $k0, 0xa430
/* 0E1F0C 80326F0C 275A000C */  addiu $k0, %lo(D_A430000C) # addiu $k0, $k0, 0xc
/* 0E1F10 80326F10 AF5B0000 */  sw    $k1, ($k0)
/* 0E1F14 80326F14 00000000 */  nop   
/* 0E1F18 80326F18 00000000 */  nop   
/* 0E1F1C 80326F1C 00000000 */  nop   
/* 0E1F20 80326F20 00000000 */  nop   
/* 0E1F24 80326F24 42000018 */  eret  
glabel __osCleanupThread
/* 0E1F28 80326F28 0C0CA7CC */  jal   osDestroyThread
/* 0E1F2C 80326F2C 00002025 */   move  $a0, $zero

.section .data

glabel D_80334920
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0

glabel D_80334934
	.word 0

glabel D_80334938
	.word 0
	.word 0


	
.section .rodata

glabel D_80338610
	.byte 0x00,0x14,0x18,0x18,0x1C,0x1C,0x1C,0x1C,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x00,0x04,0x08,0x08,0x0C,0x0C,0x0C,0x0C,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10

glabel jtbl_80338630
	.word L80326B9C
	.word L80326B64
	.word L80326B44
	.word L803269B8
	.word L80326984
	.word L80326AE8
	.word L80326BE8
	.word L80326BE8
	.word L80326964
	.word 0
	.word 0
	.word 0