//-----------------------------------------------------------------
//                        RISC-V Test SoC
//                            V0.1
//                     Ultra-Embedded.com
//                     Copyright 2014-2019
//
//                   admin@ultra-embedded.com
//
//                       License: BSD
//-----------------------------------------------------------------
//
// Copyright (c) 2014-2019, Ultra-Embedded.com
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions 
// are met:
//   - Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//   - Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer 
//     in the documentation and/or other materials provided with the 
//     distribution.
//   - Neither the name of the author nor the names of its contributors 
//     may be used to endorse or promote products derived from this 
//     software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE 
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
// SUCH DAMAGE.
//-----------------------------------------------------------------

//-----------------------------------------------------------------
//                          Generated File
//-----------------------------------------------------------------

`define IRQ_ISR    8'h0

    `define IRQ_ISR_STATUS_DEFAULT    0
    `define IRQ_ISR_STATUS_B          0
    `define IRQ_ISR_STATUS_T          3
    `define IRQ_ISR_STATUS_W          4
    `define IRQ_ISR_STATUS_R          3:0

`define IRQ_IPR    8'h4

    `define IRQ_IPR_PENDING_DEFAULT    0
    `define IRQ_IPR_PENDING_B          0
    `define IRQ_IPR_PENDING_T          3
    `define IRQ_IPR_PENDING_W          4
    `define IRQ_IPR_PENDING_R          3:0

`define IRQ_IER    8'h8

    `define IRQ_IER_ENABLE_DEFAULT    0
    `define IRQ_IER_ENABLE_B          0
    `define IRQ_IER_ENABLE_T          3
    `define IRQ_IER_ENABLE_W          4
    `define IRQ_IER_ENABLE_R          3:0

`define IRQ_IAR    8'hc

    `define IRQ_IAR_ACK_DEFAULT    0
    `define IRQ_IAR_ACK_B          0
    `define IRQ_IAR_ACK_T          3
    `define IRQ_IAR_ACK_W          4
    `define IRQ_IAR_ACK_R          3:0

`define IRQ_SIE    8'h10

    `define IRQ_SIE_SET_DEFAULT    0
    `define IRQ_SIE_SET_B          0
    `define IRQ_SIE_SET_T          3
    `define IRQ_SIE_SET_W          4
    `define IRQ_SIE_SET_R          3:0

`define IRQ_CIE    8'h14

    `define IRQ_CIE_CLR_DEFAULT    0
    `define IRQ_CIE_CLR_B          0
    `define IRQ_CIE_CLR_T          3
    `define IRQ_CIE_CLR_W          4
    `define IRQ_CIE_CLR_R          3:0

`define IRQ_IVR    8'h18

    `define IRQ_IVR_VECTOR_DEFAULT    0
    `define IRQ_IVR_VECTOR_B          0
    `define IRQ_IVR_VECTOR_T          31
    `define IRQ_IVR_VECTOR_W          32
    `define IRQ_IVR_VECTOR_R          31:0

`define IRQ_MER    8'h1c

    `define IRQ_MER_ME      0
    `define IRQ_MER_ME_DEFAULT    0
    `define IRQ_MER_ME_B          0
    `define IRQ_MER_ME_T          0
    `define IRQ_MER_ME_W          1
    `define IRQ_MER_ME_R          0:0

