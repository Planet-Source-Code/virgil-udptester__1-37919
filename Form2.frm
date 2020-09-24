VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   0  'None
   Caption         =   "UDPTest"
   ClientHeight    =   2055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4035
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   2055
   ScaleWidth      =   4035
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command3 
      Caption         =   "Reset"
      Height          =   375
      Left            =   2070
      TabIndex        =   5
      Top             =   1125
      Width           =   825
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Test remote Computer"
      Height          =   375
      Left            =   90
      TabIndex        =   3
      Top             =   1125
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Set"
      Height          =   375
      Left            =   2970
      TabIndex        =   2
      Top             =   1125
      Width           =   825
   End
   Begin VB.TextBox Text1 
      Height          =   330
      Left            =   2160
      TabIndex        =   1
      Text            =   "12121"
      Top             =   630
      Width           =   690
   End
   Begin VB.Label Label2 
      Height          =   285
      Left            =   90
      TabIndex        =   4
      Top             =   135
      Width           =   1860
   End
   Begin VB.Label Label1 
      Caption         =   "Set port to listen on. (default 12121)"
      Height          =   375
      Left            =   90
      TabIndex        =   0
      Top             =   540
      Width           =   1950
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form1.ws.Close
Form1.ws.LocalPort = Text1.Text
Form1.ws.Bind
Label2.Caption = "Listening on port " & Form1.ws.LocalPort
End Sub

Private Sub Command2_Click()
Me.Hide
Form1.Visible = True
End Sub

Private Sub Command3_Click()
Label2.Caption = "Listening on port " & Form1.ws.LocalPort
End Sub

Private Sub Form_Load()
Load Form1
Form1.ws.LocalPort = "12121"
Label2.Caption = "Listening on port " & Form1.ws.LocalPort
Form1.ws.Bind
End Sub

Private Sub Form_Terminate()
ws.Close
Unload Form1
Unload Me
End
End Sub
