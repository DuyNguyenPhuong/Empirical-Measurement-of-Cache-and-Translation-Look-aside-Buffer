
cache:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 72 2f 00 00    	pushq  0x2f72(%rip)        # 3f98 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 73 2f 00 00 	bnd jmpq *0x2f73(%rip)        # 3fa0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <.plt>
    108f:	90                   	nop

Disassembly of section .plt.got:

0000000000001090 <__cxa_finalize@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 5d 2f 00 00 	bnd jmpq *0x2f5d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000010a0 <free@plt>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	f2 ff 25 fd 2e 00 00 	bnd jmpq *0x2efd(%rip)        # 3fa8 <free@GLIBC_2.2.5>
    10ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010b0 <clock_gettime@plt>:
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	f2 ff 25 f5 2e 00 00 	bnd jmpq *0x2ef5(%rip)        # 3fb0 <clock_gettime@GLIBC_2.17>
    10bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010c0 <__stack_chk_fail@plt>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	f2 ff 25 ed 2e 00 00 	bnd jmpq *0x2eed(%rip)        # 3fb8 <__stack_chk_fail@GLIBC_2.4>
    10cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010d0 <printf@plt>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	f2 ff 25 e5 2e 00 00 	bnd jmpq *0x2ee5(%rip)        # 3fc0 <printf@GLIBC_2.2.5>
    10db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010e0 <malloc@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 dd 2e 00 00 	bnd jmpq *0x2edd(%rip)        # 3fc8 <malloc@GLIBC_2.2.5>
    10eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010f0 <perror@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 d5 2e 00 00 	bnd jmpq *0x2ed5(%rip)        # 3fd0 <perror@GLIBC_2.2.5>
    10fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001100 <_start>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	31 ed                	xor    %ebp,%ebp
    1106:	49 89 d1             	mov    %rdx,%r9
    1109:	5e                   	pop    %rsi
    110a:	48 89 e2             	mov    %rsp,%rdx
    110d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1111:	50                   	push   %rax
    1112:	54                   	push   %rsp
    1113:	4c 8d 05 36 03 00 00 	lea    0x336(%rip),%r8        # 1450 <__libc_csu_fini>
    111a:	48 8d 0d bf 02 00 00 	lea    0x2bf(%rip),%rcx        # 13e0 <__libc_csu_init>
    1121:	48 8d 3d 18 01 00 00 	lea    0x118(%rip),%rdi        # 1240 <main>
    1128:	ff 15 b2 2e 00 00    	callq  *0x2eb2(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    112e:	f4                   	hlt    
    112f:	90                   	nop

0000000000001130 <deregister_tm_clones>:
    1130:	48 8d 3d d9 2e 00 00 	lea    0x2ed9(%rip),%rdi        # 4010 <__TMC_END__>
    1137:	48 8d 05 d2 2e 00 00 	lea    0x2ed2(%rip),%rax        # 4010 <__TMC_END__>
    113e:	48 39 f8             	cmp    %rdi,%rax
    1141:	74 15                	je     1158 <deregister_tm_clones+0x28>
    1143:	48 8b 05 8e 2e 00 00 	mov    0x2e8e(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    114a:	48 85 c0             	test   %rax,%rax
    114d:	74 09                	je     1158 <deregister_tm_clones+0x28>
    114f:	ff e0                	jmpq   *%rax
    1151:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1158:	c3                   	retq   
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <register_tm_clones>:
    1160:	48 8d 3d a9 2e 00 00 	lea    0x2ea9(%rip),%rdi        # 4010 <__TMC_END__>
    1167:	48 8d 35 a2 2e 00 00 	lea    0x2ea2(%rip),%rsi        # 4010 <__TMC_END__>
    116e:	48 29 fe             	sub    %rdi,%rsi
    1171:	48 89 f0             	mov    %rsi,%rax
    1174:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1178:	48 c1 f8 03          	sar    $0x3,%rax
    117c:	48 01 c6             	add    %rax,%rsi
    117f:	48 d1 fe             	sar    %rsi
    1182:	74 14                	je     1198 <register_tm_clones+0x38>
    1184:	48 8b 05 65 2e 00 00 	mov    0x2e65(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    118b:	48 85 c0             	test   %rax,%rax
    118e:	74 08                	je     1198 <register_tm_clones+0x38>
    1190:	ff e0                	jmpq   *%rax
    1192:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1198:	c3                   	retq   
    1199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011a0 <__do_global_dtors_aux>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	80 3d 65 2e 00 00 00 	cmpb   $0x0,0x2e65(%rip)        # 4010 <__TMC_END__>
    11ab:	75 2b                	jne    11d8 <__do_global_dtors_aux+0x38>
    11ad:	55                   	push   %rbp
    11ae:	48 83 3d 42 2e 00 00 	cmpq   $0x0,0x2e42(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    11b5:	00 
    11b6:	48 89 e5             	mov    %rsp,%rbp
    11b9:	74 0c                	je     11c7 <__do_global_dtors_aux+0x27>
    11bb:	48 8b 3d 46 2e 00 00 	mov    0x2e46(%rip),%rdi        # 4008 <__dso_handle>
    11c2:	e8 c9 fe ff ff       	callq  1090 <__cxa_finalize@plt>
    11c7:	e8 64 ff ff ff       	callq  1130 <deregister_tm_clones>
    11cc:	c6 05 3d 2e 00 00 01 	movb   $0x1,0x2e3d(%rip)        # 4010 <__TMC_END__>
    11d3:	5d                   	pop    %rbp
    11d4:	c3                   	retq   
    11d5:	0f 1f 00             	nopl   (%rax)
    11d8:	c3                   	retq   
    11d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011e0 <frame_dummy>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	e9 77 ff ff ff       	jmpq   1160 <register_tm_clones>

00000000000011e9 <accessArray>:
    11e9:	f3 0f 1e fa          	endbr64 
    11ed:	55                   	push   %rbp
    11ee:	48 89 e5             	mov    %rsp,%rbp
    11f1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    11f5:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    11f8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    11ff:	eb 33                	jmp    1234 <accessArray+0x4b>
    1201:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1204:	48 98                	cltq   
    1206:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    120d:	00 
    120e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1212:	48 01 d0             	add    %rdx,%rax
    1215:	8b 10                	mov    (%rax),%edx
    1217:	8b 45 fc             	mov    -0x4(%rbp),%eax
    121a:	48 98                	cltq   
    121c:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    1223:	00 
    1224:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1228:	48 01 c8             	add    %rcx,%rax
    122b:	83 c2 01             	add    $0x1,%edx
    122e:	89 10                	mov    %edx,(%rax)
    1230:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1234:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1237:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
    123a:	7c c5                	jl     1201 <accessArray+0x18>
    123c:	90                   	nop
    123d:	90                   	nop
    123e:	5d                   	pop    %rbp
    123f:	c3                   	retq   

0000000000001240 <main>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	55                   	push   %rbp
    1245:	48 89 e5             	mov    %rsp,%rbp
    1248:	48 83 ec 60          	sub    $0x60,%rsp
    124c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1253:	00 00 
    1255:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1259:	31 c0                	xor    %eax,%eax
    125b:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
    1262:	c7 45 a8 00 04 00 00 	movl   $0x400,-0x58(%rbp)
    1269:	e9 47 01 00 00       	jmpq   13b5 <main+0x175>
    126e:	8b 45 a8             	mov    -0x58(%rbp),%eax
    1271:	48 98                	cltq   
    1273:	48 c1 e8 02          	shr    $0x2,%rax
    1277:	89 45 b4             	mov    %eax,-0x4c(%rbp)
    127a:	8b 45 a8             	mov    -0x58(%rbp),%eax
    127d:	48 98                	cltq   
    127f:	48 89 c7             	mov    %rax,%rdi
    1282:	e8 59 fe ff ff       	callq  10e0 <malloc@plt>
    1287:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    128b:	48 83 7d b8 00       	cmpq   $0x0,-0x48(%rbp)
    1290:	75 16                	jne    12a8 <main+0x68>
    1292:	48 8d 3d 6b 0d 00 00 	lea    0xd6b(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
    1299:	e8 52 fe ff ff       	callq  10f0 <perror@plt>
    129e:	b8 01 00 00 00       	mov    $0x1,%eax
    12a3:	e9 1f 01 00 00       	jmpq   13c7 <main+0x187>
    12a8:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%rbp)
    12af:	eb 26                	jmp    12d7 <main+0x97>
    12b1:	8b 55 ac             	mov    -0x54(%rbp),%edx
    12b4:	89 d0                	mov    %edx,%eax
    12b6:	01 c0                	add    %eax,%eax
    12b8:	01 c2                	add    %eax,%edx
    12ba:	8b 45 ac             	mov    -0x54(%rbp),%eax
    12bd:	48 98                	cltq   
    12bf:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    12c6:	00 
    12c7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    12cb:	48 01 c8             	add    %rcx,%rax
    12ce:	83 c2 01             	add    $0x1,%edx
    12d1:	89 10                	mov    %edx,(%rax)
    12d3:	83 45 ac 01          	addl   $0x1,-0x54(%rbp)
    12d7:	8b 45 ac             	mov    -0x54(%rbp),%eax
    12da:	3b 45 b4             	cmp    -0x4c(%rbp),%eax
    12dd:	7c d2                	jl     12b1 <main+0x71>
    12df:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    12e3:	48 89 c6             	mov    %rax,%rsi
    12e6:	bf 01 00 00 00       	mov    $0x1,%edi
    12eb:	e8 c0 fd ff ff       	callq  10b0 <clock_gettime@plt>
    12f0:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%rbp)
    12f7:	eb 15                	jmp    130e <main+0xce>
    12f9:	8b 55 b4             	mov    -0x4c(%rbp),%edx
    12fc:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    1300:	89 d6                	mov    %edx,%esi
    1302:	48 89 c7             	mov    %rax,%rdi
    1305:	e8 df fe ff ff       	callq  11e9 <accessArray>
    130a:	83 45 b0 01          	addl   $0x1,-0x50(%rbp)
    130e:	83 7d b0 09          	cmpl   $0x9,-0x50(%rbp)
    1312:	7e e5                	jle    12f9 <main+0xb9>
    1314:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
    1318:	48 89 c6             	mov    %rax,%rsi
    131b:	bf 01 00 00 00       	mov    $0x1,%edi
    1320:	e8 8b fd ff ff       	callq  10b0 <clock_gettime@plt>
    1325:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1329:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    132d:	48 29 c2             	sub    %rax,%rdx
    1330:	48 89 d0             	mov    %rdx,%rax
    1333:	48 69 c0 00 ca 9a 3b 	imul   $0x3b9aca00,%rax,%rax
    133a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    133e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1342:	48 29 d1             	sub    %rdx,%rcx
    1345:	48 89 ca             	mov    %rcx,%rdx
    1348:	48 01 d0             	add    %rdx,%rax
    134b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    134f:	f2 48 0f 2a 45 c0    	cvtsi2sdq -0x40(%rbp),%xmm0
    1355:	8b 55 b4             	mov    -0x4c(%rbp),%edx
    1358:	89 d0                	mov    %edx,%eax
    135a:	c1 e0 02             	shl    $0x2,%eax
    135d:	01 d0                	add    %edx,%eax
    135f:	01 c0                	add    %eax,%eax
    1361:	f2 0f 2a c8          	cvtsi2sd %eax,%xmm1
    1365:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    1369:	f2 0f 11 45 c8       	movsd  %xmm0,-0x38(%rbp)
    136e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    1372:	8b 00                	mov    (%rax),%eax
    1374:	01 45 a4             	add    %eax,-0x5c(%rbp)
    1377:	8b 45 a8             	mov    -0x58(%rbp),%eax
    137a:	8d 90 ff 03 00 00    	lea    0x3ff(%rax),%edx
    1380:	85 c0                	test   %eax,%eax
    1382:	0f 48 c2             	cmovs  %edx,%eax
    1385:	c1 f8 0a             	sar    $0xa,%eax
    1388:	89 c2                	mov    %eax,%edx
    138a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    138e:	66 48 0f 6e c0       	movq   %rax,%xmm0
    1393:	89 d6                	mov    %edx,%esi
    1395:	48 8d 3d 81 0c 00 00 	lea    0xc81(%rip),%rdi        # 201d <_IO_stdin_used+0x1d>
    139c:	b8 01 00 00 00       	mov    $0x1,%eax
    13a1:	e8 2a fd ff ff       	callq  10d0 <printf@plt>
    13a6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    13aa:	48 89 c7             	mov    %rax,%rdi
    13ad:	e8 ee fc ff ff       	callq  10a0 <free@plt>
    13b2:	d1 65 a8             	shll   -0x58(%rbp)
    13b5:	81 7d a8 00 00 00 08 	cmpl   $0x8000000,-0x58(%rbp)
    13bc:	0f 8e ac fe ff ff    	jle    126e <main+0x2e>
    13c2:	b8 00 00 00 00       	mov    $0x0,%eax
    13c7:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    13cb:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    13d2:	00 00 
    13d4:	74 05                	je     13db <main+0x19b>
    13d6:	e8 e5 fc ff ff       	callq  10c0 <__stack_chk_fail@plt>
    13db:	c9                   	leaveq 
    13dc:	c3                   	retq   
    13dd:	0f 1f 00             	nopl   (%rax)

00000000000013e0 <__libc_csu_init>:
    13e0:	f3 0f 1e fa          	endbr64 
    13e4:	41 57                	push   %r15
    13e6:	4c 8d 3d a3 29 00 00 	lea    0x29a3(%rip),%r15        # 3d90 <__frame_dummy_init_array_entry>
    13ed:	41 56                	push   %r14
    13ef:	49 89 d6             	mov    %rdx,%r14
    13f2:	41 55                	push   %r13
    13f4:	49 89 f5             	mov    %rsi,%r13
    13f7:	41 54                	push   %r12
    13f9:	41 89 fc             	mov    %edi,%r12d
    13fc:	55                   	push   %rbp
    13fd:	48 8d 2d 94 29 00 00 	lea    0x2994(%rip),%rbp        # 3d98 <__do_global_dtors_aux_fini_array_entry>
    1404:	53                   	push   %rbx
    1405:	4c 29 fd             	sub    %r15,%rbp
    1408:	48 83 ec 08          	sub    $0x8,%rsp
    140c:	e8 ef fb ff ff       	callq  1000 <_init>
    1411:	48 c1 fd 03          	sar    $0x3,%rbp
    1415:	74 1f                	je     1436 <__libc_csu_init+0x56>
    1417:	31 db                	xor    %ebx,%ebx
    1419:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1420:	4c 89 f2             	mov    %r14,%rdx
    1423:	4c 89 ee             	mov    %r13,%rsi
    1426:	44 89 e7             	mov    %r12d,%edi
    1429:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    142d:	48 83 c3 01          	add    $0x1,%rbx
    1431:	48 39 dd             	cmp    %rbx,%rbp
    1434:	75 ea                	jne    1420 <__libc_csu_init+0x40>
    1436:	48 83 c4 08          	add    $0x8,%rsp
    143a:	5b                   	pop    %rbx
    143b:	5d                   	pop    %rbp
    143c:	41 5c                	pop    %r12
    143e:	41 5d                	pop    %r13
    1440:	41 5e                	pop    %r14
    1442:	41 5f                	pop    %r15
    1444:	c3                   	retq   
    1445:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    144c:	00 00 00 00 

0000000000001450 <__libc_csu_fini>:
    1450:	f3 0f 1e fa          	endbr64 
    1454:	c3                   	retq   

Disassembly of section .fini:

0000000000001458 <_fini>:
    1458:	f3 0f 1e fa          	endbr64 
    145c:	48 83 ec 08          	sub    $0x8,%rsp
    1460:	48 83 c4 08          	add    $0x8,%rsp
    1464:	c3                   	retq   
