using GameMall_Back.ViewModels;
using GameMall_Back.ViewModels.Goods;
using GameMall_Data.Service;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Back.Controllers
{
    public class LayoutController : Controller
    {
        // GET: Layout
        MenuService menuService = new MenuService();
        UserService us = new UserService();
        public ActionResult SidebarMenu()
        {
            var adminId = (int)Session["AdminId"];
            var menu = menuService.GetAllMenu(adminId);
            List<ViewModelMenu> menuDTO = menu.Select(item => new ViewModelMenu
            {
                Id = item.Id,
                Name = item.Name,
                ParentId = item.ParentId,
                Icon = item.Icon,
                Url = item.Url,
                ChildMenu = ChildMenu(item.Id),
            }).ToList();
            return PartialView(menuDTO);
        }
        private List<ViewModelMenu> ChildMenu(Guid parentId)
        {
            var childMenu = menuService.GetMenuChild(parentId);
            List<ViewModelMenu> childMenuDTO = childMenu.Select(item => new ViewModelMenu
            {
                Id = item.Id,
                Name = item.Name,
                ParentId = item.ParentId,
                Icon = item.Icon,
                Url = item.Url,
                ChildMenu = ChildMenu(item.Id),
            }).ToList();
            return childMenuDTO;
        }
    }
}