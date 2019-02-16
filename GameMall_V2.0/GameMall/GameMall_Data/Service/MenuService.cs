using GameMall_Data.Data;
using GameMall_Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameMall_Data.Service
{
    public class MenuService
    {
        private GameMallDBContext _x;
        public MenuService()
        {
            _x = new GameMallDBContext();
        }
        //添加权限
        public void AddPermission(string name, string code)
        {
            _x.Permissions.Add(
                new Permissions
                {
                    PermissionId = Guid.NewGuid(),
                    Name = name,
                    Code = code,
                    CreationTime = DateTime.Now,
                }
                );
            _x.SaveChanges();
        }
        //添加角色
        public void AddRole(string name, string code)
        {
            _x.Roles.Add(
                new Roles
                {
                    RoleId = Guid.NewGuid(),
                    Name = name,
                    Code = code,
                    CreationTime = DateTime.Now,
                }
                );
            _x.SaveChanges();
        }
        //添加菜单
        public void AddMenu(string name, string code, string url)
        {
            _x.Menu.Add(
                new Menu
                {
                    MenuId = Guid.NewGuid(),
                    Name = name,
                    Code = code,
                    Url = url,
                }
                );
            _x.SaveChanges();
        }
        //获取管理员所有菜单
        public List<NewMenu> GetAllMenu(int adminId)
        {
            List<Menu> menu = _x.Menu.ToList().Where(item => item.ParentId == new Guid("00000000-0000-0000-0000-000000000000")).ToList();
            List<Permissions> userPermissions = GetAdminPermissions(adminId);
            List<Menu> menuLsit = FindUsersMenu(userPermissions, menu);
            List<NewMenu> newMenu = new List<NewMenu>();
            foreach (var item in menuLsit)
            {
                newMenu.Add(new NewMenu
                {
                    Id = item.MenuId,
                    ParentId = item.ParentId,
                    Name = item.Name,
                    Icon = item.Icon,
                    Url = item.Url,
                    Childrens = GetMenuChild(item.MenuId)
                });
            }
            return newMenu;
        }
        //获取管理员权限
        public List<Permissions> GetAdminPermissions(int adminId)
        {
            var permisssions = _x.Permissions.Where(item => item.Admin.Any(m => m.AdminId == adminId)).ToList();
            var role = _x.Permissions.Where(item => item.Roles.Any(m => m.Admin.Any(q => q.AdminId == adminId))).ToList();
            var allPermissions = new List<Permissions>();
            return permisssions.Union(role).ToList();
        }
        //查找管理员菜单
        private List<Menu> FindUsersMenu(List<Permissions> userPermissions, List<Menu> menu)
        {
            List<Menu> menuList = new List<Menu>();
            foreach (var item in userPermissions)
            {
                foreach (var i in menu)
                {
                    if (item.Code.StartsWith(i.Code) && !menuList.Contains(i))
                    {
                        menuList.Add(i);
                    }
                }
            }
            return menuList;
        }
        //获取子菜单
        public List<NewMenu> GetMenuChild(Guid parentId)
        {
            List<Menu> childs = _x.Menu.ToList().Where(item => item.ParentId == parentId).ToList();
            List<NewMenu> childrens = new List<NewMenu>();
            if (childs.Count > 0)
            {
                foreach (var item in childs)
                {
                    childrens.Add(new NewMenu
                    {
                        Id = item.MenuId,
                        ParentId = item.ParentId,
                        Name = item.Name,
                        //Icon = item.Icon,
                        Url = item.Url,
                        Childrens = GetMenuChild(item.MenuId)
                    });
                }
            }
            return childrens;
        }
        public List<Permissions> GetAllPermissions() {
            return _x.Permissions.ToList();
        }
        public void Dispose()
        {
            _x.Dispose();
            //throw new NotImplementedException();
        }
    }
}
