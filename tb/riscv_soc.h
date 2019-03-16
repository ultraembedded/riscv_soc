
#ifndef RISCV_SOC_H
#define RISCV_SOC_H
#include <systemc.h>

#include "axi4_lite.h"
#include "axi4.h"

class Vriscv_soc;
class VerilatedVcdSc;

//-------------------------------------------------------------
// riscv_soc: RTL wrapper class
//-------------------------------------------------------------
class riscv_soc: public sc_module
{
public:
    sc_in <bool> clk_in;
    sc_in <bool> rst_in;
    sc_in <sc_uint<32> > reset_vector_in;
    sc_in <bool> rst_cpu_in;
    sc_out <bool> spi_clk_out;
    sc_in <bool> spi_miso_in;
    sc_out <bool> spi_mosi_out;
    sc_out <bool> spi_cs_out;
    sc_out <bool> uart_rxd_out;
    sc_in <bool> uart_txd_in;
    sc_out <sc_uint<32> > gpio_output_out;
    sc_in <sc_uint<32> > gpio_input_in;
    sc_out <sc_uint<32> > gpio_output_enable_out;

    sc_in  <axi4_lite_master>  inport_in;
    sc_out <axi4_lite_slave> inport_out;
    sc_in  <axi4_slave>  mem_in;
    sc_out <axi4_master> mem_out;

    //-------------------------------------------------------------
    // Constructor
    //-------------------------------------------------------------
    SC_HAS_PROCESS(riscv_soc);
    riscv_soc(sc_module_name name);

    //-------------------------------------------------------------
    // Trace
    //-------------------------------------------------------------
    virtual void add_trace(sc_trace_file *vcd, std::string prefix)
    {
        #undef  TRACE_SIGNAL
        #define TRACE_SIGNAL(s) sc_trace(vcd,s,prefix + #s)

        TRACE_SIGNAL(clk_in);
        TRACE_SIGNAL(rst_in);
        TRACE_SIGNAL(reset_vector_in);
        TRACE_SIGNAL(rst_cpu_in);
        TRACE_SIGNAL(spi_clk_out);
        TRACE_SIGNAL(spi_miso_in);
        TRACE_SIGNAL(spi_mosi_out);
        TRACE_SIGNAL(spi_cs_out);
        TRACE_SIGNAL(uart_rxd_out);
        TRACE_SIGNAL(uart_txd_in);
        TRACE_SIGNAL(gpio_output_out);
        TRACE_SIGNAL(gpio_input_in);
        TRACE_SIGNAL(gpio_output_enable_out);
        TRACE_SIGNAL(inport_in);
        TRACE_SIGNAL(inport_out);
        TRACE_SIGNAL(mem_in);
        TRACE_SIGNAL(mem_out);

        #undef  TRACE_SIGNAL
    }

    void async_outputs(void);
    void trace_rtl(void);
    void trace_enable(VerilatedVcdSc *p);

    //-------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------
private:
    sc_signal <bool> m_clk_in;
    sc_signal <bool> m_rst_in;
    sc_signal <sc_uint<32> > m_reset_vector_in;
    sc_signal <bool> m_inport_awvalid_in;
    sc_signal <sc_uint<32> > m_inport_awaddr_in;
    sc_signal <bool> m_inport_wvalid_in;
    sc_signal <sc_uint<32> > m_inport_wdata_in;
    sc_signal <sc_uint<4> > m_inport_wstrb_in;
    sc_signal <bool> m_inport_bready_in;
    sc_signal <bool> m_inport_arvalid_in;
    sc_signal <sc_uint<32> > m_inport_araddr_in;
    sc_signal <bool> m_inport_rready_in;
    sc_signal <bool> m_rst_cpu_in;
    sc_signal <bool> m_spi_miso_in;
    sc_signal <bool> m_uart_txd_in;
    sc_signal <sc_uint<32> > m_gpio_input_in;
    sc_signal <bool> m_mem_awready_in;
    sc_signal <bool> m_mem_wready_in;
    sc_signal <bool> m_mem_bvalid_in;
    sc_signal <sc_uint<2> > m_mem_bresp_in;
    sc_signal <sc_uint<4> > m_mem_bid_in;
    sc_signal <bool> m_mem_arready_in;
    sc_signal <bool> m_mem_rvalid_in;
    sc_signal <sc_uint<32> > m_mem_rdata_in;
    sc_signal <sc_uint<2> > m_mem_rresp_in;
    sc_signal <sc_uint<4> > m_mem_rid_in;
    sc_signal <bool> m_mem_rlast_in;

    sc_signal <bool> m_inport_awready_out;
    sc_signal <bool> m_inport_wready_out;
    sc_signal <bool> m_inport_bvalid_out;
    sc_signal <sc_uint<2> > m_inport_bresp_out;
    sc_signal <bool> m_inport_arready_out;
    sc_signal <bool> m_inport_rvalid_out;
    sc_signal <sc_uint<32> > m_inport_rdata_out;
    sc_signal <sc_uint<2> > m_inport_rresp_out;
    sc_signal <bool> m_spi_clk_out;
    sc_signal <bool> m_spi_mosi_out;
    sc_signal <bool> m_spi_cs_out;
    sc_signal <bool> m_uart_rxd_out;
    sc_signal <sc_uint<32> > m_gpio_output_out;
    sc_signal <sc_uint<32> > m_gpio_output_enable_out;
    sc_signal <bool> m_mem_awvalid_out;
    sc_signal <sc_uint<32> > m_mem_awaddr_out;
    sc_signal <sc_uint<4> > m_mem_awid_out;
    sc_signal <sc_uint<8> > m_mem_awlen_out;
    sc_signal <sc_uint<2> > m_mem_awburst_out;
    sc_signal <bool> m_mem_wvalid_out;
    sc_signal <sc_uint<32> > m_mem_wdata_out;
    sc_signal <sc_uint<4> > m_mem_wstrb_out;
    sc_signal <bool> m_mem_wlast_out;
    sc_signal <bool> m_mem_bready_out;
    sc_signal <bool> m_mem_arvalid_out;
    sc_signal <sc_uint<32> > m_mem_araddr_out;
    sc_signal <sc_uint<4> > m_mem_arid_out;
    sc_signal <sc_uint<8> > m_mem_arlen_out;
    sc_signal <sc_uint<2> > m_mem_arburst_out;
    sc_signal <bool> m_mem_rready_out;

public:
    Vriscv_soc *m_rtl;
#if VM_TRACE
    VerilatedVcdSc * m_vcd;
#endif 
};

#endif