using GameMall_Back.Filter;
using GameMall_Back.ViewModels;
using GameMall_Back.ViewModels.Admin;
using GameMall_Data.Data;
using GameMall_Data.Service;
using Newtonsoft.Json;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Security;

namespace GameMall_Back.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        UserService us = new UserService();
        public ActionResult Index()
        {
            return View();
        }
        [LoginFilter(IfCheck = false)]
        public ActionResult AdminLogin()
        {
            return View();
        }
        [LoginFilter(IfCheck = false)]
        public ActionResult Logout()
        {
            Session["AdminId"] = null;
            return PartialView("AdminLogin");
        }
        [HttpPost]
        [LoginFilter(IfCheck = false)]
        public ActionResult AdminLogin(string UserName, string Password)
        {
            var user = us.Login(UserName, Password);
            if (user != null)
            {
                var admin = us.IfAdmin(user);
                if (admin != null)
                {
                    Session.Add("AdminId", admin.AdminId);
                    Session.Add("AdminName", admin.Users.UserName);
                    AdminLog adminLog = new AdminLog()
                    {
                        AdminId = admin.AdminId,
                        OperationRecord = "登录",
                        OperatorTime = DateTime.Now,
                        IP = us.GetAddressIP(),
                    };
                    us.AddAdminLog(adminLog);
                    return Redirect("/Admin/Index");
                }
                else
                {
                    TempData["DataError"] = "账号或密码错误！";
                    return Redirect("/Admin/AdminLog");
                }
            }
            else
            {
                TempData["DataError"] = "账号或密码错误或用户不存在！";
                return Redirect("/Admin/AdminLogin");
            }
        }
        public ActionResult GetCustomerName(int CustomerId)
        {
            var customer = us.GetCustomerByCustomerId(CustomerId);
            var userName = customer.Users.UserName;
            var user = new ViewModelUsers()
            {
                UserName = userName,
            };
            return View(user);
        }
        public ActionResult AdminPermissions(int AdminId)
        {
            return View(AdminId);
        }
        public ActionResult SelectRole()
        {
            var roleList = us.GetRoleList();
            var roleListDTO = roleList.Select(item => new ViewModeRoles
            {
                Code = item.Code,
                Name = item.Name,
                RoleId = item.RoleId,
                CreationTime = item.CreationTime,
            }).ToList();
            return View(roleListDTO);
        }
        public JsonResult AdminPermissionsTree(int adminId)
        {
            //该管理员的权限
            var adminPermissions = us.GetPermissionsByAdminId(adminId);
            var allPermissions = us.GetAllPermissions();
            var permissionsTree =new List<ZTree>();

            foreach (var allP in allPermissions)
            {
                var ztree = new ZTree();
                ztree.id = allP.PermissionId;
                ztree.name = allP.Name;
                ztree.pId = allP.PermissionPId;
                if(allP.PermissionPId.ToString() == "00000000-0000-0000-0000-000000000000")
                {
                    ztree.open = true;
                }
                foreach (var adminP in adminPermissions)
                {
                    if(allP.PermissionId == adminP.PermissionId)
                    {
                        ztree.@checked = true;
                    }
                }
                permissionsTree.Add(ztree);
            }
            JsonResult json = new JsonResult
            {
                Data = permissionsTree
            };
            return Json(json, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult AdminPermissionsTree(int adminId,string permissionsIdStr)
        {
            //var sr = new StreamReader(Request.InputStream);
            //var stream = sr.ReadToEnd();
            var str = permissionsIdStr.Split(';');
            if (str == null)
            {
                return null;
            }
            var permissions = new List<Permissions>();
            foreach (var item in str)
            {
                var permission = new Permissions();
                permission.PermissionId = new Guid(item);
                permissions.Add(permission);
            }
            us.EditAdminPermissions(permissions,adminId);
            return null;
        }
        public ActionResult RoleList()
        {
            var roleList = us.GetRoleList();
            var roleListDTO = roleList.Select(item => new ViewModeRoles
            {
                Code = item.Code,
                Name = item.Name,
                RoleId = item.RoleId,
                CreationTime = item.CreationTime,
            }).ToList();
            return View(roleListDTO);
        }
        
        public ActionResult AssignPermissions(Guid RoleId)
        {
            var role  = us.GetRoleByRoleId(RoleId);
            var roleDTO = new ViewModeRoles()
            {
                Code = role.Code,
                CreationTime = role.CreationTime,
                Name=role.Name,
                RoleId=role.RoleId,
            };
            return PartialView(roleDTO);
        }
        public ActionResult AddRole()
        {
            return View();
        }
        public JsonResult AddRolePermissionsTree()
        {
            var allPermissions = us.GetAllPermissions();
            var permissionsTree = new List<ZTree>();

            foreach (var allP in allPermissions)
            {
                var ztree = new ZTree();
                ztree.id = allP.PermissionId;
                ztree.name = allP.Name;
                ztree.pId = allP.PermissionPId;
                if (allP.PermissionPId.ToString() == "00000000-0000-0000-0000-000000000000")
                {
                    ztree.open = true;
                }
                permissionsTree.Add(ztree);
            }
            JsonResult json = new JsonResult
            {
                Data = permissionsTree
            };
            return Json(json, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult AddRolePermissionsTree(string RoleName,string RoleCode,string permissionsIdStr)
        {
            var str = permissionsIdStr.Split(';');
            var permissions = new List<Permissions>();
            foreach (var item in str)
            {
                var permission = new Permissions();
                permission.PermissionId = new Guid(item);
                permissions.Add(permission);
            }
            us.AddRolePermissions(RoleName, RoleCode,permissions);
            return null;
        }


        public JsonResult RolePermissionsTree(Guid roleId)
        {
            //该角色的权限
            var rolePermissions = us.GetRolePermissions(roleId);
            var allPermissions = us.GetAllPermissions();
            var permissionsTree = new List<ZTree>();

            foreach (var allP in allPermissions)
            {
                var ztree = new ZTree();
                ztree.id = allP.PermissionId;
                ztree.name = allP.Name;
                ztree.pId = allP.PermissionPId;
                if (allP.PermissionPId.ToString() == "00000000-0000-0000-0000-000000000000")
                {
                    ztree.open = true;
                }
                foreach (var roleP in rolePermissions)
                {
                    if (allP.PermissionId == roleP.PermissionId)
                    {
                        ztree.@checked = true;
                    }
                }
                permissionsTree.Add(ztree);
            }
            JsonResult json = new JsonResult
            {
                Data = permissionsTree
            };
            return Json(json, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult RolePermissionsTree(Guid roleId, string permissionsIdStr,string RoleName,string RoleCode)
        {
            var str = permissionsIdStr.Split(';');
            var permissions = new List<Permissions>();
            foreach (var item in str)
            {
                var permission = new Permissions();
                permission.PermissionId = new Guid(item);
                permissions.Add(permission);
            }
            us.EditRole(roleId,RoleName, RoleCode);
            us.EditRolePermissions(permissions, roleId);
            return null;
        }
        public ActionResult AdminList()
        {
            var adminList = us.GetAdminList();
            var adminListDTO = adminList.Select(item => new ViewModelAdmin
            {
                AdminId=item.AdminId,
                UserId=item.UserId,
            }).ToList();
            return PartialView(adminListDTO);
        }
        public ActionResult RoleName(ViewModelAdmin admin)
        {
            var role = us.GetRoleList(admin.AdminId);
            var roleDTO = role.Select(item => new ViewModeRoles()
            {
                RoleId = item.RoleId,
                Name = item.Name,
            }).ToList();
            return View(roleDTO);
        }
        public ActionResult AdminItem(ViewModelAdmin admin)
        {
            var user = us.GetUserByAdminId(admin.UserId);
            var userDTO = new ViewModelUsers
            {
                UserName=user.UserName,
                CreationTime = user.CreationTime,
                Head = user.Head,
                RealName=user.RealName,
                Password = user.Password,
                PhoneNumber = user.PhoneNumber,
                UserId = user.UserId,
            };
            return PartialView(userDTO);
        }
        public ActionResult AddAdmin()
        {
            ViewModelUsers user = new ViewModelUsers();
            return View(user);
        }
        [HttpPost]
        public ActionResult AddAdmin(ViewModelUsers viewModelUser,Guid RoleId)
        {
            if (User != null)
            {
                Users user = new Users
                {
                    UserName = viewModelUser.UserName,
                    RealName = viewModelUser.RealName,
                    PhoneNumber = viewModelUser.PhoneNumber,
                    Password = viewModelUser.Password,
                    CreationTime = DateTime.Now, 
                };
                us.AddUser(user,RoleId);
                return RedirectToAction("AdminList", "Admin");
            }
            return PartialView();
        }
        public ActionResult AdminLog()
        {
            return View();
        }
        public ActionResult AdminLogList(string searchKey, int? page)
        {
            var adminLogs = us.GetAdminLogsBySearch(searchKey);   
            var adminLogsDTO = adminLogs.Select(item => new ViewModelAdminLog()
            {
                AdminId = item.AdminId,
                AdminLogId = item.AdminLogId,
                IP = item.IP,
                OperationRecord = item.OperationRecord,
                OperatorTime = item.OperatorTime,
            }).ToList();
         
            int pageNumber = page ?? 1;
            int pageSize = 5;
            var list = adminLogsDTO.ToPagedList(pageNumber, pageSize);
            return View(list);
        }
    }
}
