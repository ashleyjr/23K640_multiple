#include <stdlib.h>
#include <iostream>
#include <cstdlib>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_23K640_multiple.h"
#include <stdio.h>
#include "../23K640/verif/include/app_driver.h"
#include "../23K640/verif/include/sram_model.h"
#include "../23K640/verif/include/logger.h"

int main(int argc, char** argv, char** env) {
   
   vluint64_t sim_time = 0;
   uint64_t cycle = 0;
   Vx_23K640_multiple *dut = new Vx_23K640_multiple; 
   Verilated::traceEverOn(true);
   VerilatedVcdC *m_trace = new VerilatedVcdC; 
      
   uint32_t stop = std::stoi(argv[1]);
   uint8_t profile_sel = std::stoi(argv[2]);
  
   Logger logger("logfile.txt", &sim_time);
   AppDriver d(logger, profile_sel);
   
   SramModel m0(logger); 
   SramModel m1(logger); 
   SramModel m2(logger); 
   SramModel m3(logger);   
   SramModel m4(logger); 
   SramModel m5(logger); 
   SramModel m6(logger); 
   SramModel m7(logger); 

   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");
   
 
   dut->i_rst     = 1;
   dut->i_valid   = 0;
   dut->i_rd_n_wr = 0;
   dut->i_addr    = 0;
   dut->i_wdata   = 0;

   while (cycle < stop) {
      
      // Falling Edge
      dut->i_clk = 0;
    
      // Test Vectors
      switch(cycle){   
         // Reset
         case 10:    dut->i_rst = 0;
                     break;
      }
     
      // AppDriver
      d.set_inputs(
         dut->o_accept,
         dut->o_rdata,
         dut->o_ready
      );
      d.advance();
      dut->i_valid = d.get_valid();
      dut->i_rd_n_wr = d.get_rd_n_wr();
      dut->i_addr = d.get_addr(); 
      dut->i_wdata = d.get_wdata();
 
      // SRAM Models
      m0.set_inputs(
         dut->o_cs_0,
         dut->o_so_0,      
         dut->o_sck
      );
      dut->i_si_0 = m0.get_so(); 
      m1.set_inputs(
         dut->o_cs_1,
         dut->o_so_1,      
         dut->o_sck
      );
      dut->i_si_1 = m1.get_so(); 
      m2.set_inputs(
         dut->o_cs_2,
         dut->o_so_2,      
         dut->o_sck
      );
      dut->i_si_2 = m2.get_so(); 
      m3.set_inputs(
         dut->o_cs_3,
         dut->o_so_3,      
         dut->o_sck
      );
      dut->i_si_3 = m3.get_so(); 
      m4.set_inputs(
         dut->o_cs_4,
         dut->o_so_4,      
         dut->o_sck
      );
      dut->i_si_4 = m4.get_so(); 
      m5.set_inputs(
         dut->o_cs_5,
         dut->o_so_5,      
         dut->o_sck
      );
      dut->i_si_5 = m5.get_so(); 
      m6.set_inputs(
         dut->o_cs_6,
         dut->o_so_6,      
         dut->o_sck
      );
      dut->i_si_6 = m6.get_so(); 
      m7.set_inputs(
         dut->o_cs_7,
         dut->o_so_7,      
         dut->o_sck
      );
      dut->i_si_7 = m7.get_so(); 
       
      // Tick
      dut->eval();
      m_trace->dump(sim_time); 
      sim_time++;
      
      // Rising Edge
      dut->i_clk = 1;
      
      // Tick
      dut->eval();
      m_trace->dump(sim_time); 
      sim_time++;

      // Event
      cycle = sim_time >> 1; 
   }
   
   d.report_bw();

   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

