<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="Pembelian.aspx.cs" Inherits="Karyawan_Pembelian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
    <div id="viewhasiltani" runat="server">
       <style type="text/css">
        .hiddencol
        {
        display:none;
        } 
    </style>

         <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:TextBox ID="txtCari" runat="server" type="text" CssClass="form-control border-input" placeholder="Cari Tani"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:LinkButton
                        ID="btnCari"
                        runat="server"
                        OnClick="btnCari_Click">
                        <i class="btn btn-primary ">Cari</i>
                    </asp:LinkButton>
                    <asp:LinkButton
                        ID="btnrefresh"
                        runat="server"
                        OnClick="btnrefresh_Click">
                        <i class="btn btn-warning ">Segarkan</i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>

        <asp:GridView
            ID="grdObat"
            runat="server"
            ShowHeaderWhenEmpty="true" 
            AutoGenerateColumns="false"
            CellSpacing="0"
            CssClass="table table-striped table-bordered table-hover"
            AllowPaging="true"
            AllowSorting="true"
            DataKeyNames="IDObat"
            OnSorting="grdObat_Sorting"
            OnRowCommand="grdObat_RowCommand"
            OnPageIndexChanging="grdObat_PageIndexChanging"
            PageSize="5">
             <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="namaObat" HeaderStyle-CssClass="table-bordered"   HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaObat" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="namaJenis" HeaderStyle-CssClass="table-bordered"  HeaderText="Jenis Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDJenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="JumlahObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Jumlah Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="JumlahObat" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Keterangan" HeaderStyle-CssClass="table-bordered"  HeaderText="Keterangan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Keterangan" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Nama_Lokasi" HeaderStyle-CssClass="table-bordered"  HeaderText="Lokasi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDLokasi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Satuan" HeaderStyle-CssClass="table-bordered"  HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Satuan" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Harga" HeaderStyle-CssClass="table-bordered"  HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Expired" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" HeaderText="Expired"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Expired" >
                        </asp:BoundField>

                        <asp:ImageField ControlStyle-Width="100" HeaderStyle-CssClass="table-bordered"  ControlStyle-Height = "100" DataImageUrlField ="Foto" HeaderText="Foto"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                       </asp:ImageField>

                        <asp:ButtonField CommandName="tambahPenjualan" HeaderText="Aksebilitas" ControlStyle-CssClass="fa fa-edit" Text="&nbsp;&nbsp;Beli Barang" />
                     
                        <asp:BoundField DataField="Nama" ItemStyle-CssClass="hiddencol" HeaderText="Creby" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="createDate" ItemStyle-CssClass="hiddencol" HeaderText="createDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="Nama" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedBy" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ModifiedDate" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="status" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="foto" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        
                         </Columns>
        </asp:GridView>

        <br />
        <br />
        <asp:GridView ID="grdDetailPenjualan" rendererIsEditable="true" 
            CssClass="table table-striped table-bordered table-hover" 
            runat="server"
             AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Colum0" HeaderText="No" />
                <asp:BoundField DataField="Colum1" HeaderText="ID" />
                <asp:BoundField DataField="Colum2" HeaderText="Jenis Obat" />
                <asp:BoundField DataField="Colum3" HeaderText="Nama Obat" />
                <asp:BoundField DataField="Colum4" HeaderText="Kualitas" />
                <asp:TemplateField HeaderText="Harga">
                    <ItemTemplate>
                        <asp:TextBox ID="txtHarga" runat="server" Text='<%# Bind("Colum5") %>' ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Jumlah Barang">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Colum6") %>' OnTextChanged="txtQty_TextChanged" AutoPostBack="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Total">
                    <ItemTemplate>
                        <asp:TextBox ID="txtSub" runat="server" Text='<%# Bind("Colum7") %>' ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Table border="0" Width="400px" Style="margin-left: 50px; margin-top: 5px; margin-bottom: 20px;" runat="server">
            <asp:TableRow>
                <asp:TableCell>Total Harga</asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtTotalHargaPemesanan" class="form-control" type="text" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <table>
            <asp:LinkButton ID="btnpenjualanobat" runat="server" Text="Beli Barang" CssClass="fa fa-pencil" OnClick="btnpenjualanobat_Click">
            </asp:LinkButton>

        </table>

    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

