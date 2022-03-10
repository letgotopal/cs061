.orig x3000
;this stack lab computes the polish notation of a set of calls
ld r6, user_stack

;push_val(4) pushes the value 4 onto the stack [4]
and r0, r0, #0
add r0, r0, #4
ld r5, push_val_ptr
jsrr r5

;push_val(3) pushes the value 3 onto the stack [4,3]
and r0, r0, #0
add r0, r0, #3
ld r5, push_val_ptr
jsrr r5


;push_val(2) pushes the value 2 onto the stack [4,3,2]
and r0, r0, #0
add r0, r0, #2
ld r5, push_val_ptr
jsrr r5

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
ld r5, add_val_ptr
jsrr r5

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
ld r5, add_val_ptr
jsrr r5

;move the top value of the stack into r4
ldr r4, r6, #0
add r6, r6, #1

and r0, r0, #0
add r0, r4, r0
out

halt

;local data for the test harness
user_stack .FILL xFE00
push_val_ptr .FILL x3400
add_val_ptr .FILL x3800


.end


.orig x3400 ;push_val(int val)implement your push function that will push a value onto the stack
;Input value in r0
;No output
push_val_3400
add r6, r6, #-1
str r0, r6, #0

ret

.end

.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
add_val_3800
ldr r1, r6, #0
add r6, r6, #1
ldr r2, r6, #0

and r0, r0, #0
add r0, r1, r2

str r0, r6, #0

ret

.end

.orig x4200 ;;data you might need
.end


