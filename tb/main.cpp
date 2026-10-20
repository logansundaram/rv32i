#include "Vcnt.h" // generated
#include "verilated.h"
#include <cstdio>

int main(int argc, char **argv)
{
    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    Vcnt top(&ctx);

    // reset: hold rst high for two clock edges
    top.rst = 1;
    for (int i = 0; i < 2; i++)
    {
        top.clk = 0;
        top.eval();
        top.clk = 1;
        top.eval();
    }
    top.rst = 0;

    // run 10 clock cycles
    for (int i = 0; i < 10; i++)
    {
        top.clk = 0;
        top.eval();
        top.clk = 1;
        top.eval();
        unsigned long long q = top.q_o;
        printf("%llu\n", q);
    }

    top.final();
    return 0;
}