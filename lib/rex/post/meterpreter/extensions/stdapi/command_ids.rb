# -*- coding: binary -*-

module Rex
module Post
module Meterpreter
module Extensions
module Stdapi

# ID for the extension (needs to be a multiple of 1000)
EXTENSION_ID_STDAPI = 1000

# Associated command ids
COMMAND_ID_STDAPI_FS_CHDIR                           = EXTENSION_ID_STDAPI + 1
COMMAND_ID_STDAPI_FS_CHMOD                           = EXTENSION_ID_STDAPI + 2
COMMAND_ID_STDAPI_FS_DELETE_DIR                      = EXTENSION_ID_STDAPI + 3
COMMAND_ID_STDAPI_FS_DELETE_FILE                     = EXTENSION_ID_STDAPI + 4
COMMAND_ID_STDAPI_FS_FILE_COPY                       = EXTENSION_ID_STDAPI + 5
COMMAND_ID_STDAPI_FS_FILE_EXPAND_PATH                = EXTENSION_ID_STDAPI + 6
COMMAND_ID_STDAPI_FS_FILE_MOVE                       = EXTENSION_ID_STDAPI + 7
COMMAND_ID_STDAPI_FS_GETWD                           = EXTENSION_ID_STDAPI + 8
COMMAND_ID_STDAPI_FS_LS                              = EXTENSION_ID_STDAPI + 9
COMMAND_ID_STDAPI_FS_MD5                             = EXTENSION_ID_STDAPI + 10
COMMAND_ID_STDAPI_FS_MKDIR                           = EXTENSION_ID_STDAPI + 11
COMMAND_ID_STDAPI_FS_MOUNT_SHOW                      = EXTENSION_ID_STDAPI + 12
COMMAND_ID_STDAPI_FS_SEARCH                          = EXTENSION_ID_STDAPI + 13
COMMAND_ID_STDAPI_FS_SEPARATOR                       = EXTENSION_ID_STDAPI + 14
COMMAND_ID_STDAPI_FS_SHA1                            = EXTENSION_ID_STDAPI + 15
COMMAND_ID_STDAPI_FS_STAT                            = EXTENSION_ID_STDAPI + 16
COMMAND_ID_STDAPI_NET_CONFIG_ADD_ROUTE               = EXTENSION_ID_STDAPI + 17
COMMAND_ID_STDAPI_NET_CONFIG_GET_ARP_TABLE           = EXTENSION_ID_STDAPI + 18
COMMAND_ID_STDAPI_NET_CONFIG_GET_INTERFACES          = EXTENSION_ID_STDAPI + 19
COMMAND_ID_STDAPI_NET_CONFIG_GET_NETSTAT             = EXTENSION_ID_STDAPI + 20
COMMAND_ID_STDAPI_NET_CONFIG_GET_PROXY               = EXTENSION_ID_STDAPI + 21
COMMAND_ID_STDAPI_NET_CONFIG_GET_ROUTES              = EXTENSION_ID_STDAPI + 22
COMMAND_ID_STDAPI_NET_CONFIG_REMOVE_ROUTE            = EXTENSION_ID_STDAPI + 23
COMMAND_ID_STDAPI_NET_RESOLVE_HOST                   = EXTENSION_ID_STDAPI + 24
COMMAND_ID_STDAPI_NET_RESOLVE_HOSTS                  = EXTENSION_ID_STDAPI + 25
COMMAND_ID_STDAPI_NET_SOCKET_TCP_SHUTDOWN            = EXTENSION_ID_STDAPI + 26
COMMAND_ID_STDAPI_NET_TCP_CHANNEL_OPEN               = EXTENSION_ID_STDAPI + 27
COMMAND_ID_STDAPI_RAILGUN_API                        = EXTENSION_ID_STDAPI + 28
COMMAND_ID_STDAPI_RAILGUN_API_MULTI                  = EXTENSION_ID_STDAPI + 29
COMMAND_ID_STDAPI_RAILGUN_MEMREAD                    = EXTENSION_ID_STDAPI + 30
COMMAND_ID_STDAPI_RAILGUN_MEMWRITE                   = EXTENSION_ID_STDAPI + 31
COMMAND_ID_STDAPI_REGISTRY_CHECK_KEY_EXISTS          = EXTENSION_ID_STDAPI + 32
COMMAND_ID_STDAPI_REGISTRY_CLOSE_KEY                 = EXTENSION_ID_STDAPI + 33
COMMAND_ID_STDAPI_REGISTRY_CREATE_KEY                = EXTENSION_ID_STDAPI + 34
COMMAND_ID_STDAPI_REGISTRY_DELETE_KEY                = EXTENSION_ID_STDAPI + 35
COMMAND_ID_STDAPI_REGISTRY_DELETE_VALUE              = EXTENSION_ID_STDAPI + 36
COMMAND_ID_STDAPI_REGISTRY_ENUM_KEY                  = EXTENSION_ID_STDAPI + 37
COMMAND_ID_STDAPI_REGISTRY_ENUM_KEY_DIRECT           = EXTENSION_ID_STDAPI + 38
COMMAND_ID_STDAPI_REGISTRY_ENUM_VALUE                = EXTENSION_ID_STDAPI + 39
COMMAND_ID_STDAPI_REGISTRY_ENUM_VALUE_DIRECT         = EXTENSION_ID_STDAPI + 40
COMMAND_ID_STDAPI_REGISTRY_LOAD_KEY                  = EXTENSION_ID_STDAPI + 41
COMMAND_ID_STDAPI_REGISTRY_OPEN_KEY                  = EXTENSION_ID_STDAPI + 42
COMMAND_ID_STDAPI_REGISTRY_OPEN_REMOTE_KEY           = EXTENSION_ID_STDAPI + 43
COMMAND_ID_STDAPI_REGISTRY_QUERY_CLASS               = EXTENSION_ID_STDAPI + 44
COMMAND_ID_STDAPI_REGISTRY_QUERY_VALUE               = EXTENSION_ID_STDAPI + 45
COMMAND_ID_STDAPI_REGISTRY_QUERY_VALUE_DIRECT        = EXTENSION_ID_STDAPI + 46
COMMAND_ID_STDAPI_REGISTRY_SET_VALUE                 = EXTENSION_ID_STDAPI + 47
COMMAND_ID_STDAPI_REGISTRY_SET_VALUE_DIRECT          = EXTENSION_ID_STDAPI + 48
COMMAND_ID_STDAPI_REGISTRY_UNLOAD_KEY                = EXTENSION_ID_STDAPI + 49
COMMAND_ID_STDAPI_SYS_CONFIG_DRIVER_LIST             = EXTENSION_ID_STDAPI + 50
COMMAND_ID_STDAPI_SYS_CONFIG_DROP_TOKEN              = EXTENSION_ID_STDAPI + 51
COMMAND_ID_STDAPI_SYS_CONFIG_GETENV                  = EXTENSION_ID_STDAPI + 52
COMMAND_ID_STDAPI_SYS_CONFIG_GETPRIVS                = EXTENSION_ID_STDAPI + 53
COMMAND_ID_STDAPI_SYS_CONFIG_GETSID                  = EXTENSION_ID_STDAPI + 54
COMMAND_ID_STDAPI_SYS_CONFIG_GETUID                  = EXTENSION_ID_STDAPI + 55
COMMAND_ID_STDAPI_SYS_CONFIG_LOCALTIME               = EXTENSION_ID_STDAPI + 56
COMMAND_ID_STDAPI_SYS_CONFIG_REV2SELF                = EXTENSION_ID_STDAPI + 57
COMMAND_ID_STDAPI_SYS_CONFIG_STEAL_TOKEN             = EXTENSION_ID_STDAPI + 58
COMMAND_ID_STDAPI_SYS_CONFIG_SYSINFO                 = EXTENSION_ID_STDAPI + 59
COMMAND_ID_STDAPI_SYS_EVENTLOG_CLEAR                 = EXTENSION_ID_STDAPI + 60
COMMAND_ID_STDAPI_SYS_EVENTLOG_CLOSE                 = EXTENSION_ID_STDAPI + 61
COMMAND_ID_STDAPI_SYS_EVENTLOG_NUMRECORDS            = EXTENSION_ID_STDAPI + 62
COMMAND_ID_STDAPI_SYS_EVENTLOG_OLDEST                = EXTENSION_ID_STDAPI + 63
COMMAND_ID_STDAPI_SYS_EVENTLOG_OPEN                  = EXTENSION_ID_STDAPI + 64
COMMAND_ID_STDAPI_SYS_EVENTLOG_READ                  = EXTENSION_ID_STDAPI + 65
COMMAND_ID_STDAPI_SYS_POWER_EXITWINDOWS              = EXTENSION_ID_STDAPI + 66
COMMAND_ID_STDAPI_SYS_PROCESS_ATTACH                 = EXTENSION_ID_STDAPI + 67
COMMAND_ID_STDAPI_SYS_PROCESS_CLOSE                  = EXTENSION_ID_STDAPI + 68
COMMAND_ID_STDAPI_SYS_PROCESS_EXECUTE                = EXTENSION_ID_STDAPI + 69
COMMAND_ID_STDAPI_SYS_PROCESS_GET_INFO               = EXTENSION_ID_STDAPI + 70
COMMAND_ID_STDAPI_SYS_PROCESS_GET_PROCESSES          = EXTENSION_ID_STDAPI + 71
COMMAND_ID_STDAPI_SYS_PROCESS_GETPID                 = EXTENSION_ID_STDAPI + 72
COMMAND_ID_STDAPI_SYS_PROCESS_IMAGE_GET_IMAGES       = EXTENSION_ID_STDAPI + 73
COMMAND_ID_STDAPI_SYS_PROCESS_IMAGE_GET_PROC_ADDRESS = EXTENSION_ID_STDAPI + 74
COMMAND_ID_STDAPI_SYS_PROCESS_IMAGE_LOAD             = EXTENSION_ID_STDAPI + 75
COMMAND_ID_STDAPI_SYS_PROCESS_IMAGE_UNLOAD           = EXTENSION_ID_STDAPI + 76
COMMAND_ID_STDAPI_SYS_PROCESS_KILL                   = EXTENSION_ID_STDAPI + 77
COMMAND_ID_STDAPI_SYS_PROCESS_MEMORY_ALLOCATE        = EXTENSION_ID_STDAPI + 78
COMMAND_ID_STDAPI_SYS_PROCESS_MEMORY_FREE            = EXTENSION_ID_STDAPI + 79
COMMAND_ID_STDAPI_SYS_PROCESS_MEMORY_LOCK            = EXTENSION_ID_STDAPI + 80
COMMAND_ID_STDAPI_SYS_PROCESS_MEMORY_PROTECT         = EXTENSION_ID_STDAPI + 81
COMMAND_ID_STDAPI_SYS_PROCESS_MEMORY_QUERY           = EXTENSION_ID_STDAPI + 82
COMMAND_ID_STDAPI_SYS_PROCESS_MEMORY_READ            = EXTENSION_ID_STDAPI + 83
COMMAND_ID_STDAPI_SYS_PROCESS_MEMORY_UNLOCK          = EXTENSION_ID_STDAPI + 84
COMMAND_ID_STDAPI_SYS_PROCESS_MEMORY_WRITE           = EXTENSION_ID_STDAPI + 85
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_CLOSE           = EXTENSION_ID_STDAPI + 86
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_CREATE          = EXTENSION_ID_STDAPI + 87
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_GET_THREADS     = EXTENSION_ID_STDAPI + 88
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_OPEN            = EXTENSION_ID_STDAPI + 89
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_QUERY_REGS      = EXTENSION_ID_STDAPI + 90
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_RESUME          = EXTENSION_ID_STDAPI + 91
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_SET_REGS        = EXTENSION_ID_STDAPI + 92
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_SUSPEND         = EXTENSION_ID_STDAPI + 93
COMMAND_ID_STDAPI_SYS_PROCESS_THREAD_TERMINATE       = EXTENSION_ID_STDAPI + 94
COMMAND_ID_STDAPI_SYS_PROCESS_WAIT                   = EXTENSION_ID_STDAPI + 95
COMMAND_ID_STDAPI_UI_DESKTOP_ENUM                    = EXTENSION_ID_STDAPI + 96
COMMAND_ID_STDAPI_UI_DESKTOP_GET                     = EXTENSION_ID_STDAPI + 97
COMMAND_ID_STDAPI_UI_DESKTOP_SCREENSHOT              = EXTENSION_ID_STDAPI + 98
COMMAND_ID_STDAPI_UI_DESKTOP_SET                     = EXTENSION_ID_STDAPI + 99
COMMAND_ID_STDAPI_UI_ENABLE_KEYBOARD                 = EXTENSION_ID_STDAPI + 100
COMMAND_ID_STDAPI_UI_ENABLE_MOUSE                    = EXTENSION_ID_STDAPI + 101
COMMAND_ID_STDAPI_UI_GET_IDLE_TIME                   = EXTENSION_ID_STDAPI + 102
COMMAND_ID_STDAPI_UI_GET_KEYS_UTF8                   = EXTENSION_ID_STDAPI + 103
COMMAND_ID_STDAPI_UI_SEND_KEYEVENT                   = EXTENSION_ID_STDAPI + 104
COMMAND_ID_STDAPI_UI_SEND_KEYS                       = EXTENSION_ID_STDAPI + 105
COMMAND_ID_STDAPI_UI_SEND_MOUSE                      = EXTENSION_ID_STDAPI + 106
COMMAND_ID_STDAPI_UI_START_KEYSCAN                   = EXTENSION_ID_STDAPI + 107
COMMAND_ID_STDAPI_UI_STOP_KEYSCAN                    = EXTENSION_ID_STDAPI + 108
COMMAND_ID_STDAPI_UI_UNLOCK_DESKTOP                  = EXTENSION_ID_STDAPI + 109
COMMAND_ID_STDAPI_WEBCAM_AUDIO_RECORD                = EXTENSION_ID_STDAPI + 110
COMMAND_ID_STDAPI_WEBCAM_GET_FRAME                   = EXTENSION_ID_STDAPI + 111
COMMAND_ID_STDAPI_WEBCAM_LIST                        = EXTENSION_ID_STDAPI + 112
COMMAND_ID_STDAPI_WEBCAM_START                       = EXTENSION_ID_STDAPI + 113
COMMAND_ID_STDAPI_WEBCAM_STOP                        = EXTENSION_ID_STDAPI + 114
COMMAND_ID_STDAPI_AUDIO_MIC_START                    = EXTENSION_ID_STDAPI + 115
COMMAND_ID_STDAPI_AUDIO_MIC_STOP                     = EXTENSION_ID_STDAPI + 116
COMMAND_ID_STDAPI_AUDIO_MIC_LIST                     = EXTENSION_ID_STDAPI + 117

end; end; end; end; end

