function AddToShoppingCar() {
    var versionId = parseInt($(".versions .choosed").attr("id"));
    $("#versionId").val(versionId);
    var goodsId = $("#goodsId").val();
    var GoodsNumber = $("#GoodsNumber").val();
    var versionId = $("#versionId").val();
    var customerId = $("#customerId").val();
    if (customerId == "") {
        alert("请登录！");
        return;
    }
    $.ajax({
        url: "/FrontGoods/AddShoppingCar",
        dataType: "html",
        data: { "goodsId": goodsId, "orderGoodsNumber": GoodsNumber, "versionId": versionId },
        success: function (data) {
            alert("加入成功!");
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
$(document).ready(function () {
    var versionId = parseInt($(".versions .choosed").attr("id"));
    var goodsId = $("#goodsId").val();
    $.ajax({
        url: "/FrontGoods/CheckIfSell",
        dataType: "html",
        data: { "versionId": versionId, "goodsId": goodsId },
        success: function (data) {
            $("#btn").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
});