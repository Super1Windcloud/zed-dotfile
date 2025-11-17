#Persistent
SetTitleMatchMode, 2
; 假设 PowerShell 7 窗口标题为“pwsh 7”
^!q::  ; 使用快捷键 Ctrl+Alt+Q 来隐藏/显示
    IfWinExist, ahk_exe pwsh.exe
    {
        ; 检查 PowerShell 7 窗口是否已经被隐藏
        WinGet, state, MinMax, ahk_exe pwsh.exe
        if (state = -1)  ; 如果窗口被最小化
        {
            WinRestore  ; 恢复窗口
            WinActivate  ; 激活窗口
            TrayTip, PowerShell 7, PowerShell 7 已恢复, 5, 17
        }
        else
        {
            WinHide  ; 隐藏窗口
            TrayTip, PowerShell 7, PowerShell 7 已隐藏, 5, 17
        }
    }
return
