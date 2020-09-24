VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BorderStyle     =   0  'None
   Caption         =   "UDPTest"
   ClientHeight    =   2070
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3450
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   2070
   ScaleWidth      =   3450
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer2 
      Interval        =   100
      Left            =   1890
      Top             =   1665
   End
   Begin VB.TextBox Text2 
      Height          =   330
      Left            =   45
      TabIndex        =   0
      Top             =   720
      Width           =   1905
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   1395
      Top             =   1665
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Reset"
      Height          =   330
      Left            =   45
      TabIndex        =   8
      Top             =   1665
      Width           =   870
   End
   Begin VB.PictureBox Picture1 
      Height          =   330
      Left            =   0
      ScaleHeight     =   270
      ScaleWidth      =   2115
      TabIndex        =   5
      Top             =   1125
      Width           =   2175
      Begin VB.Label Label4 
         Height          =   285
         Left            =   585
         TabIndex        =   7
         Top             =   0
         Width           =   1185
      End
      Begin VB.Label Label3 
         Caption         =   "Status"
         Height          =   285
         Left            =   0
         TabIndex        =   6
         Top             =   0
         Width           =   555
      End
   End
   Begin VB.TextBox Text1 
      Height          =   330
      Left            =   2295
      TabIndex        =   1
      Text            =   "12121"
      Top             =   720
      Width           =   600
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test"
      Default         =   -1  'True
      Height          =   330
      Left            =   2340
      TabIndex        =   3
      Top             =   1665
      Width           =   1005
   End
   Begin MSWinsockLib.Winsock ws 
      Left            =   90
      Top             =   2790
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.Label Label5 
      Height          =   330
      Left            =   2475
      TabIndex        =   9
      Top             =   1125
      Width           =   555
   End
   Begin VB.Label Label2 
      Caption         =   "Port to test (default 12121)"
      Height          =   465
      Left            =   2205
      TabIndex        =   4
      Top             =   135
      Width           =   1140
   End
   Begin VB.Label Label1 
      Caption         =   "Address to test (must be running UDP test also)."
      Height          =   510
      Left            =   45
      TabIndex        =   2
      Top             =   135
      Width           =   1815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()


On Error Resume Next
Label4.Caption = ""
ws.RemoteHost = Text2.Text
ws.RemotePort = Text1.Text
ws.Bind
ws.SendData "*!*"
Timer1.Enabled = True
End Sub

Private Sub Command2_Click()
Me.Hide
Form2.Show
Label4.Caption = ""
Form2.Label2.Caption = "Listening on port " & Form1.ws.LocalPort
End Sub

Private Sub Form_Load()
Timer1.Enabled = False
Me.Left = 50
Me.Top = 0
End Sub

Private Sub Form_Resize()
Me.Left = 50
Me.Top = 0
End Sub

Private Sub Form_Terminate()
ws.Close
Unload Form2
Unload Me
End
End Sub

Private Sub Timer1_Timer()
If Label4.Caption = "SUCCESS" Then
Timer1.Enabled = False
Else
Label4.Caption = "FAIL"
ws.Close
End If
Timer1.Enabled = False

End Sub

Private Sub Timer2_Timer()
Label5.Caption = ws.State
End Sub

Private Sub ws_DataArrival(ByVal bytesTotal As Long)
Dim Data As String
On Error Resume Next
ws.GetData Data

If InStr(Data, "*!*") Then

Form2.Label2.Caption = "Data received"
Call sendit(ws.RemoteHostIP)
End If
If InStr(Data, "SUCCESS") Then
Label4.Caption = "SUCCESS"
End If

End Sub


Private Sub ws_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
MsgBox Error
End Sub

Private Sub sendit(remote As String)

ws.RemoteHost = remote

ws.SendData "SUCCESS"
End Sub

