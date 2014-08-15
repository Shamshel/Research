/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/ECE/Documents/freq_counter/freq_counter/frequency_counter.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_1755983447_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    unsigned char t17;
    char *t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    t1 = (t0 + 3832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng0);
    t3 = (32 - 1);
    t2 = (t0 + 7964);
    *((int *)t2) = t3;
    t4 = (t0 + 7968);
    *((int *)t4) = 0;
    t5 = t3;
    t6 = 0;

LAB4:    if (t5 >= t6)
        goto LAB5;

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(65, ng0);
    t7 = (t0 + 2312U);
    t8 = *((char **)t7);
    t9 = (32 - 1);
    t7 = (t0 + 7964);
    t10 = *((int *)t7);
    t11 = (t9 - t10);
    t12 = (t11 - 31);
    t13 = (t12 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t11);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t16 = (t8 + t15);
    t17 = *((unsigned char *)t16);
    t18 = (t0 + 7964);
    t19 = *((int *)t18);
    t20 = (t19 - 31);
    t21 = (t20 * -1);
    t22 = (1 * t21);
    t23 = (0U + t22);
    t24 = (t0 + 4744);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = t17;
    xsi_driver_first_trans_delta(t24, t23, 1, 0LL);

LAB6:    t2 = (t0 + 7964);
    t5 = *((int *)t2);
    t4 = (t0 + 7968);
    t6 = *((int *)t4);
    if (t5 == t6)
        goto LAB7;

LAB8:    t3 = (t5 + -1);
    t5 = t3;
    t7 = (t0 + 7964);
    *((int *)t7) = t5;
    goto LAB4;

LAB1:    return;
}

static void work_a_1755983447_3212880686_p_1(char *t0)
{
    char t24[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    unsigned char t17;
    int t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t25;
    char *t26;
    int t27;
    unsigned int t28;
    int t29;
    unsigned char t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4648);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 4808);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 4872);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1512U);
    t6 = *((char **)t2);
    t11 = (32 - 1);
    t12 = (t11 - 31);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t2 = (t6 + t15);
    t16 = *((unsigned char *)t2);
    t17 = (t16 == (unsigned char)3);
    if (t17 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(104, ng0);
    t1 = (t0 + 4808);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 4872);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(86, ng0);
    t7 = (t0 + 1992U);
    t8 = *((char **)t7);
    t18 = *((int *)t8);
    t7 = (t0 + 1512U);
    t19 = *((char **)t7);
    t20 = (32 - 2);
    t21 = (31 - t20);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t7 = (t19 + t23);
    t25 = (t24 + 0U);
    t26 = (t25 + 0U);
    *((int *)t26) = 30;
    t26 = (t25 + 4U);
    *((int *)t26) = 0;
    t26 = (t25 + 8U);
    *((int *)t26) = -1;
    t27 = (0 - 30);
    t28 = (t27 * -1);
    t28 = (t28 + 1);
    t26 = (t25 + 12U);
    *((unsigned int *)t26) = t28;
    t29 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t7, t24);
    t30 = (t18 < t29);
    if (t30 != 0)
        goto LAB13;

LAB15:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t12 = (32 - 2);
    t13 = (31 - t12);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t5 + t15);
    t6 = (t24 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 30;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t18 = (0 - 30);
    t21 = (t18 * -1);
    t21 = (t21 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t21;
    t20 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t1, t24);
    t3 = (t11 >= t20);
    if (t3 != 0)
        goto LAB16;

LAB17:
LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(89, ng0);
    t26 = (t0 + 4808);
    t31 = (t26 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    *((unsigned char *)t34) = (unsigned char)3;
    xsi_driver_first_trans_fast(t26);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t12 = (t11 + 1);
    t1 = (t0 + 4872);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    goto LAB14;

LAB16:    xsi_set_current_line(96, ng0);
    t7 = (t0 + 4808);
    t8 = (t7 + 56U);
    t19 = *((char **)t8);
    t25 = (t19 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t1 = (t0 + 4872);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t11;
    xsi_driver_first_trans_fast(t1);
    goto LAB14;

}

static void work_a_1755983447_3212880686_p_2(char *t0)
{
    char t20[16];
    char t21[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    unsigned char t18;
    int t19;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4664);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 2848U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(121, ng0);
    t1 = (t0 + 4936);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(122, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t5 = (t0 + 5000);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 1512U);
    t6 = *((char **)t2);
    t12 = (32 - 1);
    t13 = (t12 - 31);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t2 = (t6 + t16);
    t17 = *((unsigned char *)t2);
    t18 = (t17 == (unsigned char)2);
    if (t18 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB13;

LAB14:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB20;

LAB21:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t3 = t11;
    goto LAB9;

LAB10:    xsi_set_current_line(130, ng0);
    t7 = (t0 + 2848U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    *((int *)t7) = 0;
    xsi_set_current_line(131, ng0);
    t1 = (t0 + 4936);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(132, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t5 = (t0 + 5000);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast(t5);
    goto LAB11;

LAB13:    xsi_set_current_line(137, ng0);
    t1 = (t0 + 2848U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t13 = (t12 + 1);
    t1 = (t0 + 2848U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    *((int *)t1) = t13;
    xsi_set_current_line(139, ng0);
    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t3 = (t12 >= 256);
    if (t3 != 0)
        goto LAB15;

LAB17:
LAB16:    xsi_set_current_line(145, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t13 = (32 - 1);
    t1 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t20, t12, t13);
    t6 = ((IEEE_P_2592010699) + 4024);
    t5 = xsi_base_array_concat(t5, t21, t6, (char)99, (unsigned char)3, (char)97, t1, t20, (char)101);
    t7 = (t20 + 12U);
    t14 = *((unsigned int *)t7);
    t14 = (t14 * 1U);
    t15 = (1U + t14);
    t3 = (32U != t15);
    if (t3 == 1)
        goto LAB18;

LAB19:    t8 = (t0 + 5000);
    t9 = (t8 + 56U);
    t22 = *((char **)t9);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t5, 32U);
    xsi_driver_first_trans_fast(t8);
    goto LAB11;

LAB15:    xsi_set_current_line(141, ng0);
    t1 = (t0 + 2152U);
    t5 = *((char **)t1);
    t13 = *((int *)t5);
    t19 = (t13 + 1);
    t1 = (t0 + 4936);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t19;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB18:    xsi_size_not_matching(32U, t15, 0);
    goto LAB19;

LAB20:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 2848U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(151, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t1 = (t0 + 4936);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(152, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t13 = (32 - 1);
    t1 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t20, t12, t13);
    t6 = ((IEEE_P_2592010699) + 4024);
    t5 = xsi_base_array_concat(t5, t21, t6, (char)99, (unsigned char)2, (char)97, t1, t20, (char)101);
    t7 = (t20 + 12U);
    t14 = *((unsigned int *)t7);
    t14 = (t14 * 1U);
    t15 = (1U + t14);
    t3 = (32U != t15);
    if (t3 == 1)
        goto LAB22;

LAB23:    t8 = (t0 + 5000);
    t9 = (t8 + 56U);
    t22 = *((char **)t9);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t5, 32U);
    xsi_driver_first_trans_fast(t8);
    goto LAB11;

LAB22:    xsi_size_not_matching(32U, t15, 0);
    goto LAB23;

}


extern void work_a_1755983447_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1755983447_3212880686_p_0,(void *)work_a_1755983447_3212880686_p_1,(void *)work_a_1755983447_3212880686_p_2};
	xsi_register_didat("work_a_1755983447_3212880686", "isim/frequency_counter_testbench_isim_beh.exe.sim/work/a_1755983447_3212880686.didat");
	xsi_register_executes(pe);
}
