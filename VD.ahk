;#SETUP START
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
ListLines Off
SetBatchLines -1
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#KeyHistory 0
#WinActivateForce

Process, Priority,, H

SetWinDelay -1
SetControlDelay -1

;include the library
#Include %A_LineFile%\..\_VD.ahk
VD.init()
VD.goToDesktopNum(2)
Run, chrome.exe
VD.goToDesktopNum(1)
;you should WinHide invisible programs that have a window.
WinHide, % "Malwarebytes Tray Application"
;#SETUP END

return

; i3 binding is alt+<num> to switch, create if not exists
; need to make this goToOrCreate()
!1::VD.goToDesktopNum(1)
!2::VD.goToDesktopNum(2)
!3::VD.goToDesktopNum(3)
!4::VD.goToDesktopNum(4)
!5::VD.goToDesktopNum(5)
!6::VD.goToDesktopNum(6)
!7::VD.goToDesktopNum(7)
!8::VD.goToDesktopNum(8)
!9::VD.goToDesktopNum(9)

; i3 binding should be shift+alt+<num> to throw window to workspace
!+1::VD.MoveWindowToDesktopNum("A",1)
!+2::VD.MoveWindowToDesktopNum("A",2)
!+3::VD.MoveWindowToDesktopNum("A",3)
!+4::VD.MoveWindowToDesktopNum("A",4)
!+5::VD.MoveWindowToDesktopNum("A",5)
!+6::VD.MoveWindowToDesktopNum("A",6)
!+7::VD.MoveWindowToDesktopNum("A",7)
!+8::VD.MoveWindowToDesktopNum("A",8)
!+9::VD.MoveWindowToDesktopNum("A",9)

; ctrl+win+<left|right> to prev/next the workspace
^#left::VD.goToRelativeDesktopNum(-1)
^#right::VD.goToRelativeDesktopNum(+1)

f1::
    msgbox % VD.getCurrentDesktopNum()
return

;Create/Remove Desktop
!NumpadAdd::VD.createDesktop()
#NumpadAdd::VD.createDesktop(false) ;don't go to newly created
; i3 binding is ctrl+w to close window, will clash with chrome if we do that
!NumpadSub::VD.removeDesktop(VD.getCurrentDesktopNum())
#!NumpadSub::VD.removeDesktop(VD.getCount()) ;removes 3rd desktop if there are 3 desktops

;Pin Window with alt+0
!0::
    VD.TogglePinWindow("A")
return

f3::Exitapp
