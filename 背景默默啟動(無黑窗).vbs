Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
currentDir = fso.GetParentFolderName(WScript.ScriptFullName)

pythonExe = "C:\Users\csf90\OneDrive\Desktop\Anaconda\envs\bio_env\python.exe"

If fso.FileExists(pythonExe) Then
    cmd = """" & pythonExe & """ """ & currentDir & "\server.py"""
    ' 第二個參數 0 代表完全隱藏黑視窗背景執行
    WshShell.Run cmd, 0, False
Else
    ' 若無 Python 則直接靜默開啟網頁
    WshShell.Run """" & currentDir & "\index.html""", 1, False
End If
