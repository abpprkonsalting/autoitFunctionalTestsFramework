#include-once

Func WaitForWindow($windowsName,$windowText,$timeOut)
    Local $hWnd = WinWait($windowsName,$windowText,$timeOut)
    If ($hWnd = 0) Then
        SetError(1) ; General error
    EndIf
    return $hWnd
EndFunc

Func WaitForControl($hWnd,$controlId,$timeOut = 0)
    Local $iCount = 0
    Local $hControl = ControlGetHandle($hWnd, "", $controlId)
    While ($hControl = 0)
        If ($iCount = $timeOut) Then
            SetError(1) ; General error
            return $hControl
        EndIf
        Sleep(1000)
        $iCount = $iCount + 1
        $hControl = ControlGetHandle($hWnd, "", $controlId)
    WEnd
    return $hControl
EndFunc

