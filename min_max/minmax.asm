section .text
global min_max

min_max:
  enter 0,0
  ; EAX mantiene minimo numero y EDX el maximo
  mov EAX, [EBP + 8]    ; obtiene el valor 1
  mov EDX, [EBP + 12]   ; obtiene el valor 2
  cmp EAX, EDX          ; value 1 < value 2?
  jl skip1
  xchg EAX, EDX          ; else, exchange

skip1:
  mov ECX, [EBP + 16]   ; obtiene el valor 3
  cmp ECX, EAX          ; value 3 < min in EAX
  jl new_min
  cmp ECX, EDX          ; value 3 < min in EDX
  jl store_result
  mov EDX, ECX
  jmp store_result

new_min:
  mov EAX, ECX

store_result:
  mov EBX, [EBP + 20]
  mov [EBX], EAX
  mov EBX, [EBP + 24]
  mov [EBX], EDX
  leave


