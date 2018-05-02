# SingleCycle-ARM-CPU-Simple-Implementation
A very simple implementation of a single cycle 32bit ARM CPU with a fairly reduced instruction set.


## Instruction Set

#### ADD,SUB,AND,ORR,CMP
| 31:28   |27:26  | 25:20   | 19:16  | 15:12  | 11:0           |
| --------|:-----:| -------:| ------:| ------:|---------------:|
| xxxx    |   00  | x cmd x |   Rn   | Rd     | xxxxxxxx Rm    |

#### LSR,LSL

#### STR,LDR
