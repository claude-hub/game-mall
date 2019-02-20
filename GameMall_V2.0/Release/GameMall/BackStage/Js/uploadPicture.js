//上传一张图片
$(document).ready(function () {
    $(".version_image").on("change", function () {
        var goodsTypeImage = this.files[0];
        if (this.files[0] && goodsTypeImage) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $(".version_image").prev().attr("src", e.target.result);
            }
            reader.readAsDataURL(goodsTypeImage);
        }
    })
    var goodsId = $("#goodsId").val();
    $('#file-zh').fileinput({
        language: 'zh',
        uploadUrl: '/Goods/UploadScreenshot?GoodsId=' + goodsId,
        allowedFileExtensions: ['jpg', 'png', 'gif'],
    });
})
