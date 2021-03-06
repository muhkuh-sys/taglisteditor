---------------------------------------------------------------------------
-- Copyright (C) 2012 Hilscher Gesellschaft f�r Systemautomation mbH
--
-- Description:
--   Defines tags used by rcX
--
--  Changes:
--    Date        Author  Description
---------------------------------------------------------------------------
-- 2019-10-25     SL      added HIL_TAG_DDP_MODE_AFTER_STARTUP  0x00001081
--                        added HIL_TAG_PHY_ENABLE_TIMEOUT      0x00001090
-- 2018-10-01     SL      added HIL_TAG_REMANENT_DATA_RESPONSIBLE 0x00001070
-- 2015-12-18     SL      changed %d to %u
-- 2015-10-15     SL      added RCX_TAG_DPM_BEHAVIOUR 0x00001062
-- 2012-09-05     SL      added RCX_TAG_SWAP_LNK_ACT_LED 0x00001042 
-- 2012-06-18     SL      added RCX_TAG_IOPIN 0x00001041 
-- 2012-03-01     SL      added RCX_TAG_DPM_SETTINGS 0x00001061
-- 2012-02-16     SL      added task priority/token 1
-- 2011-05-12     SL      factored out from taglist.lua
---------------------------------------------------------------------------

module("tagdefs_rcx", package.seeall)

---------------------------------------------------------------------------
-- SVN Keywords
--
SVN_DATE   ="$Date$"
SVN_VERSION="$Revision$"
-- $Author$
---------------------------------------------------------------------------
require("taglist")


CONSTANTS = {
    -- from rX_TagLists.h
    -- resource codes for LED tag
    RCX_LED_RESOURCE_TYPE_GPIO            =  1,
    RCX_LED_RESOURCE_TYPE_PIO             =  2,
    RCX_LED_RESOURCE_TYPE_HIFPIO          =  3,

    -- polarity codes for LED tag
    RCX_LED_POLARITY_NORMAL               =  0,
    RCX_LED_POLARITY_INVERTED             =  1,

    -- UART parameters
    RX_UART_BAUDRATE_300    =    3,
    RX_UART_BAUDRATE_600    =    6,
    RX_UART_BAUDRATE_1200   =   12,
    RX_UART_BAUDRATE_2400   =   24,
    RX_UART_BAUDRATE_4800   =   48,
    RX_UART_BAUDRATE_9600   =   96,
    RX_UART_BAUDRATE_19200  =  192,
    RX_UART_BAUDRATE_38400  =  384,
    RX_UART_BAUDRATE_57600  =  576,
    RX_UART_BAUDRATE_115200 = 1152,
    RX_UART_PARITY_NONE = 0,
    RX_UART_PARITY_ODD  = 1,
    RX_UART_PARITY_EVEN = 2,
    RX_UART_STOPBIT_1 = 0,
    RX_UART_STOPBIT_2 = 1,
    RX_UART_DATABIT_5 = 1,
    RX_UART_DATABIT_6 = 2,
    RX_UART_DATABIT_7 = 3,
    RX_UART_DATABIT_8 = 4,
    RX_UART_DATABIT_9 = 5,
    RX_UART_RTS_NONE          = 0,
    RX_UART_RTS_AUTO_INBITS   = 1,
    RX_UART_RTS_AUTO_INCLOCKS = 2,
    RX_UART_RTS_AUTO_INTICKS  = 3,
    RX_UART_RTS_SELF          = 4,
    RX_UART_RTS_DEFAULT       = 0,
    RX_UART_RTS_ACTIVE_HIGH   = 1,
    RX_UART_RTS_ACTIVE_LOW    = 2,
    RX_UART_CTS_NONE        = 0,
    RX_UART_CTS_AUTO        = 1,
    RX_UART_CTS_SELF        = 2,
    RX_UART_CTS_DEFAULT     = 0,
    RX_UART_CTS_ACTIVE_HIGH = 1,
    RX_UART_CTS_ACTIVE_LOW  = 2,

    -- DPM mode settings for RX_TAG_DPM_SETTINGS
    RX_HIF_MODE_HIGH_IMPEDANCE = 0,     -- Bus drivers are not enabled, bus is floating
    RX_HIF_MODE_EXTENSIONBUS   = 1,     -- Bus is used as extension bus to connect FLASH/RAM devices
    RX_HIF_MODE_DPM_UP8BIT     = 2,     -- Dualport Memory Bus 8 Bit Data interface
    RX_HIF_MODE_DPM_UP16BIT    = 3,     -- Dualport Memory Bus 16 Bit Data interface
    RX_HIF_MODE_IO             = 4,     -- Peripheral I/O Bus
    RX_HIF_MODE_RSRVD1         = 5,     -- reserved define for internal use

    -- DDP Mode
    DDP_MODE_ACTIVE = 1,
    DDP_MODE_PASSIVE = 0,    
}


RX_UART_BAUDRATE = {
    {name="300"    ,value =    3},
    {name="600"    ,value =    6},
    {name="1200"   ,value =   12},
    {name="2400"   ,value =   24},
    {name="4800"   ,value =   48},
    {name="9600"   ,value =   96},
    {name="19200"  ,value =  192},
    {name="38400"  ,value =  384},
    {name="57600"  ,value =  576},
    {name="115200" ,value = 1152}
}

RX_UART_PARITY = {
    {name="None" ,value = 0},
    {name="Odd"  ,value = 1},
    {name="Even" ,value = 2}
}

RX_UART_STOPBIT = {
    {name="1", value = 0},
    {name="2", value = 1},
}

RX_UART_DATABIT = {
    {name="5", value = 1},
    {name="6", value = 2},
    {name="7", value = 3},
    {name="8", value = 4},
    {name="9", value = 5},
}

RX_UART_RTS_MODE = {
    {name="None",      value = 0},
    {name="Auto/Bits",   value = 1},
    {name="Auto/Clock cycles", value = 2},
    -- {name="Auto/System Ticks",  value = 3},
    {name="Self",      value = 4},
}

RX_UART_RTS_CTS_POLARITY = {
    {name="Default",      value = 0},
    {name="Active High",  value = 1},
    {name="Active Low",   value = 2},
}

RX_UART_CTS_MODE = {
    {name="None",      value = 0},
    {name="Auto",      value = 1},
    {name="Self",      value = 2},
}

RX_UART_NUMBER = {
    {name="0",      value = 0},
    {name="1",      value = 1},
}

RX_FIFO_TRIGGER_LEVEL = {
    {name="0",      value = 0},

}

DPM_SETTINGS_DPM_MODE = {
    {name="8 Bit",  value = 2},
    {name="16 Bit", value = 3},
    {name="PCI / Reserved1",    value = 5},
}

DDP_MODE = {
    {name="Active",      value = 1},
    {name="Passive",     value = 0},
}

-- add TSK_PRIO_01 ... TSK_PRIO_55 and TSK_TOK_01 ... TSK_TOK_55
-- for task priorities: TSK_PRIO_01 = 8 ... TSK_PRIO_55 = 62
-- for task tokens: TSK_TOK_01 = 8 ... TSK_TOK_55 = 62
local COMBO_TASKPRIO ={nBits=32, values={{name="-----", value=0}}}
local COMBO_TASKTOKEN={nBits=32, values={{name="-----", value=0}}}
for i=1, 55 do
    CONSTANTS[string.format("TSK_PRIO_%02d", i)]=i+7
    CONSTANTS[string.format("TSK_TOK_%02d", i)]=i+7
    table.insert(COMBO_TASKPRIO.values, {name="TSK_PRIO_"..tonumber(i), value=i+7})
    table.insert(COMBO_TASKTOKEN.values, {name="TSK_TOK_"..tonumber(i), value=i+7})
end

-- for interrupt priorities: 0-31
local COMBO_IRQPRIO={nBits=32, values={}}
for i=0, 31 do
    table.insert(COMBO_IRQPRIO.values, {name=string.format("%u", i), value=i})
end


-- 16-char name string
local RCX_TAG_IDENTIFIER_T = {"STRING", "szIdentifier", desc="Identifier", size=16, mode="read-only"}




RCX_TAG_STRUCTS = {
----------------------------------------------------------------------------------------------
-- general tags
RCX_TAG_MEMSIZE_T =
    {{"UINT32", "ulMemSize",        mode="read-only", desc="Memory Size"}},
RCX_TAG_MIN_PERSISTENT_STORAGE_SIZE_T =
    {{"UINT32", "ulMinStorageSize", mode="read-only", desc="Min. Persistent Storage Size"}},
RCX_TAG_MIN_OS_VERSION_T =
    {{"rcxver", "ulMinOsVer",       mode="read-only", desc="Min. OS Version"}},
RCX_TAG_MAX_OS_VERSION_T =
    {{"rcxver", "ulMaxOsVer",       mode="read-only", desc="Max. OS Version"}},
RCX_TAG_MIN_CHIP_REV_T =
    {{"UINT32", "ulMinChipRev",     mode="read-only", desc="Min. Chip Revision"}},
RCX_TAG_MAX_CHIP_REV_T =
    {{"UINT32", "ulMaxChipRev",     mode="read-only", desc="Max. Chip Revision"}},
-- obsolete
-- RCX_TAG_NUM_COMM_CHANNELS_T =
--    {{"UINT32", "ulNumCommCh",      mode="read-only", desc="Number of Comm. Channels"}},

----------------------------------------------------------------------------------------------
-- Task

RCX_TAG_TASK_GROUP_T = {
  {"STRING", "szTaskListName",   desc="Task List Name", size=64, mode="read-only"},
  -- base priority for the tasks in the group
  {"UINT32", "ulBasePriority",
  desc="Base Priority",          editor="comboedit", editorParam=COMBO_TASKPRIO},
  -- base token for the tasks in the group
  {"UINT32", "ulBaseToken",
  desc="Base Token",             editor="comboedit", editorParam=COMBO_TASKTOKEN},
  -- range for priority and token
  {"UINT32", "ulRange",
  desc="Task Range",   editorParam={format="%u"}, mode="read-only"},
  -- group reference number (common to all tasks in the group)
  {"UINT32", "ulTaskGroupRef", desc="Task Group Ref.", mode="read-only"},
  nameField = "szTaskListName"
    },

RCX_TAG_TASK_T = {
  RCX_TAG_IDENTIFIER_T,
  -- task priority (offset)
  {"UINT32", "ulPriority", desc="Priority", editor="comboedit", editorParam=COMBO_TASKPRIO},
  -- task token (offset)
  {"UINT32", "ulToken", desc="Token", editor="comboedit", editorParam=COMBO_TASKTOKEN},
  nameField = "szIdentifier"
    },

----------------------------------------------------------------------------------------------
-- Timer

RCX_TAG_TIMER_T = {
  RCX_TAG_IDENTIFIER_T,
  -- following structure entries are compatible to RX_TIMER_SET_T
  {"UINT32",                                "ulTimNum",
  desc="Timer Number", editor="comboedit", editorParam={nBits=32, minValue=0, maxValue=4}},
  nameField = "szIdentifier"
    },

----------------------------------------------------------------------------------------------
-- Interrupt

RCX_TAG_INTERRUPT_GROUP_T = {
  {"STRING", "szInterruptListName", desc="Name", size=64, mode="read-only"},
  -- base interrupt priority for the interrupts in the group
  {"UINT32", "ulBaseIntPriority", desc="Int. Priority Base", editor="comboedit", editorParam=COMBO_IRQPRIO},
  -- number of interrupts in the group
  {"UINT32", "ulRangeInt", desc="Int. Priority Range", editorParam={format="%u"}, mode="read-only"},
  -- base task priority if one of the handlers is configured to run in task mode
  {"UINT32", "ulBaseTaskPriority", desc="Task Priority Base", editor="comboedit", editorParam=COMBO_TASKPRIO},
  -- base task token if one of the handlers is configured to run in task mode
  {"UINT32", "ulBaseTaskToken", desc="Task Token Base", editor="comboedit", editorParam=COMBO_TASKTOKEN},
  -- number of interrupts in the group that execute in task mode
  {"UINT32", "ulRangeTask", desc="Task Range", editorParam={format="%u"}, mode="read-only"},
  -- group reference number (common to all interrupts in the group)
  {"UINT32", "ulInterruptGroupRef", desc="Interrupt Group Ref.", mode="read-only"},
  nameField = "szInterruptListName"
},

RCX_TAG_INTERRUPT_T = {
  RCX_TAG_IDENTIFIER_T,
  -- interrupt priority
  {"UINT32", "ulInterruptPriority", desc="Interrupt Priority", editor="comboedit", editorParam=COMBO_IRQPRIO},
  -- interrupt handler task priority if the handler is configured to run in task mode (offset)
  {"UINT32", "ulTaskPriority", desc="Task Priority", editor="comboedit", editorParam=COMBO_TASKPRIO},
  -- interrupt handler task token if the handler is configured to run in task mode (offset)
  {"UINT32", "ulTaskToken", desc="Task Token", editor="comboedit", editorParam=COMBO_TASKTOKEN},
  nameField = "szIdentifier"
},

----------------------------------------------------------------------------------------------
-- UART

RCX_TAG_UART_T = {
  RCX_TAG_IDENTIFIER_T,
    {"UINT32", "ulUrtNumber"   , desc="UART number"           , editor="comboedit", editorParam={nBits=32, minValue=0, maxValue=1}},
    {"UINT32", "ulBaudRate"    , desc="Baud rate"             , editor="comboedit", editorParam={nBits=32, values = RX_UART_BAUDRATE}},
    {"UINT32", "ulParity"      , desc="Parity"                , editor="comboedit", editorParam={nBits=32, values = RX_UART_PARITY}},
    {"UINT32", "ulStopBits"    , desc="Stop bits"             , editor="comboedit", editorParam={nBits=32, values = RX_UART_STOPBIT}},
    {"UINT32", "ulDataBits"    , desc="Data bits"             , editor="comboedit", editorParam={nBits=32, values = RX_UART_DATABIT}},
    {"UINT32", "ulRxFifoLevel" , desc="Rx FIFO trigger level" , editor="comboedit", editorParam={nBits=32, minValue=0, maxValue=14}},
    {"UINT32", "ulTxFifoLevel" , desc="Tx FIFO trigger level" , editor="comboedit", editorParam={nBits=32, minValue=0, maxValue=14}},
    {"UINT32", "ulRtsMode"     , desc="RTS mode"              , editor="comboedit", editorParam={nBits=32, values = RX_UART_RTS_MODE}},
    {"UINT32", "ulRtsPolarity" , desc="RTS polarity"          , editor="comboedit", editorParam={nBits=32, values = RX_UART_RTS_CTS_POLARITY}},
    {"UINT32", "ulRtsForerun"  , desc="RTS forerun"           ,                     editorParam={nBits=32, format = "%u", minValue=0, maxValue=255}},
    {"UINT32", "ulRtsTrail"    , desc="RTS trail"             ,                     editorParam={nBits=32, format = "%u", minValue=0, maxValue=255}},
    {"UINT32", "ulCtsMode"     , desc="CTS mode"              , editor="comboedit", editorParam={nBits=32, values = RX_UART_CTS_MODE}},
    {"UINT32", "ulCtsPolarity" , desc="CTS polarity"          , editor="comboedit", editorParam={nBits=32, values = RX_UART_RTS_CTS_POLARITY}},
    nameField = "szIdentifier"
},

----------------------------------------------------------------------------------------------
-- xC

RCX_TAG_XC_T =
{
  RCX_TAG_IDENTIFIER_T,
  -- Specifies which Xc unit to use
  {"UINT32",                                "ulXcId",        desc="xC Unit",
     editor="comboedit", editorParam={nBits=32, minValue=0, maxValue=3}},
  nameField = "szIdentifier"

},

----------------------------------------------------------------------------------------------
-- LED

RCX_TAG_LED_T=
{
  RCX_TAG_IDENTIFIER_T,

  {"UINT32",                                "ulUsesResourceType", desc="Resource Type",
    editor="comboedit", editorParam={nBits=32,
    values={{name="GPIO", value=1},
            {name="PIO", value=2},
            --{name="HIF PIO", value=3}
            }}},

  {"UINT32",                                "ulPinNumber",   desc="Pin Number",
    editorParam ={format="%u"}},

  {"UINT32",                                "ulPolarity",    desc="Polarity",
    editor="comboedit", editorParam={nBits=32,
    values={{name="normal", value=0},{name="inverted", value=1}}}},
  nameField = "szIdentifier"
},



----------------------------------------------------------------------------------------------
-- IO Pin

RCX_TAG_IOPIN_T=
{
  RCX_TAG_IDENTIFIER_T,

  {"UINT32",                                "ulUsesResourceType", desc="Resource Type",
    editor="comboedit", editorParam={nBits=32,
    values={{name="GPIO", value=1},
            {name="PIO", value=2},
            --{name="HIF PIO", value=3}
            }}},

  {"UINT32",                                "ulPinNumber",   desc="Pin Number",
    editorParam ={format="%u"}},

  {"UINT32",                                "ulPolarity",    desc="Polarity",
    editor="comboedit", editorParam={nBits=32,
    values={{name="normal", value=0},{name="inverted", value=1}}}},
  nameField = "szIdentifier"
},


----------------------------------------------------------------------------------------------
-- Swap Link/Activity LED

RCX_TAG_SWAP_LNK_ACT_LED_T=
{
    {"UINT32", "bSwapLnkActLeds", desc="Swap Link/Activity LEDs",
        editor="checkboxedit",
        editorParam={nBits = 32, offValue = 0, onValue = 1, otherValues = true}
    },
},

----------------------------------------------------------------------------------------------
-- DPM communication channels

RCX_TAG_DPM_COMM_CHANNEL_DATA_T=
{
    {"UINT32", "ulNumCommChannels", desc="Number of comm. channels", editor="comboedit", editorParam={nBits=32, minValue=1, maxValue=4}},
    {"UINT32", "ulInDataSize0",  desc="Channel 0 Input Area size", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=27904}},
    {"UINT32", "ulOutDataSize0", desc=         "Output Area size", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=27904}},
    {"UINT32", "ulInDataSize1",  desc="Channel 1 Input Area size", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=27904}},
    {"UINT32", "ulOutDataSize1", desc=         "Output Area size", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=27904}},
    {"UINT32", "ulInDataSize2",  desc="Channel 2 Input Area size", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=27904}},
    {"UINT32", "ulOutDataSize2", desc=         "Output Area size", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=27904}},
    {"UINT32", "ulInDataSize3",  desc="Channel 3 Input Area size", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=27904}},
    {"UINT32", "ulOutDataSize3", desc=         "Output Area size", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=27904}},

    layout=
        {
            sizer="v",
            "ulNumCommChannels",
            {
                sizer="grid", cols=2, rows=4,
                "ulInDataSize0", "ulOutDataSize0",
                "ulInDataSize1", "ulOutDataSize1",
                "ulInDataSize2", "ulOutDataSize2",
                "ulInDataSize3", "ulOutDataSize3",
            }
        }
},


----------------------------------------------------------------------------------------------
-- DPM settings

RCX_TAG_DPM_SETTINGS_DATA_T=
{
    {"UINT32", "ulDpmMode",         desc="DPM Mode",         editor="comboedit", editorParam ={nBits=32, values=DPM_SETTINGS_DPM_MODE}},
    {"UINT32", "ulDpmSize",         desc="DPM Size",         editor="numedit",   editorParam ={format="%u"}},
    {"UINT32", "ulDpmBaseAddress",  desc="DPM Base Address", editor="numedit",   editorParam ={format="0x%08x"}},
},



----------------------------------------------------------------------------------------------
-- DPM behaviour

RCX_TAG_DPM_BEHAVIOUR_DATA_T =
{
    {"UINT8", "bComStateLegacyMode",         desc="COM State Legacy Mode",         
        editor="checkboxedit",
        editorParam={nBits = 8, offValue = 0, onValue = 1, otherValues = true}
    },
    {"UINT8", "bReserved1",        desc="Reserved1",     mode = "hidden"},
    {"UINT8", "bReserved2",        desc="Reserved2",     mode = "hidden"},
    {"UINT8", "bReserved3",        desc="Reserved3",     mode = "hidden"},
},



----------------------------------------------------------------------------------------------
-- REMANENT_DATA_RESPONSIBLE

HIL_TAG_REMANENT_DATA_RESPONSIBLE_DATA_T =
{
    {"UINT8", "bHandledByHost",         desc="Remanent Data stored by Host",         
        editor="checkboxedit",
        editorParam={nBits = 8, offValue = 0, onValue = 1, otherValues = true}
    },
    {"UINT8", "bReserved1",        desc="Reserved1",     mode = "hidden"},
    {"UINT8", "bReserved2",        desc="Reserved2",     mode = "hidden"},
    {"UINT8", "bReserved3",        desc="Reserved3",     mode = "hidden"},
},


----------------------------------------------------------------------------------------------
-- DDP Mode after firmware startup

HIL_TAG_DDP_INITIAL_STATE_DATA_T = {
    {"UINT8", "bDdpModeAfterStartup",         desc="DDP mode after firmware startup", editor="comboedit", editorParam ={nBits=8, values=DDP_MODE}    
    },
    {"UINT8", "bReserved1",        desc="Reserved1",     mode = "hidden"},
    {"UINT8", "bReserved2",        desc="Reserved2",     mode = "hidden"},
    {"UINT8", "bReserved3",        desc="Reserved3",     mode = "hidden"},
 
},

----------------------------------------------------------------------------------------------
-- Phy enable timeout after firmware startup

HIL_TAG_PHY_ENABLE_TIMEOUT_DATA_T = {
    {"UINT32", "ulPhyEnableTimeoutAfterStartup",  desc="Phy enable timeout after startup", editor="numedit", editorParam ={format="%u", minValue=0, maxValue=300}},
},



} -- end of structure definitions


RCX_TAG_DEFS = {
-- general tags
RCX_TAG_MEMSIZE =
    {paramtype = 0x800, datatype="RCX_TAG_MEMSIZE_T",                         desc="Memory Size"},
RCX_TAG_MIN_PERSISTENT_STORAGE_SIZE =
    {paramtype = 0x801, datatype="RCX_TAG_MIN_PERSISTENT_STORAGE_SIZE_T",     desc="Min. Storage Size"},
RCX_TAG_MIN_OS_VERSION =
    {paramtype = 0x802, datatype="RCX_TAG_MIN_OS_VERSION_T",                  desc="Min. OS Version"},
RCX_TAG_MAX_OS_VERSION =
    {paramtype = 0x803, datatype="RCX_TAG_MAX_OS_VERSION_T",                  desc="Max. OS Version"},
RCX_TAG_MIN_CHIP_REV =
    {paramtype = 0x804, datatype="RCX_TAG_MIN_CHIP_REV_T",                    desc="Min. Chip Revision"},
RCX_TAG_MAX_CHIP_REV =
    {paramtype = 0x805, datatype="RCX_TAG_MAX_CHIP_REV_T",                    desc="Max. Chip Revision"},

-- firmware tags
RCX_TAG_TASK_GROUP =
    {paramtype = 0x00001000, datatype="RCX_TAG_TASK_GROUP_T",                 desc="Task Group"},
RCX_TAG_TASK =
    {paramtype = 0x00001003, datatype="RCX_TAG_TASK_T",                       desc="Task"},
RCX_TAG_INTERRUPT_GROUP =
    {paramtype = 0x00001020, datatype="RCX_TAG_INTERRUPT_GROUP_T",            desc="Interrupt Group"},
RCX_TAG_INTERRUPT =
    {paramtype = 0x00001023, datatype="RCX_TAG_INTERRUPT_T",                  desc="Interrupt"},
RCX_TAG_TIMER =
    {paramtype = 0x00001010, datatype="RCX_TAG_TIMER_T",                      desc="Hardware Timer"},
RCX_TAG_UART =
    {paramtype = 0x00001030, datatype="RCX_TAG_UART_T",                       desc="UART"},
RCX_TAG_LED =
    {paramtype = 0x00001040, datatype="RCX_TAG_LED_T",                        desc="LED"},
RCX_TAG_IOPIN =
    {paramtype = 0x00001041, datatype="RCX_TAG_IOPIN_T",                      desc="IO"},
RCX_TAG_SWAP_LNK_ACT_LED =
    {paramtype = 0x00001042, datatype="RCX_TAG_SWAP_LNK_ACT_LED_T",           desc="Swap Link/Activity LEDs"},
RCX_TAG_XC =
    {paramtype = 0x00001050, datatype="RCX_TAG_XC_T",                         desc="xC Unit"},
RCX_TAG_DPM_COMM_CHANNEL =
    {paramtype = 0x00001060, datatype="RCX_TAG_DPM_COMM_CHANNEL_DATA_T",      desc="DPM Communication Channels"},
RCX_TAG_DPM_SETTINGS =
    {paramtype = 0x00001061, datatype="RCX_TAG_DPM_SETTINGS_DATA_T",          desc="DPM Settings"},
RCX_TAG_DPM_BEHAVIOUR = 
	{paramtype = 0x00001062, datatype="RCX_TAG_DPM_BEHAVIOUR_DATA_T",         desc="DPM Behaviour"},
HIL_TAG_REMANENT_DATA_RESPONSIBLE =
	{paramtype = 0x00001070, datatype="HIL_TAG_REMANENT_DATA_RESPONSIBLE_DATA_T", desc="Remanent Data Responsibility"},
    
    
HIL_TAG_DDP_MODE_AFTER_STARTUP = 
	{paramtype = 0x00001081, datatype="HIL_TAG_DDP_INITIAL_STATE_DATA_T", desc="DDP Mode after firmware startup"},
HIL_TAG_PHY_ENABLE_TIMEOUT = 
	{paramtype = 0x00001090, datatype="HIL_TAG_PHY_ENABLE_TIMEOUT_DATA_T", desc="Phy enable timeout after firmware startup"},
}

RCX_TAG_HELP = {
    RCX_TAG_MEMSIZE                     = {file="misc_tags.htm"},
    RCX_TAG_MIN_PERSISTENT_STORAGE_SIZE = {file="misc_tags.htm"},
    RCX_TAG_MIN_OS_VERSION              = {file="misc_tags.htm"},
    RCX_TAG_MAX_OS_VERSION              = {file="misc_tags.htm"},
    RCX_TAG_MIN_CHIP_REV                = {file="misc_tags.htm"},
    RCX_TAG_MAX_CHIP_REV                = {file="misc_tags.htm"},

    RCX_TAG_TASK_GROUP                  = {file="RCX_TAG_TASK_GROUP_T.htm"},
    RCX_TAG_TASK                        = {file="RCX_TAG_TASK_T.htm"},
    RCX_TAG_INTERRUPT_GROUP             = {file="RCX_TAG_INTERRUPT_GROUP_T.htm"},
    RCX_TAG_INTERRUPT                   = {file="RCX_TAG_INTERRUPT_T.htm"},
    RCX_TAG_TIMER                       = {file="RCX_TAG_TIMER_T.htm"},
    RCX_TAG_UART                        = {file="RCX_TAG_UART_T.htm"},
    RCX_TAG_LED                         = {file="RCX_TAG_LED_T.htm"},
    RCX_TAG_SWAP_LNK_ACT_LED            = {file="RCX_TAG_SWAP_LNK_ACT_LED_T.htm"},
        
    RCX_TAG_IOPIN                       = {file="RCX_TAG_IOPIN_T.htm"},
    RCX_TAG_XC                          = {file="RCX_TAG_XC_T.htm"},
    RCX_TAG_DPM_COMM_CHANNEL            = {file="RCX_TAG_DPM_COMM_CHANNEL_DATA_T.htm"},
    RCX_TAG_DPM_SETTINGS                = {file="RCX_TAG_DPM_SETTINGS_DATA_T.htm"},
    RCX_TAG_DPM_BEHAVIOUR               = {file="RCX_TAG_DPM_BEHAVIOUR_DATA_T.htm"},

    HIL_TAG_REMANENT_DATA_RESPONSIBLE   = {file="HIL_TAG_REMANENT_DATA_RESPONSIBLE_DATA_T.htm"},
    
    HIL_TAG_DDP_MODE_AFTER_STARTUP      = {file="HIL_TAG_DDP_INITIAL_STATE_DATA_T.htm"},
    HIL_TAG_PHY_ENABLE_TIMEOUT          = {file="HIL_TAG_PHY_ENABLE_TIMEOUT_DATA_T.htm"},
        
}

taglist.addConstants(CONSTANTS)
taglist.addDataTypes(RCX_TAG_STRUCTS)
taglist.addTags(RCX_TAG_DEFS)
taglist.addTagHelpPages(RCX_TAG_HELP)

