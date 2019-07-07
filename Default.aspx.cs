using System;
using System.Text;
using DevExpress.Web;
using DevExpress.Web.ASPxRichEdit;
using DevExpress.Web.Bootstrap;
using DevExpress.Web.Data;
using DevExpress.XtraRichEdit;

namespace DXWebApplication1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void re_Init(object sender, EventArgs e)
        {
            BootstrapRichEdit richEdit = sender as BootstrapRichEdit;
            GridViewDataItemTemplateContainer container = richEdit.NamingContainer as GridViewDataItemTemplateContainer;
            if (container.Grid.IsNewRowEditing)
                return;
            string rtfText = container.Grid.GetRowValues(container.VisibleIndex, "RtfContent").ToString();
            string documentID = container.Grid.EditingRowVisibleIndex.ToString();
            richEdit.Open(documentID, DocumentFormat.Rtf, () =>
            {
                return Encoding.UTF8.GetBytes(rtfText);
            });
        }

        protected void gv_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["RtfContent"] = Encoding.UTF8.GetString(GetRichEditBinaryContent());
        }
        private byte[] GetRichEditBinaryContent()
        {
            BootstrapGridViewDataColumn columnRftContent = gv.Columns["RtfContent"] as BootstrapGridViewDataColumn;
            BootstrapRichEdit richEdit = gv.FindEditRowCellTemplateControl(columnRftContent, "re") as BootstrapRichEdit;
            return richEdit.SaveCopy(DocumentFormat.Rtf);
        }
    }
}