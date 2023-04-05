#include <stdlib.h>
#include <iostream>
#include <cstdlib>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_23K640_multiple.h"
#include <stdio.h>

#define CYCLES 100000

int main(int argc, char** argv, char** env) {
   
   vluint64_t sim_time = 0;
   uint64_t cycle = 0;
   Vx_23K640_multiple *dut = new Vx_23K640_multiple; 
   Verilated::traceEverOn(true);
   VerilatedVcdC *m_trace = new VerilatedVcdC; 
   
   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");
   
   while (cycle < CYCLES) {
              
      // Tick
      dut->eval();
      m_trace->dump(sim_time);
      sim_time++;

      // Tick
      dut->eval();
      m_trace->dump(sim_time); 
      sim_time++;


      cycle++;
   }
   
   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

