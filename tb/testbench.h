#include "testbench_vbase.h"

#include "riscv_main.h"
#include "riscv.h"
#include "elf_load.h"

#include <unistd.h>

#include "cosim_api.h"
#include "riscv_soc.h"

#include "tb_axi4_mem.h"

//-----------------------------------------------------------------
// Module
//-----------------------------------------------------------------
class testbench: public testbench_vbase, public cosim_cpu_api, public cosim_mem_api
{
public:
    //-----------------------------------------------------------------
    // Instances / Members
    //-----------------------------------------------------------------      
    riscv_soc                   *m_dut;
    tb_axi4_mem                 *m_mem;

    int                          m_argc;
    char**                       m_argv;

    //-----------------------------------------------------------------
    // Signals
    //-----------------------------------------------------------------    
    sc_signal <axi4_slave>       mem_in;
    sc_signal <axi4_master>      mem_out;
    sc_signal < sc_uint <32> >   reset_vector_in;
    sc_signal <bool>             rst_cpu_in;
    sc_signal <axi4_lite_master> inport_in;
    sc_signal <axi4_lite_slave>  inport_out;

    sc_signal <bool>             spi_clk_out;
    sc_signal <bool>             spi_miso_in;
    sc_signal <bool>             spi_mosi_out;
    sc_signal <bool>             spi_cs_out;
    sc_signal <bool>             uart_rxd_out;
    sc_signal <bool>             uart_txd_in;
    sc_signal <sc_uint<32> >     gpio_output_out;
    sc_signal <sc_uint<32> >     gpio_input_in;
    sc_signal <sc_uint<32> >     gpio_output_enable_out;

    //-----------------------------------------------------------------
    // process: Main loop for CPU execution
    //-----------------------------------------------------------------
    void process(void) 
    {
        cosim::instance()->attach_cpu("rtl", this);
        cosim::instance()->attach_mem("rtl", this, 0, 0xFFFFFFFF);
        wait();
        exit(riscv_main(cosim::instance(), m_argc, m_argv));
    }

    void set_argcv(int argc, char* argv[]) { m_argc = argc; m_argv = argv; }

    //-----------------------------------------------------------------
    // Construction
    //-----------------------------------------------------------------
    SC_HAS_PROCESS(testbench);
    testbench(sc_module_name name): testbench_vbase(name)
    {
        m_dut = new riscv_soc("DUT");
        m_dut->clk_in(clk);
        m_dut->rst_in(rst);
        m_dut->rst_cpu_in(rst_cpu_in);
        m_dut->mem_out(mem_out);
        m_dut->mem_in(mem_in);
        m_dut->reset_vector_in(reset_vector_in);
        m_dut->inport_in(inport_in);
        m_dut->inport_out(inport_out);
        m_dut->uart_rxd_out(uart_rxd_out);
        m_dut->uart_txd_in(uart_txd_in);
        m_dut->spi_clk_out(spi_clk_out);
        m_dut->spi_miso_in(spi_miso_in);
        m_dut->spi_mosi_out(spi_mosi_out);
        m_dut->spi_cs_out(spi_cs_out);
        m_dut->gpio_output_out(gpio_output_out);
        m_dut->gpio_input_in(gpio_input_in);
        m_dut->gpio_output_enable_out(gpio_output_enable_out);

        // Memory
        m_mem = new tb_axi4_mem("MEM");
        m_mem->clk_in(clk);
        m_mem->rst_in(rst);
        m_mem->axi_in(mem_out);
        m_mem->axi_out(mem_in);
        m_mem->enable_delays(false);

        verilator_trace_enable("verilator.vcd", m_dut);
    }
    //-----------------------------------------------------------------
    // Trace
    //-----------------------------------------------------------------
    void add_trace(sc_trace_file * fp, std::string prefix)
    {
        if (!waves_enabled())
            return;

        // Add signals to trace file
        #define TRACE_SIGNAL(a) sc_trace(fp,a,#a);
        TRACE_SIGNAL(clk);
        TRACE_SIGNAL(rst);

        m_dut->add_trace(fp, "");
    }

    //-----------------------------------------------------------------
    // create_memory: Create memory region
    //-----------------------------------------------------------------
    bool create_memory(uint32_t base, uint32_t size, uint8_t *mem = NULL)
    {
        base = base & ~(32-1);
        size = (size + 31) & ~(32-1);

        while (m_mem->valid_addr(base))
            base += 1;

        while (m_mem->valid_addr(base + size - 1))
            size -= 1;

        m_mem->add_region(base, size);

        memset(m_mem->get_array(base), 0, size);

        return true;
    }
    //-----------------------------------------------------------------
    // valid_addr: Check address range
    //-----------------------------------------------------------------
    bool valid_addr(uint32_t addr) { return true; } 
    //-----------------------------------------------------------------
    // write: Write byte into memory
    //-----------------------------------------------------------------
    void write(uint32_t addr, uint8_t data)
    {
        m_mem->write(addr, data);
    }
    //-----------------------------------------------------------------
    // write: Read byte from memory
    //-----------------------------------------------------------------
    uint8_t read(uint32_t addr)
    {
        return m_mem->read(addr);
    }
    //-----------------------------------------------------------------
    // step: Execute 1 clock cycle
    //-----------------------------------------------------------------
    void step(void)
    {
        wait();
    }
    //-----------------------------------------------------------------
    // reset: Release core from reset
    //-----------------------------------------------------------------
    void reset(uint32_t addr)
    {
        rst_cpu_in.write(true);
        reset_vector_in.write(addr);
        wait();
        rst_cpu_in.write(false);
    }

    // Not supported
    bool      get_stopped(void) { return false; } 
    bool      get_fault(void)  { return false; }
    void      set_interrupt(int irq)   { }
    void      enable_trace(uint32_t mask) { }
    uint32_t  get_opcode(void)    { }
    uint32_t  get_pc(void)        { return 0; }
    bool      get_reg_valid(int r){ return 0; }
    uint32_t  get_register(int r) { return 0; }
    int       get_num_reg(void)   { return 32; }
    void      set_register(int r, uint32_t val) { }    
};
