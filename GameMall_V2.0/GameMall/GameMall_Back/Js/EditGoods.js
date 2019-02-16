$(function () {
    $("#next").click(function () {
        var goods = {
            GoodsName: $("#GoodsName").val(),
            GoodsId: $("#GoodsId").val(),
            Type: $("#Type").val(),
            Detail: $("#Detail").text(),
            Configuration: $("#Configuration").val(),
            InstallWay: $("#InstallWay").val(),
        }
        var goodsId = parseInt($("#GoodsId").val());
        $.ajax({
            url: "/Goods/EditGoods",
            type: "POST",
            dataType: "html",
            data: goods,
            success: function (data) {
                window.location.href = "/Goods/AddScreenshot?GoodsId=" + goodsId;
                //window.location = "AddScreenshot";
                //$("#goodsList").html(data);
                //alert(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});

$(function () {
    $(".type .edit_version button").click(function () {
        var versionId = $(this).attr("id");
        var version = {
            VersionId: versionId,
            GoodsId: $("#GoodsId").val(),
        }        
        $.ajax({
            url: "/Goods/AddVersion",
            type: "POST",
            dataType: "html",
            data: version,
            success: function (data) {
                $("#myModal").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//删除版本
$(function () {
    $(".type .delete_version button").click(function () {
        var versionId = $(this).attr("id");
        var version = {
            VersionId: versionId,
            GoodsId: $("#GoodsId").val(),
        }
        $.ajax({
            url: "/Goods/DeleteVersion",
            dataType: "html",
            data: version,
            success: function (data) {
                $("#tip_delete_version").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//添加版本
$(function () {
    $("#add_version_bt").click(function () {
        var version = {
            GoodsId: $("#GoodsId").val(),
        }

        $.ajax({
            url: "/Goods/AddVersion",
            type: "POST",
            dataType: "html",
            data: version,
            success: function (data) {
                $("#myModal").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});