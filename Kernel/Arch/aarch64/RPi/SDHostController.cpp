/*
 * Copyright (c) 2023, the SerenityOS developers.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include <AK/Singleton.h>
#include <Kernel/Arch/aarch64/RPi/GPIO.h>
#include <Kernel/Arch/aarch64/RPi/MMIO.h>
#include <Kernel/Arch/aarch64/RPi/SDHostController.h>

namespace Kernel::RPi {

Singleton<SDHostController> s_sdhc;

SDHostController& SDHostController::the()
{
    return *s_sdhc;
}

SDHostController::SDHostController()
    : ::SDHostController()
{
    // We assume that the GPIOs are set up correctly by the bootloader. Otherwise, we should
    // obtain them from the pinctrl-0 property of the device tree node.

    m_registers = MMIO::the().peripheral<SD::HostControlRegisterMap>(0x30'0000);
}

}
