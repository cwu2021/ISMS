#!/usr/bin/perl
# The PERL program, bufbash.pl[67] (written for Intel X86 architectures), goes through the
following high-level steps: find out the stack pointer, concatenate the character representation of
the address of the stack pointer including any offset, any NOPs, and shell code into a string, and
then pass the string to the program as a command line argument.
use Inline (ASM => 'DATA',
 AS => 'as',
 PROTO => { getsp => 'unsigned long()' });
[...] snip PERL code.
__END__
__ASM__
.text
.globl getsp
getsp: movl %esp,%eax
 ret
