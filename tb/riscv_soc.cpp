
#include "riscv_soc.h"
#include "Vriscv_soc.h"

#if VM_TRACE
#include "verilated.h"
#include "verilated_vcd_sc.h"
#endif

//-------------------------------------------------------------
// Constructor
//-------------------------------------------------------------
riscv_soc::riscv_soc(sc_module_name name): sc_module(name)
{
    m_rtl = new Vriscv_soc("Vriscv_soc");
    m_rtl->clk_i(m_clk_in);
    m_rtl->rst_i(m_rst_in);
    m_rtl->reset_vector_i(m_reset_vector_in);
    m_rtl->inport_awvalid_i(m_inport_awvalid_in);
    m_rtl->inport_awaddr_i(m_inport_awaddr_in);
    m_rtl->inport_wvalid_i(m_inport_wvalid_in);
    m_rtl->inport_wdata_i(m_inport_wdata_in);
    m_rtl->inport_wstrb_i(m_inport_wstrb_in);
    m_rtl->inport_bready_i(m_inport_bready_in);
    m_rtl->inport_arvalid_i(m_inport_arvalid_in);
    m_rtl->inport_araddr_i(m_inport_araddr_in);
    m_rtl->inport_rready_i(m_inport_rready_in);
    m_rtl->rst_cpu_i(m_rst_cpu_in);
    m_rtl->spi_miso_i(m_spi_miso_in);
    m_rtl->uart_txd_i(m_uart_txd_in);
    m_rtl->gpio_input_i(m_gpio_input_in);
    m_rtl->mem_awready_i(m_mem_awready_in);
    m_rtl->mem_wready_i(m_mem_wready_in);
    m_rtl->mem_bvalid_i(m_mem_bvalid_in);
    m_rtl->mem_bresp_i(m_mem_bresp_in);
    m_rtl->mem_bid_i(m_mem_bid_in);
    m_rtl->mem_arready_i(m_mem_arready_in);
    m_rtl->mem_rvalid_i(m_mem_rvalid_in);
    m_rtl->mem_rdata_i(m_mem_rdata_in);
    m_rtl->mem_rresp_i(m_mem_rresp_in);
    m_rtl->mem_rid_i(m_mem_rid_in);
    m_rtl->mem_rlast_i(m_mem_rlast_in);
    m_rtl->inport_awready_o(m_inport_awready_out);
    m_rtl->inport_wready_o(m_inport_wready_out);
    m_rtl->inport_bvalid_o(m_inport_bvalid_out);
    m_rtl->inport_bresp_o(m_inport_bresp_out);
    m_rtl->inport_arready_o(m_inport_arready_out);
    m_rtl->inport_rvalid_o(m_inport_rvalid_out);
    m_rtl->inport_rdata_o(m_inport_rdata_out);
    m_rtl->inport_rresp_o(m_inport_rresp_out);
    m_rtl->spi_clk_o(m_spi_clk_out);
    m_rtl->spi_mosi_o(m_spi_mosi_out);
    m_rtl->spi_cs_o(m_spi_cs_out);
    m_rtl->uart_rxd_o(m_uart_rxd_out);
    m_rtl->gpio_output_o(m_gpio_output_out);
    m_rtl->gpio_output_enable_o(m_gpio_output_enable_out);
    m_rtl->mem_awvalid_o(m_mem_awvalid_out);
    m_rtl->mem_awaddr_o(m_mem_awaddr_out);
    m_rtl->mem_awid_o(m_mem_awid_out);
    m_rtl->mem_awlen_o(m_mem_awlen_out);
    m_rtl->mem_awburst_o(m_mem_awburst_out);
    m_rtl->mem_wvalid_o(m_mem_wvalid_out);
    m_rtl->mem_wdata_o(m_mem_wdata_out);
    m_rtl->mem_wstrb_o(m_mem_wstrb_out);
    m_rtl->mem_wlast_o(m_mem_wlast_out);
    m_rtl->mem_bready_o(m_mem_bready_out);
    m_rtl->mem_arvalid_o(m_mem_arvalid_out);
    m_rtl->mem_araddr_o(m_mem_araddr_out);
    m_rtl->mem_arid_o(m_mem_arid_out);
    m_rtl->mem_arlen_o(m_mem_arlen_out);
    m_rtl->mem_arburst_o(m_mem_arburst_out);
    m_rtl->mem_rready_o(m_mem_rready_out);

    SC_METHOD(async_outputs);
    sensitive << clk_in;
    sensitive << rst_in;
    sensitive << reset_vector_in;
    sensitive << rst_cpu_in;
    sensitive << spi_miso_in;
    sensitive << uart_txd_in;
    sensitive << gpio_input_in;
    sensitive << inport_in;
    sensitive << mem_in;
    sensitive << m_inport_awready_out;
    sensitive << m_inport_wready_out;
    sensitive << m_inport_bvalid_out;
    sensitive << m_inport_bresp_out;
    sensitive << m_inport_arready_out;
    sensitive << m_inport_rvalid_out;
    sensitive << m_inport_rdata_out;
    sensitive << m_inport_rresp_out;
    sensitive << m_spi_clk_out;
    sensitive << m_spi_mosi_out;
    sensitive << m_spi_cs_out;
    sensitive << m_uart_rxd_out;
    sensitive << m_gpio_output_out;
    sensitive << m_gpio_output_enable_out;
    sensitive << m_mem_awvalid_out;
    sensitive << m_mem_awaddr_out;
    sensitive << m_mem_awid_out;
    sensitive << m_mem_awlen_out;
    sensitive << m_mem_awburst_out;
    sensitive << m_mem_wvalid_out;
    sensitive << m_mem_wdata_out;
    sensitive << m_mem_wstrb_out;
    sensitive << m_mem_wlast_out;
    sensitive << m_mem_bready_out;
    sensitive << m_mem_arvalid_out;
    sensitive << m_mem_araddr_out;
    sensitive << m_mem_arid_out;
    sensitive << m_mem_arlen_out;
    sensitive << m_mem_arburst_out;
    sensitive << m_mem_rready_out;

#if VM_TRACE
    m_vcd         = NULL;
#endif
}
//-------------------------------------------------------------
// trace_enable
//-------------------------------------------------------------
void riscv_soc::trace_enable(VerilatedVcdSc * p)
{
#if VM_TRACE
    m_vcd = p;
    m_rtl->trace (m_vcd, 99);
#endif
}
//-------------------------------------------------------------
// async_outputs
//-------------------------------------------------------------
void riscv_soc::async_outputs(void)
{
    m_clk_in.write(clk_in.read());
    m_rst_in.write(rst_in.read());
    m_reset_vector_in.write(reset_vector_in.read());
    m_rst_cpu_in.write(rst_cpu_in.read());
    m_spi_miso_in.write(spi_miso_in.read());
    m_uart_txd_in.write(uart_txd_in.read());
    m_gpio_input_in.write(gpio_input_in.read());
    spi_clk_out.write(m_spi_clk_out.read());
    spi_mosi_out.write(m_spi_mosi_out.read());
    spi_cs_out.write(m_spi_cs_out.read());
    uart_rxd_out.write(m_uart_rxd_out.read());
    gpio_output_out.write(m_gpio_output_out.read());
    gpio_output_enable_out.write(m_gpio_output_enable_out.read());

    axi4_lite_master inport_i = inport_in.read();
    m_inport_awvalid_in.write(inport_i.AWVALID); 
    m_inport_awaddr_in.write(inport_i.AWADDR); 
    m_inport_wvalid_in.write(inport_i.WVALID); 
    m_inport_wdata_in.write(inport_i.WDATA); 
    m_inport_wstrb_in.write(inport_i.WSTRB); 
    m_inport_bready_in.write(inport_i.BREADY); 
    m_inport_arvalid_in.write(inport_i.ARVALID); 
    m_inport_araddr_in.write(inport_i.ARADDR); 
    m_inport_rready_in.write(inport_i.RREADY); 


    axi4_lite_slave inport_o;
    inport_o.AWREADY = m_inport_awready_out.read(); 
    inport_o.WREADY = m_inport_wready_out.read(); 
    inport_o.BVALID = m_inport_bvalid_out.read(); 
    inport_o.BRESP = m_inport_bresp_out.read(); 
    inport_o.ARREADY = m_inport_arready_out.read(); 
    inport_o.RVALID = m_inport_rvalid_out.read(); 
    inport_o.RDATA = m_inport_rdata_out.read(); 
    inport_o.RRESP = m_inport_rresp_out.read(); 
    inport_out.write(inport_o);
    axi4_slave mem_i = mem_in.read();
    m_mem_awready_in.write(mem_i.AWREADY); 
    m_mem_wready_in.write(mem_i.WREADY); 
    m_mem_bvalid_in.write(mem_i.BVALID); 
    m_mem_bresp_in.write(mem_i.BRESP); 
    m_mem_bid_in.write(mem_i.BID); 
    m_mem_arready_in.write(mem_i.ARREADY); 
    m_mem_rvalid_in.write(mem_i.RVALID); 
    m_mem_rdata_in.write(mem_i.RDATA); 
    m_mem_rresp_in.write(mem_i.RRESP); 
    m_mem_rid_in.write(mem_i.RID); 
    m_mem_rlast_in.write(mem_i.RLAST); 


    axi4_master mem_o;
    mem_o.AWVALID = m_mem_awvalid_out.read(); 
    mem_o.AWADDR = m_mem_awaddr_out.read(); 
    mem_o.AWID = m_mem_awid_out.read(); 
    mem_o.AWLEN = m_mem_awlen_out.read(); 
    mem_o.AWBURST = m_mem_awburst_out.read(); 
    mem_o.WVALID = m_mem_wvalid_out.read(); 
    mem_o.WDATA = m_mem_wdata_out.read(); 
    mem_o.WSTRB = m_mem_wstrb_out.read(); 
    mem_o.WLAST = m_mem_wlast_out.read(); 
    mem_o.BREADY = m_mem_bready_out.read(); 
    mem_o.ARVALID = m_mem_arvalid_out.read(); 
    mem_o.ARADDR = m_mem_araddr_out.read(); 
    mem_o.ARID = m_mem_arid_out.read(); 
    mem_o.ARLEN = m_mem_arlen_out.read(); 
    mem_o.ARBURST = m_mem_arburst_out.read(); 
    mem_o.RREADY = m_mem_rready_out.read(); 
    mem_out.write(mem_o);

}
