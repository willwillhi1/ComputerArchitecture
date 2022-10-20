000100c4 <main>:
   100c4:       fe010113                addi    sp,sp,-32
   100c8:       00c10513                addi    a0,sp,12
   100cc:       00112e23                sw      ra,28(sp)
   100d0:       0dc000ef                jal     ra,101ac <create_list>
   100d4:       00c12503                lw      a0,12(sp)
   100d8:       148000ef                jal     ra,10220 <print_list>
   100dc:       01c12083                lw      ra,28(sp)
   100e0:       00000513                li      a0,0
   100e4:       02010113                addi    sp,sp,32
   100e8:       00008067                ret

000101ac <create_list>:
   101ac:       ff010113                addi    sp,sp,-16
   101b0:       00812423                sw      s0,8(sp)
   101b4:       00050413                mv      s0,a0
   101b8:       00800513                li      a0,8
   101bc:       00112623                sw      ra,12(sp)
   101c0:       00912223                sw      s1,4(sp)
   101c4:       1b0000ef                jal     ra,10374 <malloc>
   101c8:       00050493                mv      s1,a0
   101cc:       00100793                li      a5,1
   101d0:       00f4a023                sw      a5,0(s1)
   101d4:       00a42023                sw      a0,0(s0)
   101d8:       0004a223                sw      zero,4(s1)
   101dc:       00800513                li      a0,8
   101e0:       194000ef                jal     ra,10374 <malloc>
   101e4:       00050413                mv      s0,a0
   101e8:       00042023                sw      zero,0(s0)
   101ec:       00042223                sw      zero,4(s0)
   101f0:       0084a223                sw      s0,4(s1)
   101f4:       00800513                li      a0,8
   101f8:       17c000ef                jal     ra,10374 <malloc>
   101fc:       00300793                li      a5,3
   10200:       00f52023                sw      a5,0(a0)
   10204:       00052223                sw      zero,4(a0)
   10208:       00c12083                lw      ra,12(sp)
   1020c:       00a42223                sw      a0,4(s0)
   10210:       00812403                lw      s0,8(sp)
   10214:       00412483                lw      s1,4(sp)
   10218:       01010113                addi    sp,sp,16
   1021c:       00008067                ret

00010220 <print_list>:
   10220:       04050463                beqz    a0,10268 <print_list+0x48>
   10224:       ff010113                addi    sp,sp,-16
   10228:       00812423                sw      s0,8(sp)
   1022c:       00912223                sw      s1,4(sp)
   10230:       00112623                sw      ra,12(sp)
   10234:       00050413                mv      s0,a0
   10238:       000224b7                lui     s1,0x22
   1023c:       00042583                lw      a1,0(s0)
   10240:       91048513                addi    a0,s1,-1776 # 21910 <__clzsi2+0x8c>
   10244:       1f5000ef                jal     ra,10c38 <printf>
   10248:       00442403                lw      s0,4(s0)
   1024c:       fe0418e3                bnez    s0,1023c <print_list+0x1c>
   10250:       00812403                lw      s0,8(sp)
   10254:       00c12083                lw      ra,12(sp)
   10258:       00412483                lw      s1,4(sp)
   1025c:       00a00513                li      a0,10
   10260:       01010113                addi    sp,sp,16
   10264:       2290006f                j       10c8c <putchar>
   10268:       00a00513                li      a0,10
   1026c:       2210006f                j       10c8c <putchar>
