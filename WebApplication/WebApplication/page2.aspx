<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page2.aspx.cs" Inherits="WebApplication.page2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $.ajax({
                type: "POST",
                url: "/WebService.asmx/GetModels",
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    var ddlmodel = document.getElementById('ddlmodel');
                    var objdata = $.parseJSON(data.d);
                    var i;
                    for (i = 0; i < objdata.Table.length - 1; i++) {
                        ddlmodel.options[ddlmodel.options.length] = new Option(objdata.Table[i][1], objdata.Table[i][0]);
                    }
                }, error: function (data) {
                    alert(data);
                }
            });

            $('#ddlmodel').live('change', function () {
                var supplier_value = $(this).val();
                if (supplier_value != 0) {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetSFX",
                        contentType: "application/json; charset=utf-8",
                        dataType: 'json',
                        success: function (data) {
                            var objdata = $.parseJSON(data.d);
                            var i;
                            $("#ddlCarSFX").empty();
                            $("#ddlCarSFX").append('<option value=\'0\'>Select</option>');
                            for (i = 0; i < objdata.Table.length - 1; i++) {
                                $("#ddlCarSFX").append('<option value=\'' + objdata.Table[i][0] + '\'>' + objdata.Table[i][1] + '</option>');
                            }
                            $("#div_Car_SFX").show();
                        }, error: function (data) {
                            alert(data);
                        }
                    });
                } else {
                    $("#div_Car_SFX").hide();
                    $("#div_Car_Variant").hide();
                    $("#div_Car_Color").hide();
                }
            });

            $('#ddlCarSFX').live('change', function () {
                var supplier_value = $(this).val();
                if (supplier_value != 0) {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetVariant",
                        contentType: "application/json; charset=utf-8",
                        dataType: 'json',
                        success: function (data) {
                            var objdata = $.parseJSON(data.d);
                            var i;
                            $("#ddlCarVariant").empty();
                            $("#ddlCarVariant").append('<option value=\'0\'>Select</option>');
                            for (i = 0; i < objdata.Table.length - 1; i++) {
                                $("#ddlCarVariant").append('<option value=\'' + objdata.Table[i][0] + '\'>' + objdata.Table[i][1] + '</option>');
                            }
                            $("#div_Car_Variant").show();
                        }, error: function (data) {
                            alert(data);
                        }
                    });
                } else {
                    $("#div_Car_Variant").hide();
                    $("#div_Car_Color").hide();
                }
            });

            $('#ddlCarVariant').live('change', function () {
                var supplier_value = $(this).val();
                if (supplier_value != 0) {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetColor",
                        contentType: "application/json; charset=utf-8",
                        dataType: 'json',
                        success: function (data) {
                            var objdata = $.parseJSON(data.d);
                            var i;
                            $("#ddlCarColor").empty();
                            $("#ddlCarColor").append('<option value=\'0\'>Select</option>');
                            for (i = 0; i < objdata.Table.length - 1; i++) {
                                $("#ddlCarColor").append('<option value=\'' + objdata.Table[i][0] + '\'>' + objdata.Table[i][1] + '</option>');
                            }
                            $("#div_Car_Color").show();
                        }, error: function (data) {
                            alert(data);
                        }
                    });
                } else {
                    $("#div_Car_Color").hide();
                }
            });



            function getParameterByName(name) {
                var url = window.location.toLocaleString();
                name = name.replace(/[\[\]]/g, '\\$&');
                var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                    results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, ' '));
            }

            $('#ddlCarColor').live('change', function () {
                var color_id = $(this).val();
                var supplier_id = getParameterByName("supplier_id");
                var whole_seller_id = getParameterByName("whole_seller_id");
                var steering_type_id = getParameterByName("steering_type_id");
                var mode_id = $("#ddlmodel").val();
                var sfx_id = $("#ddlCarSFX").val();
                var variant_id = $("#ddlCarVariant").val();

                if (color_id != 0) {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetQuantitybyMonth",
                        data: JSON.stringify({
                            supplier_id: supplier_id, whole_seller_id: whole_seller_id, steering_type_id: steering_type_id,
                            mode_id: mode_id, sfx_id: sfx_id, variant_id: variant_id, color_id: color_id
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: 'json',
                        success: function (data) {
                            var objdata = $.parseJSON(data.d);
                            var i;
                            var content = "<table>"
                            var headertr = '<tr>'
                            var body = '<tr>'

                            for (i = 0; i < objdata.Table.length - 1; i++) {
                                headertr += '<th>' + objdata.Table[i][1] + ' </th>';
                                body += '<td><input class=\'inputclass\' min=\'0\' type=\'number\' value=\'' + objdata.Table[i][0] + '\' id=\'' + objdata.Table[i][2] + '\' /></td>';
                            }
                            content += headertr + body + "</table>"
                            $('#result_table').html(content);
                        }, error: function (data) {
                            alert(data);
                        }
                    });
                }
            });

        });

        $('.inputclass').live('change', function () {
            var qty_value = $(this).val();
            var input_id = this.id;
            if (input_id > 0) {
                $.ajax({
                    type: "POST",
                    url: "/WebService.asmx/UpdateQuantity",
                    data: JSON.stringify({id: input_id, qty: qty_value}),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    async: true,
                    success: function (data) {
                
                    }, error: function (data) {
                        alert(data);
                    }
                });
            }

        });

        


    </script>

    <style>
        #result_table { font-family: Arial, Helvetica, sans-serif; border-collapse: collapse; width: 100%; }
            #result_table td, #result_table th { border: 1px solid #ddd; padding: 8px; }
            #result_table tr:nth-child(even) { background-color: #f2f2f2; }
            #result_table tr:hover { background-color: #ddd; }
            #result_table th { padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #404040; color: white; }
        .section { display: block;; padding: 16px; font-size: 16px; border: none; cursor: pointer; }
        label { font-family: sans-serif; font-size: 1rem; padding-right: 10px; }
        select { font-size: 0.9rem; padding: 2px 5px; }
        .button { cursor: pointer; background-color: #e7e7e7; border: none; color: black; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; }
        .inputclass { width: 55px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="section">
            <lable>Car Model</lable>
            <select id="ddlmodel">
                <option value="0">Select</option>
            </select>
        </div>
        <div style="display: none;" id="div_Car_SFX" class="section">
            <lable>Car SFX</lable>
            <select id="ddlCarSFX">
            </select>
        </div>

        <div style="display: none;" id="div_Car_Variant" class="section">
            <lable>Car Variant</lable>
            <select id="ddlCarVariant">
            </select>
        </div>

        <div style="display: none;" id="div_Car_Color" class="section">
            <lable>Color</lable>
            <select id="ddlCarColor">
            </select>
        </div>

        <div id="result_table"></div>


    </form>
</body>
</html>
