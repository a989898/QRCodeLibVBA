Attribute VB_Name = "Factory"
Option Explicit

'------------------------------------------------------------------------------
' (�T�v)
'  Symbols�N���X�̃C���X�^���X�𐶐����܂��B
'
' (�p�����[�^)
'  ecLevel               : ���������x��
'  maxVer                : �^�Ԃ̏��
'  allowStructuredAppend : �����V���{���ւ̕�����������ɂ� True ���w�肵�܂��B
'  byteModeCharsetName   : �o�C�g���[�h�̕����R�[�h���w�肵�܂��B
'------------------------------------------------------------------------------
Public Function CreateSymbols( _
    Optional ByVal ecLevel As ErrorCorrectionLevel = ErrorCorrectionLevel.M, _
    Optional ByVal maxVer As Long = MAX_VERSION, _
    Optional ByVal allowStructuredAppend As Boolean = False, _
    Optional ByVal byteModeCharsetName As String = "Shift_JIS") As Symbols

    Select Case ecLevel
        Case ErrorCorrectionLevel.L To ErrorCorrectionLevel.H
            ' NOP
        Case Else
            Call Err.Raise(5)
    End Select

    If Not (1 <= maxVer And maxVer <= 40) Then Call Err.Raise(5)

    Dim sbls As New Symbols
    Call sbls.Init(ecLevel, maxVer, allowStructuredAppend, byteModeCharsetName)
    
    Set CreateSymbols = sbls
End Function
