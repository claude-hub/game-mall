//首页商城下拉菜单
$("#shop").hover(function () {
    $("#hidden").slideDown(300);
},
function () {
    $("#hidden").slideUp(400);
});
//网页轮播
(function () {
    Slider.init({
        target: $('.slider'),
        time: 2000
    });
})();

//详情页选项卡切换
$("#qh1").click(function () { 
    for (i = 1; i <= 6; i++)
    {
        if (i == 1) {
            $("#hidden1").show();
            $("#qh1").css("border-top", "4px solid #27a9e3");
        }
        else
        {
            $("#qh" + i).css("border-top", "0");
            $("#hidden" + i).hide();
        }
    }  
})
$("#qh2").click(function () {
    for (i = 1; i <= 6; i++) {
        if (i == 2) {
            $("#hidden2").show();
            $("#qh2").css("border-top", "4px solid #27a9e3");
        }
        else
        {
            $("#qh" + i).css("border-top", "0");
            $("#hidden" + i).hide();
        }
    }
})
$("#qh3").click(function () {
    for (i = 1; i <= 6; i++) {
        if (i == 3) {
            $("#hidden3").show();
            $("#qh3").css("border-top", "4px solid #27a9e3");
        }
        else
        {
            $("#qh" + i).css("border-top", "0");
            $("#hidden" + i).hide();
        }
    }
})
$("#qh4").click(function () {
    for (i = 1; i <= 6; i++) {
        if (i == 4) {
            $("#hidden4").show();
            $("#qh4").css("border-top", "4px solid #27a9e3");
        }
        else
        {
            $("#qh" + i).css("border-top", "0");
            $("#hidden" + i).hide();
        }
    }
})
$("#qh5").click(function () {
    for (i = 1; i <= 6; i++) {
        if (i == 5) {
            $("#hidden5").show();
            $("#qh5").css("border-top", "4px solid #27a9e3");
        }
        else
        {
            $("#qh" + i).css("border-top", "0");
            $("#hidden" + i).hide();
        }
    }
})
$("#qh6").click(function () {
    for (i = 1; i <= 6; i++) {
        if (i == 6) {
            $("#hidden6").show();
            $("#qh6").css("border-top", "4px solid #27a9e3");
        }
        else
        {
            $("#qh" + i).css("border-top", "0");
            $("#hidden" + i).hide();
        }
    }
})

//商品数量加、减
$("#plus").click(function () {
    var num_plus = parseInt($("#number").val()) + 1;
    if ($("#number").val() == "") {
        num_plus = 1;
    }
    $("#number").val(num_plus);
    $("#GoodsNumber").val(num_plus);
})
$("#reduce").click(function () {
    var num_reduce = parseInt($("#number").val()) - 1;
    if (num_reduce <= 0) {
        $("#number").val(1);
        $("#GoodsNumber").val(1);
    } else {
        $("#number").val(num_reduce);
        $("#GoodsNumber").val(num_reduce);
    }
})
//$("#GoodsNumber").val(parseInt($("#number").val()));

//选择游戏版本
$(".versions li").click(function () {
    $(".versions li").removeClass("choosed");
    $(this).addClass("choosed");
    var versionId = parseInt($(".versions .choosed").attr("id"));
    $("#versionId").val(versionId);

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
