Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace DxExample
    Partial Public Class [Default]
        Inherits System.Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

        End Sub

        Protected Sub Grid_ToolbarItemClick(ByVal source As Object, ByVal e As DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs)
            Select Case e.Item.Name
                Case "ExportToPDF"
                    Exporter.WritePdfToResponse()
                Case "ExportToXLS"
                    Exporter.WriteXlsToResponse()
                Case "ExportToXLSX"
                    Exporter.WriteXlsxToResponse()
                Case Else
            End Select
        End Sub
    End Class
End Namespace