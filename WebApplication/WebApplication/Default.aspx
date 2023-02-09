<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milele</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">


        jQuery(document).ready(function ($) {
            $.ajax({
                type: "POST",
                url: "/WebService.asmx/GetSupplier",
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    var ddlsupplier = document.getElementById('ddlsupplier');
                    var objdata = $.parseJSON(data.d);
                    var i;
                    for (i = 0; i < objdata.Table.length - 1; i++) {
                        ddlsupplier.options[ddlsupplier.options.length] = new Option(objdata.Table[i][1], objdata.Table[i][0]);
                    }
                }, error: function (data) {
                    alert(data);
                }
            });
        });

        $('#ddlsupplier').live('change', function () {
            var supplier_value = $(this).val();
            if (supplier_value != 0) {
                $.ajax({
                    type: "POST",
                    url: "/WebService.asmx/GetWholeSeller",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data) {
                        var objdata = $.parseJSON(data.d);
                        var i;
                        $("#ddlwholeseller").empty();
                        $("#ddlwholeseller").append('<option value=\'0\'>Select</option>');
                        for (i = 0; i < objdata.Table.length - 1; i++) {
                            $("#ddlwholeseller").append('<option value=\'' + objdata.Table[i][0] + '\'>' + objdata.Table[i][1] + '</option>');
                        }
                        $("#div_wholeseller").show();
                    }, error: function (data) {
                        alert(data);
                    }
                });
            } else {
                $("#div_wholeseller").hide();
                $("#div_steeringtype").hide();
                $("#btnsubmit").hide();
            }
        });

        $('#ddlwholeseller').live('change', function () {
            var wholeseller_value = $(this).val();
            if (wholeseller_value != 0) {
                $.ajax({
                    type: "POST",
                    url: "/WebService.asmx/GetSteeringType",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data) {
                        var objdata = $.parseJSON(data.d);
                        var i;
                        $("#ddlsteeringtype").empty();
                        $("#ddlsteeringtype").append('<option>Select</option>');
                        for (i = 0; i < objdata.Table.length - 1; i++) {
                            $("#ddlsteeringtype").append('<option value=\'' + objdata.Table[i][0] + '\'>' + objdata.Table[i][1] + '</option>');
                        }
                        $("#div_steeringtype").show();

                    }, error: function (data) {
                        alert(data);
                    }
                });
            } else {
                $("#div_steeringtype").hide();
                $("#btnsubmit").hide();
            }

        });

        $('#ddlsteeringtype').live('change', function () {
            var steeringtype_value = $(this).val();
            if (steeringtype_value != 0) {
                $("#btnsubmit").show();
            }
        });

        function redirectnewpage() {
            var supplier_id = $("#ddlsupplier").val();
            var whole_seller_id = $("#ddlwholeseller").val();
            var steering_type_id = $("#ddlsteeringtype").val();

            window.location.assign('page2.aspx?supplier_id=' + supplier_id + '&whole_seller_id=' + whole_seller_id + '&steering_type_id=' + steering_type_id);
        }

    </script>
    <style>
        .section { display: block;; padding: 16px; font-size: 16px; border: none; cursor: pointer; }
        label { font-family: sans-serif; font-size: 1rem; padding-right: 10px; }
        select { font-size: 0.9rem; padding: 2px 5px; }
        .button { cursor: pointer; background-color: #e7e7e7; border: none;  color: black; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="section">
            <lable>Supplier</lable>
            <select id="ddlsupplier">
                <option value="0">Select</option>
            </select>
        </div>
        <div style="display: none;" id="div_wholeseller" class="section">
            <lable>Whole Seller</lable>
            <select id="ddlwholeseller">
            </select>
        </div>
        <div style="display: none;" id="div_steeringtype" class="section">
            <lable>Steering type</lable>
            <select id="ddlsteeringtype">
            </select>
        </div>

        <input type="button" style="display: none;" id="btnsubmit" value="Submit" onclick="redirectnewpage();" class="button" />
    </form>
</body>
</html>
