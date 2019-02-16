using GameMall_Data.Data;
using GameMall_Data.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameMall_Data
{
    class Program
    {
        static void Main(string[] args)
        {
            //MenuService menu = new MenuService();
            //UserService us = new UserService();
            ////创建用户
            //var user1 = new Users()
            //{
            //    CreationTime = DateTime.Now,
            //    UserName = "Admin",
            //    PhoneNumber = "15223246130",
            //    Password = "123456",
            //};
            //us.AddUserByCon(user1);
            //var user2 = new Users()
            //{
            //    CreationTime = DateTime.Now,
            //    UserName = "Cloudy",
            //    PhoneNumber = "123456789",
            //    Password = "123456",
            //};
            //us.AddCustomer(user2); ;
            ////创建权限
            //menu.AddPermission("商品中心", "GoodsCenter");
            //menu.AddPermission("添加商品", "GoodsCenter.GoodsList.AddGoods");
            //menu.AddPermission("修改商品", "GoodsCenter.GoodsList.ModifyGoods");
            //menu.AddPermission("上架商品", "GoodsCenter.GoodsList.ShelvesGoods");
            //menu.AddPermission("回复评论", "GoodsCenter.CustomerComments.Reply");
            //menu.AddPermission("删除评论", "GoodsCenter.CustomerComments.Delete");

            //menu.AddPermission("仓库中心", "WarehouseCenter");
            //menu.AddPermission("仓库日志", "WarehouseCenter.WarehouseLog");
            //menu.AddPermission("创建仓库", "WarehouseCenter.CreatWarehouse");

            //menu.AddPermission("权限中心", "PermissionsCenter");
            //menu.AddPermission("添加管理员", "PermissionsCenter.AdminList.AddAdmin");
            //menu.AddPermission("分配权限", "PermissionsCenter.AdminList.AssignPermissions");
            //menu.AddPermission("编辑管理员", "PermissionsCenter.AdminList.EditAdmin");
            //menu.AddPermission("删除管理员", "PermissionsCenter.AdminList.DeleteAdmin");
            //menu.AddPermission("管理员日志", "PermissionsCenter.AdminLog");
            //menu.AddPermission("添加角色", "PermissionsCenter.RoleList.AddRole");
            //menu.AddPermission("删除角色", "PermissionsCenter.RoleList.DeleteRole");


            //menu.AddPermission("订单中心", "OrderCenter");
            //menu.AddPermission("查看订单", "OrderCenter.OrderList.OrderList");
            //menu.AddPermission("生成发货单", "OrderCenter.OrderList.GenerateInvoice");
            //menu.AddPermission("查看发货单", "OrderCenter.InvoiceList");
            //menu.AddPermission("发货", "OrderCenter.InvoiceList.Deliver");
            ////menu.AddPermission("缺货登记", "OrderCenter.ShortageRegistration");
            ////menu.AddPermission("添加订单", "OrderCenter.AddOrder");

            ////menu.AddPermission("广告中心", "AdCenter");
            ////menu.AddPermission("修改广告", "AdCenter.AdList.Modify");
            ////创建菜单             添加父类ID
            //menu.AddMenu("商品中心", "GoodsCenter", "");
            //menu.AddMenu("商品列表", "GoodsCenter.GoodsList", "/Goods/GoodsList");
            //menu.AddMenu("用户评论", "GoodsCenter.CustomerComments", "/Goods/Evaluation");

            //menu.AddMenu("仓库中心", "WarehouseCenter", "");
            //menu.AddMenu("仓库日志", "WarehouseCenter.WarehouseLog", "/Warehouse/StockLog");
            //menu.AddMenu("仓库列表", "WarehouseCenter.WarehouseList", "/Warehouse/WarehouseList");

            //menu.AddMenu("权限中心", "PermissionsCenter", "");
            //menu.AddMenu("管理员列表", "PermissionsCenter.AdminList", "/Admin/AdminList");
            //menu.AddMenu("管理员日志", "PermissionsCenter.AdminLog", "/Admin/AdminLog");
            //menu.AddMenu("角色列表", "PermissionsCenter.RoleList", "/Admin/RoleList");

            //menu.AddMenu("订单中心", "OrderCenter", "");
            //menu.AddMenu("订单列表", "OrderCenter.OrderList", "/Order/OrderList");
            //menu.AddMenu("发货单列表", "OrderCenter.InvoiceList", "/Order/InvoiceList");
            ////menu.AddMenu("缺货登记", "OrderCenter.ShortageRegistration", "/Order/ShortageRegistration");
            ////menu.AddMenu("添加订单", "OrderCenter.AddOrder", "/Order/AddOrder");

            ////menu.AddMenu("广告中心", "AdCenter", "");
            ////menu.AddMenu("广告列表", "AdCenter.AdList", "/AdCenter/AdList");
            ////创建角色
            //menu.AddRole("销售管理员", null);

            //var admin = us.GetAdminList().First();
            //us.GiveAdminPermissions(admin);

            //Console.ReadKey();
        }
    }
}
