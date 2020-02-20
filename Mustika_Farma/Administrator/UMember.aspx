<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="UMember.aspx.cs" Inherits="Administrator_UMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    User Member
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
    User Member
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
           <!--SECTION VIEW-->
     <section class="content" id="secView" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table User</h3>
                  <br />
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <asp:TextBox id="txtSearch" CssClass="form-control float-right" runat="server"/>
                    <div class="input-group-append">
                      <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click"><i class="fas fa-search"></i></asp:LinkButton>
                    </div>
                  </div>
                </div>
              </div>

  <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridUser" runat="server" CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDUser" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridUser_PageIndexChanging"
                    OnSorting="gridUser_Sorting" OnSelectedIndexChanged="gridUser_SelectedIndexChanged"
                 
                    >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign ="Center" >
                           <ItemStyle Font-Size="Small" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate >
                                <%# Container.DataItemIndex +1 %> 
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="Nama" HeaderStyle-CssClass="table-bordered" HeaderText="Nama"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Nama" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Alamat" HeaderStyle-CssClass="table-bordered" HeaderText="Alamat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Alamat" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="NoTelp" HeaderStyle-CssClass="table-bordered" HeaderText="No Telpon"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NoTelp" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="TglLahir" HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal Lahir"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="TglLahir" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Email" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="20%" CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="Username" ItemStyle-CssClass="hiddencol" HeaderText="Username" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />
                        <asp:BoundField DataField="Password" ItemStyle-CssClass="hiddencol" HeaderText="Password" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="password" />
                        <asp:BoundField DataField="nama" ItemStyle-CssClass="hiddencol" HeaderText="Creby" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        
                         <asp:BoundField DataField="Deskripsi" HeaderStyle-CssClass="table-bordered" HeaderText="Role"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDRole" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%" CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>

                     
                    
                    </Columns>
                </asp:GridView>
                </div>            
              </div>
            </div>
          </div>
         </div>
        </section>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

