;; https://gist.github.com/ooKu9yaiV4a/c7463504f1dba1e6bb1681f179dc7b59

[bits 64]
[org 0x10000]
_:
  mov ecx, pwnd
  mov edx, ecx
  add ecx, 36
  jmp .C
  db 0x83,0xb0,0x01,0xcd,0x80
.A:
  add al, 0x2f
  mov byte [edx], al
.B:
  inc edx
  cmp edx, ecx
  je $-11
.C:
  movzx eax, byte [edx]
  lea ebx, [eax - 0x21]
  cmp bl, 0x5d
  ja .B
  cmp al, 0x4f
  jle .A
  sub al, 0x2f
  inc edx
  mov byte [edx - 0x01], al
  cmp edx, ecx
  jne .C
  jmp $-38
pwnd: db 0x64,0x35,0x34,0x61,0x32,0x63,0x67,0x34,0x60,0x61,0x64,0x37,0x36, \
        0x5f,0x37,0x60,0x64,0x66,0x37,0x67,0x33,0x61,0x37,0x32,0x61,0x34, \
        0x66,0x60,0x36,0x67,0x62,0x5d,0x34,0x40,0x3e,0x0a
.end

