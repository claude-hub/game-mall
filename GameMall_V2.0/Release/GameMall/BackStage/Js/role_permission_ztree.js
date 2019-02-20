var zNodes
$(document).ready(function () {
    var roleId = $("#roleId").val();
    $.ajax({
        url: "/Admin/RolePermissionsTree",
        dataType: "json",
        data: { "roleId": roleId },
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

function sure_role_permissions() {
    var RoleName = $("#RoleName").val();
    var RoleCode = $("#RoleCode").val();
    var roleId = $("#roleId").val();
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
        url: "/Admin/RolePermissionsTree",
        type: "POST",
        dataType: "html",
        data: { "roleId": roleId, "permissionsIdStr": permissionsIdStr, "RoleName": RoleName, "RoleCode": RoleCode },
        success: function (data) {
            alert("分配成功!!!")
            window.location = "RoleList"
        },
        error: function () {
            alert("请求出错处理");
        }
    });

}