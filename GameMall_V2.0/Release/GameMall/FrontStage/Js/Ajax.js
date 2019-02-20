//修改昵称、密码
$(function () {
    $("#modify-head-name").click(function () {
        $("#tabs a").removeClass("visited");
        $("#modify-head-name").addClass("visited");
        $.ajax({
            url: "/FrontCustomer/ModifyNameOrHead",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//地址管理
$(function () {
    $("#address-manage").click(function () {
        $("#tabs a").removeClass("visited");
        $("#address-manage").addClass("visited");
        $.ajax({
            url: "/FrontCustomer/AddressManagement",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//收藏夹
$(function () {
    $("#favorite").click(function () {
        $("#tabs a").removeClass("visited");
        $("#favorite").addClass("visited");
        $.ajax({
            url: "/FrontCustomer/Favorite",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//全部订单
$(function () {
    $("#allOrder").click(function () {
        $("#tabs a").removeClass("visited");
        $("#allOrder").addClass("visited");
        $.ajax({
            url: "/FrontOrder/AllOrder",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//待付款
$(function () {
    $("#pending-payment").click(function () {
        $("#tabs a").removeClass("visited");
        $("#pending-payment").addClass("visited");
        $.ajax({
            url: "/FrontOrder/PendingPayment",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//代发货
$(function () {
    $("#waiting-delivery").click(function () {
        $("#tabs a").removeClass("visited");
        $("#waiting-delivery").addClass("visited");
        $.ajax({
            url: "/FrontOrder/WaiteDelivery",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//待收货
$(function () {
    $("#receiving-goods").click(function () {
        $("#tabs a").removeClass("visited");
        $("#receiving-goods").addClass("visited");
        $.ajax({
            url: "/FrontOrder/ReceiveGoods",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//待评价
$(function () {
    $("#pending-evaluation").click(function () {
        $("#tabs a").removeClass("visited");
        $("#pending-evaluation").addClass("visited");
        $.ajax({
            url: "/FrontOrder/PendingEvaluation",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//修改密码
$(function () {
    $("#modify-password").click(function () {
        $("#tabs a").removeClass("visited");
        $("#modify-password").addClass("visited");
        $.ajax({
            url: "/FrontCustomer/ModifyPassword",
            dataType: "html",
            data: { },
            success: function (data) {
                $("#right").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});

//选择收货地址
$(".itemAddress").click(function () {
    $(".choosed-block").removeClass("choosed");
    $(this).find(".choosed-block").addClass("choosed");
    var addressId = parseInt($(".itemAddress .choosed").attr("id"));
    $("#deliveryAdderssId").val(addressId);
    $.ajax({
        url: "/FrontCustomer/SureChoosedAddress",
        dataType: "html",
        data: { "addressId": addressId },
        success: function (data) {
            $("#sureAddress").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
});
$(document).ready(function () {
    var sum = 0;
    //var obj = document.getElementsByName('subtotal');
    $.each($("input[name='subtotal']"), function () {
        sum += parseFloat(this.value);
    });
    //for (i = 0; i < obj.length; i++) {
    //    sum += parseFloat(obj[i].value)
    //}
    //var num = 22.127456; alert(Math.round(num * 100) / 100);
    $("#actual_pay").val(Math.round(sum * 100) / 100);
});