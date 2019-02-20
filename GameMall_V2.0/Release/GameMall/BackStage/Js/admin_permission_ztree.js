var zNodes
$(document).ready(function () {
    var adminId = $("#adminId").val();
    $.ajax({
        url: "/Admin/AdminPermissionsTree",
        dataType: "json",
        data: { "adminId": adminId },
        success: function (data) {
            zNodes = data.Data;
            var setting = {
                view: {
                    selectedMulti: false
                },
                check: {
                    enable: true
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                },
            };
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
});

function sure_permissions_jbt() {
    var adminId = $("#adminId").val();
    if (adminId == 1) {
        alert("此管理员权限不可修改!");
        return;
    }
    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    var checkedNodes = treeObj.getCheckedNodes(true);
    var permissionsIdStr = "";
    for (i = 0; i < checkedNodes.length; i++) {
        if (i == checkedNodes.length - 1) {
            permissionsIdStr += checkedNodes[i].id;
        } else {
            permissionsIdStr += checkedNodes[i].id + ";";
        }
    }
    $.ajax({
        url: "/Admin/AdminPermissionsTree",
        type: "POST",
        dataType: "html",
        data: { "adminId": adminId, "permissionsIdStr": permissionsIdStr },
        success: function (data) {
            alert("修改成功!!!")
            window.location = "AdminList"
        },
        error: function () {
            alert("请求出错处理");
        }
    });

}