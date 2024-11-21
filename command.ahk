SendMode Input
SetWorkingDir %A_ScriptDir%

; 移動関連-小さな移動
; 変換 + j ⇒ ↓
sc079 & j:: Send, {Down}
; 変換 + k ⇒ ↑
sc079 & k:: Send, {Up}

; コマンド関連
; 無変換 + d ⇒ Windows + d （全ウィンドウ最小化）
sc07B & d:: Send, #d

; 入力時のショートカット
; 変換 + SPACE ⇒ Enter
sc079 & Space::Send, {Enter}
; 無変換 + SPACE ⇒ Backspace
sc07B & Space::Send, {Backspace}
; 無変換 + 変換⇒半角/全角 （IME切り替え）
sc07B & sc079:: Send, {vkF3sc029}


;カッコを入力したら閉じてスタート
#SingleInstance force  ; スクリプトの多重実行を防止
SetTitleMatchMode 2    ; ウィンドウタイトルの部分一致を許可

; "[" キーで対応する "]" を補完し、カーソルを間に移動
::[::
Send, []
Send, {Left}
return

; ダブルクォートキーで半角 " を補完し、カーソルを間に移動
::*""::
Send, {Raw}"
Send, {Raw}"
Send, {Left}
return

; シングルクォートキーで半角 ' を補完し、カーソルを間に移動
::*'::
Send, {Raw}'
Send, {Raw}'
Send, {Left}
return

; 開き括弧 "(" で閉じ括弧 ")" を補完し、カーソルを間に移動（全角強制半角）
::*（::  ; 全角 "（" をキャッチ
::*(::   ; 半角 "(" をキャッチ
Send, {Raw}(
Send, {Raw})
Send, {Left}
return

