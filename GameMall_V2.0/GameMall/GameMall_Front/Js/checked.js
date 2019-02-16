$(function () {
    $("input[name='chooseAll']").click(function () {
        //判断当前点击的复选框处于什么状态$(this).is(":checked") 返回的是布尔类型
        if ($(this).is(":checked")) {
            $("input[name='choose']").prop("checked", true);
            $("input[name='chooseAll']").prop("checked", true);
        } else {
            $("input[name='choose']").prop("checked", false);
            $("input[name='chooseAll']").prop("checked", false);
        }
    });
    $("#delete_choosed").click(function () {
        var obj = document.getElementsByName('choose'); //选择所有name="'choose'"的对象，返回数组 
        //取到对象数组后，我们来循环检测它是不是被选中 
        var ShoppingCarIdStr = '';
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].checked)
                if (i == obj.length - 1) {
                    ShoppingCarIdStr += obj[i].value;
                } else {
                    ShoppingCarIdStr += obj[i].value + ','; //如果选中，将value添加到变量s中 
                }
        }
        $.ajax({
            url: "/FrontCustomer/DeleteShopingCarGoods",
            dataType: "html",
            data: { "ShoppingCarIdStr": ShoppingCarIdStr },
            success: function (data) {
       
                $("#ItemShoppingCar").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
    $("#Settlement_button").click(function () {
        var obj = document.getElementsByName('choose'); //选择所有name="'choose'"的对象，返回数组 
        var goodsNumberObj = document.getElementsByName('goodsNumber'); //选择所有name="'choose'"的对象，返回数组 
        //取到对象数组后，我们来循环检测它是不是被选中 
        var jsonStr = '';
        var goodsNumberStr = '';
        for (var i = 0; i < obj.length; i++) {
            for (var j = 0 ; j < goodsNumberObj.length; j++) {

                if (obj[i].checked)
                    if (i == obj.length - 1) {
                        if (obj[i].value == goodsNumberObj[j].attributes.id.nodeValue) {
                            jsonStr += obj[i].value;
                            goodsNumberStr += goodsNumberObj[j].value;
                        }
                    } else {
                        if (obj[i].value == goodsNumberObj[j].attributes.id.nodeValue) {
                            jsonStr += obj[i].value + ",";
                            goodsNumberStr += goodsNumberObj[j].value + ",";
                        }
                    }
            }
        }
        $("#shoppingCarId").val(jsonStr);
        $("#goodsNumber").val(goodsNumberStr);
        if (jsonStr != '' && goodsNumberStr != '') {
            $("#shoppingCarForm").submit();
        } else {
            alert("请选择商品");
        }
    });
    //商品数量加、减
    $(".plus").click(function () {
        var num_plus = parseInt($(this).prev().val()) + 1;
        $(this).prev().val(num_plus)
    })
    $(".reduce").click(function () {
        var num_reduce = parseInt($(this).next().val()) - 1;
        if (num_reduce <= 0) {
            $(this).next().val(1);
        }
        else {
            $(this).next().val(num_reduce)
        }
    })
});
