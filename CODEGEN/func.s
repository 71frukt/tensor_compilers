.intel_syntax noprefix
.section .text
.global function1

function1:
  push rbx
loop1_preheader:
  mov rax, 0                # result0 = 0
  mov rbx, 0                # i0 = 0
  
  cmp rbx, rsi              # n -> rsi
  jge exit
  jmp loop1_header

loop1_header:
  mov rcx, 1                # j0 = 1

  cmp rcx, rsi              # n -> rsi
  jl loop2_header
  jmp loop1_latch

loop2_header:
  lea r8, [rdi + rcx*4]     # addr0 = a + j1*4
  mov r8, [r8]              # val0 = *addr0
  
  mov r9, 30                # tmp0 = 30
  imul r9, r8               # tmp0 *= val0
  
  mov r8, r9                # tmp1 = tmp0 (tmp1: r8, tmp0: r9)
  sub r8, rbx               # tmp1 -= i1
  
  sub r8, 2                 # tmp2 = tmp1 - 2
  
  add rax, r8               # result3 (rax) += tmp2
  
  jmp loop2_latch

loop2_latch:
  add rcx, 2                # j2 = j1 + 2

  cmp rcx, rsi
  jl loop2_header
  jmp loop1_latch

loop1_latch:
  add rbx, 1                # i2 = i1 + 1

  cmp rbx, rsi
  jl loop1_header
  jmp exit

exit:
  pop rbx
  ret                       # ret rax
