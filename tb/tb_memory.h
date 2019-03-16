#ifndef TB_MEMORY_H
#define TB_MEMORY_H

#include <systemc.h>

#define TB_MEM_MAX_REGIONS    10

//-----------------------------------------------------------------
// tb_mem_region: Memory region entity
//-----------------------------------------------------------------
class tb_mem_region
{
public:
    tb_mem_region(uint32_t base, uint32_t size, uint8_t *pMem = NULL)
    {
        m_base    = base;
        m_size    = size;
        m_mem     = pMem ? pMem : new uint8_t[size];
    }

    uint32_t get_base(void) { return m_base; }
    uint32_t get_size(void) { return m_size; }

    bool match(uint32_t addr)
    {
        return (addr >= m_base) && (addr < (m_base + m_size));
    }

    void write(uint32_t addr, uint8_t data)
    {
        if (match(addr))
            m_mem[addr - m_base] = data;
    }

    uint8_t read(uint32_t addr)
    {
        if (match(addr))
            return m_mem[addr - m_base];
        else
            return 0;
    }

    uint8_t *get_array(void)        { return m_mem; }

protected:
    uint32_t             m_base;
    uint32_t             m_size;

    uint8_t *            m_mem;
};

//-----------------------------------------------------------------
// tb_memory: Memory base class
//-----------------------------------------------------------------
class tb_memory
{
public:
    tb_memory()
    {
        for (int i=0;i<TB_MEM_MAX_REGIONS;i++)
            m_mem[i] = NULL;
    }

    bool add_region(uint32_t base, uint32_t size)
    {
        for (int i=0;i<TB_MEM_MAX_REGIONS;i++)
            if (!m_mem[i])
            {
                m_mem[i] = new tb_mem_region(base, size);
                return true;
            }
            // Detect overlapping regions
            else if (m_mem[i]->match(base) || m_mem[i]->match(base + size - 1))
                return false;
    }

    bool add_region(uint8_t *mem, uint32_t base, uint32_t size)
    {
        for (int i=0;i<TB_MEM_MAX_REGIONS;i++)
            if (!m_mem[i])
            {
                m_mem[i] = new tb_mem_region(base, size, mem);
                return true;
            }
            // Detect overlapping regions
            else if (m_mem[i]->match(base) || m_mem[i]->match(base + size - 1))
                return false;
    }

    bool valid_addr(uint32_t addr)
    {
        for (int i=0;i<TB_MEM_MAX_REGIONS;i++)
            if (m_mem[i] && m_mem[i]->match(addr))
                return true;

        return false;
    }

    void write(uint32_t addr, uint8_t data)
    {
        bool found = false;
        for (int i=0;i<TB_MEM_MAX_REGIONS && !found;i++)
            if (m_mem[i] && m_mem[i]->match(addr))
            {
                m_mem[i]->write(addr, data);
                found = true;
            }

        if (!found)
        {
            printf("ERROR: Write out of range 0x%08x\n", addr);
            sc_assert(0);
        }
    }

    uint8_t read(uint32_t addr)
    {
        for (int i=0;i<TB_MEM_MAX_REGIONS;i++)
            if (m_mem[i] && m_mem[i]->match(addr))
                return m_mem[i]->read(addr);

        printf("ERROR: Read out of range 0x%08x\n", addr);
        sc_assert(0);
        return 0;
    }

    uint8_t* get_array(uint32_t addr)
    {
        for (int i=0;i<TB_MEM_MAX_REGIONS;i++)
            if (m_mem[i] && m_mem[i]->match(addr))
                return m_mem[i]->get_array();

        printf("ERROR: Access out of range 0x%08x\n", addr);
        sc_assert(0);
        return NULL;
    }

protected:
    tb_mem_region *m_mem[TB_MEM_MAX_REGIONS];
};

#endif