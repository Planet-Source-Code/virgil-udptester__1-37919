VERSION 5.00
Begin VB.MDIForm MDIForm1 
   AutoShowChildren=   0   'False
   BackColor       =   &H8000000F&
   Caption         =   "UDPTest"
   ClientHeight    =   2190
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4515
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   2  'CenterScreen
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub MDIForm_Load()
Form2.Show
Form1.Visible = False
End Sub

Private Sub MDIForm_Terminate()
Form1.ws.Close
Unload Form1
Unload Form2
End

End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
Form1.ws.Close
Unload Form1
Unload Form2
End
End Sub
