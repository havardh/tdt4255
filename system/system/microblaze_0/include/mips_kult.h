/*****************************************************************************
* Filename:          C:\Users\runarbol\Desktop\tdt4255-new\system\system/drivers/mips_kult_v1_00_a/src/mips_kult.h
* Version:           1.00.a
* Description:       mips_kult Driver Header File
* Date:              Tue Oct 01 13:14:04 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef MIPS_KULT_H
#define MIPS_KULT_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 * -- SLV_REG3 : user logic slave module register 3
 * -- SLV_REG4 : user logic slave module register 4
 */
#define MIPS_KULT_USER_SLV_SPACE_OFFSET (0x00000000)
#define MIPS_KULT_SLV_REG0_OFFSET (MIPS_KULT_USER_SLV_SPACE_OFFSET + 0x00000000)
#define MIPS_KULT_SLV_REG1_OFFSET (MIPS_KULT_USER_SLV_SPACE_OFFSET + 0x00000004)
#define MIPS_KULT_SLV_REG2_OFFSET (MIPS_KULT_USER_SLV_SPACE_OFFSET + 0x00000008)
#define MIPS_KULT_SLV_REG3_OFFSET (MIPS_KULT_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define MIPS_KULT_SLV_REG4_OFFSET (MIPS_KULT_USER_SLV_SPACE_OFFSET + 0x00000010)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a MIPS_KULT register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the MIPS_KULT device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void MIPS_KULT_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define MIPS_KULT_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a MIPS_KULT register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the MIPS_KULT device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 MIPS_KULT_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define MIPS_KULT_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from MIPS_KULT user logic slave registers.
 *
 * @param   BaseAddress is the base address of the MIPS_KULT device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void MIPS_KULT_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 MIPS_KULT_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define MIPS_KULT_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (MIPS_KULT_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define MIPS_KULT_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (MIPS_KULT_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define MIPS_KULT_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (MIPS_KULT_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define MIPS_KULT_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (MIPS_KULT_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define MIPS_KULT_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (MIPS_KULT_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))

#define MIPS_KULT_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (MIPS_KULT_SLV_REG0_OFFSET) + (RegOffset))
#define MIPS_KULT_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (MIPS_KULT_SLV_REG1_OFFSET) + (RegOffset))
#define MIPS_KULT_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (MIPS_KULT_SLV_REG2_OFFSET) + (RegOffset))
#define MIPS_KULT_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (MIPS_KULT_SLV_REG3_OFFSET) + (RegOffset))
#define MIPS_KULT_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (MIPS_KULT_SLV_REG4_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the MIPS_KULT instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus MIPS_KULT_SelfTest(void * baseaddr_p);

#endif /** MIPS_KULT_H */
