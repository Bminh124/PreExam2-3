INCLUDE Irvine32.inc

.data
 aValue BYTE "Enter a value for a: ",0
 bValue BYTE "Enter a value for b: ",0
 cValue BYTE "Enter a value for c: ",0
 deltaText BYTE "delta = b^2 - 4ac =",0
 aa SDWORD ?
 bb SDWORD ?
 cc SDWORD ?
 delta SDWORD ?

 .code
 ;b^2 - 4ac
 Equation PROC
 imul ebx, bb
 imul eax, 4
 imul eax, cc
 sub ebx,eax
 ret
 Equation ENDP

main PROC
  mov edx, OFFSET aValue
  call WriteString
  call ReadInt
  mov aa, eax

  
  mov edx, OFFSET bValue
  call WriteString
   call ReadInt
   mov bb, eax

  mov edx, OFFSET cValue
  call WriteString
  call ReadInt
  mov cc, eax

  mov eax, aa
  mov ebx, bb
  mov ecx, cc
  call Equation
  mov delta, ebx

  mov edx, OFFSET deltaText
  call WriteString
  mov eax, delta
  call WriteInt
  call crlf

  call WaitMsg
  exit
  main ENDP
  END main