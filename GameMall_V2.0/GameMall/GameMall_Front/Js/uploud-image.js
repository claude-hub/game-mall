$(document).ready(function () {
    $("#head").on("change", function () {
        var goodsTypeImage = this.files[0];
        if (this.files[0] && goodsTypeImage) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#head").prev().attr("src", e.target.result);
            }
            reader.readAsDataURL(goodsTypeImage);
        }
    })
})