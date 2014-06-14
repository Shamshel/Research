################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
PR_Project_XADC.elf.size \

ELFCHECK += \
PR_Project_XADC.elf.elfcheck \


# All Target
all: PR_Project_XADC.elf secondary-outputs

# Tool invocations
PR_Project_XADC.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../PR_Project_XADC_bsp/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.b -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "PR_Project_XADC.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

PR_Project_XADC.elf.size: PR_Project_XADC.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size PR_Project_XADC.elf  |tee "PR_Project_XADC.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

PR_Project_XADC.elf.elfcheck: PR_Project_XADC.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck PR_Project_XADC.elf -hw ../../PR_Project_XADC_hw/system.xml -pe microblaze_0  |tee "PR_Project_XADC.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) PR_Project_XADC.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
