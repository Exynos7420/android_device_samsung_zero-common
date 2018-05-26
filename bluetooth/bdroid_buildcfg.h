/*
 * Copyright (C) 2012 The Android Open Source Project
 * Copyright (C) 2014 The CyanogenMod Project <http://www.cyanogenmod.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cutils/properties.h>
#include <string.h>

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

static inline const char* getBTName()
{
    char bootloader[PROPERTY_VALUE_MAX];
    property_get("ro.bootloader", bootloader, "");

    if (!strncmp(bootloader, "G920", 4)) {
        return "Samsung Galaxy S6";
    }

    if (!strncmp(bootloader, "G925", 4)) {
        return "Samsung Galaxy S6 Edge";
    }

    return "Samsung Galaxy";
}

#define BTM_DEF_LOCAL_NAME getBTName()

#define BLE_VND_INCLUDED         TRUE
#define BTIF_HF_WBS_PREFERRED    TRUE    /* Use WBS */
#define BTM_WBS_INCLUDED         TRUE    /* Enable WBS */

#endif
